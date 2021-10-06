SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION get_linha_Reserva(id_reserva RESERVA.ID%type)
    RETURN RESERVA%rowtype
    AS linha_reserva RESERVA%rowtype;

BEGIN
        SELECT r.* INTO linha_reserva
        FROM reserva r where r.id = id_reserva;
    RETURN (linha_reserva);
EXCEPTION
      WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('Não existe reserva com o id: ' || id_reserva);
        RETURN NULL;
END;
/

create or replace PROCEDURE prcCheckOut(linha_reserva RESERVA%rowtype) AS
    -- VALIDATION --
    hasCheckin INTEGER;
    hasCheckout INTEGER;

    --EXCEPTION--
    parametrosInvalidos EXCEPTION;
    checkoutExistente EXCEPTION;
    
    --VARIABLES--
    numDias NUMBER DEFAULT 0;
    precoEpoca NUMBER DEFAULT 0;
    custo_extra INTEGER;

    --FATURA--
    valorFaturadoReserva FATURA.VALOR_FATURADO_RESERVA%type;
    valorFaturadoConsumo FATURA.VALOR_FATURADO_CONSUMO%type;
    linhaFatura NUMBER;
    consumoLinha NUMBER;

    --LINHA_FATURA--
    idContaConsumo LINHA_FATURA.ID_CONTA_CONSUMO%type;

BEGIN
    SELECT count(ci.id_reserva) INTO hasCheckin
        FROM checkin ci
        WHERE ci.id_reserva = linha_Reserva.id;

    SELECT count(co.id_reserva) INTO hasCheckout
        FROM checkout co
        WHERE co.id_reserva = linha_Reserva.id;

    IF(hasCheckin > 0) THEN
        IF(hasCheckout = 0) THEN
            INSERT INTO checkout(id_reserva, data)
            VALUES (linha_Reserva.id, linha_Reserva.DATA_SAIDA);
        ELSE    
           raise checkoutExistente;
        END IF;

        SELECT r.custo_extra INTO custo_extra FROM Reserva r WHERE r.id=linha_reserva.id;

        SELECT  ((r.DATA_SAIDA) - r.DATA_ENTRADA) into numDias
            FROM reserva r
            where r.id = linha_Reserva.id;

        SELECT pe.preco into precoEpoca
            FROM reserva r
            INNER JOIN checkin ci on ci.id_reserva = r.id
            INNER JOIN tipo_quarto tq ON tq.id = r.id_tipo_quarto
            INNER JOIN epoca e ON (r.data_entrada > e.data_ini AND r.data_entrada < e.data_fim) AND (r.data_saida > e.data_ini AND r.data_saida < e.data_fim)
            INNER JOIN Preco_epoca_tipo_quarto pe ON (tq.id = pe.id_tipo_quarto AND e.id = pe.id_epoca)
            WHERE r.id = linha_Reserva.id;

        IF custo_extra != null THEN
            valorFaturadoReserva := (numDias * precoEpoca) +custo_extra;
        ELSE
            valorFaturadoReserva := (numDias * precoEpoca);
        END IF;

        SELECT cc.id INTO idContaConsumo FROM Reserva r
                                            INNER JOIN Conta_consumo cc ON cc.id_reserva=r.id
                                            WHERE r.id=linha_reserva.id;


        INSERT INTO Fatura (id, numero, data, id_cliente, id_reserva, valor_faturado_reserva, valor_faturado_consumo)
        VALUES (linha_Reserva.id, (EXTRACT( YEAR FROM SYSDATE)*10000+linha_Reserva.id), linha_reserva.data_saida, linha_reserva.id_cliente, linha_reserva.id, valorFaturadoReserva, 0);


        linhaFatura:=0;
        valorFaturadoConsumo:=0;
        FOR i in (SELECT * FROM linha_conta_consumo lcc WHERE idContaConsumo = lcc.id_conta_consumo)
                LOOP
                    linhaFatura := linhaFatura + 1;
                    consumoLinha := (i.quantidade * i.preco_unitario);
                    valorFaturadoConsumo := consumoLinha + valorFaturadoConsumo;

                    INSERT INTO Linha_Fatura (id_fatura, linha, id_conta_consumo, linha_conta_consumo, valor_consumo)
                    VALUES (linha_Reserva.id, linhaFatura, idContaConsumo, i.linha, consumoLinha);
                END LOOP;

        UPDATE Fatura
        SET valor_faturado_consumo = valorFaturadoConsumo
        WHERE id = linha_reserva.id;

        ELSE
            raise parametrosInvalidos;
        END IF;

    EXCEPTION
        when checkoutExistente then
            raise_application_error(-20001, 'Já existe CHECKOUT!!!');
        when parametrosInvalidos then
            raise_application_error(-20001, 'Parametros inválidos, reserva sem checkin, ou linha NULL !!!');
end;
--TESTES--
--INPUT--
insert into reserva(id, id_cliente, nome, id_tipo_quarto, data, data_entrada, data_saida, nr_pessoas, preco, id_estado_reserva) values(19977, 1, 'Cliente reserva 19977', 3, SYSDATE-1, SYSDATE+1, SYSDATE+7, 4, 500, 1);
--CREATE CHECKIN--
insert into checkin(id_reserva, data, id_quarto) values (19977, SYSDATE+1, 3);
--CREATE CONTA_CONSUMO--
insert into conta_consumo(id, data_abertura, id_reserva) values(4000, SYSDATE+1, 19977);
--CRETE LINHA_CONTA_CONSUMO 1--
insert into linha_conta_consumo(id_conta_consumo, linha, id_artigo_consumo, data_registo, quantidade, preco_unitario, id_camareira) values(4000, 1, 11, SYSDATE+2, 3, 9, 14);
--CRETE LINHA_CONTA_CONSUMO 2--
insert into linha_conta_consumo(id_conta_consumo, linha, id_artigo_consumo, data_registo, quantidade, preco_unitario, id_camareira) values(4000, 2, 17, SYSDATE+2, 10, 15, 14);
--RESERVA CRIADA--
DECLARE
    linha_reserva RESERVA%rowtype;
BEGIN
    linha_reserva := get_linha_Reserva(19977);
    prcCheckOut(linha_reserva);
    FOR i IN (SELECT * FROM Checkout WHERE id_reserva = linha_reserva.id)
        LOOP
            DBMS_OUTPUT.PUT_LINE('Checkout gerado -> Id da Reserva = ' || i.id_reserva || '; Data = ' || i.data || '; Observações = ' || i.observacoes || '; Valor Extra = ' || i.valor_extra || '€;');
        end loop;
    for i in (SELECT * FROM Fatura WHERE id_reserva =  linha_reserva.id)
        LOOP
            DBMS_OUTPUT.PUT_LINE('Gerada Fatura -> Id = ' || i.id || '; Número = ' || i.numero || '; Id Cliente = ' || i.id_cliente || '; Id Reserva = ' || i.id_reserva || '; Valor Reserva = ' || i.valor_faturado_reserva || '€; Valor Consumo = ' || i.valor_faturado_consumo || '€;');
        end loop;
END;
--RESERVA NULL--
DECLARE
    linha_reserva RESERVA%rowtype;
BEGIN
    linha_reserva := get_linha_Reserva(3651);
    prcCheckOut(linha_reserva);
END;
--RESERVA SEM CHECKIN--
DECLARE
    linha_reserva RESERVA%rowtype;
BEGIN
    linha_reserva := get_linha_Reserva(3620);
    prcCheckOut(linha_reserva);
END;
--RESERVA COM CHECKOUT--
DECLARE
    linha_reserva RESERVA%rowtype;
BEGIN
    linha_reserva := get_linha_Reserva(3330);
    prcCheckOut(linha_reserva);
END;