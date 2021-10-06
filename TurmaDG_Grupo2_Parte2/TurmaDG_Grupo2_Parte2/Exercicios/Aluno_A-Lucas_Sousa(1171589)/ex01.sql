SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION fncReservaExistente(reserva_ID RESERVA.ID%type)
RETURN BOOLEAN AS reserva_no_sistema BOOLEAN;
reserva_existe CHAR(1);
BEGIN
SELECT 'Y' into reserva_existe
            from reserva r
            where r.id = reserva_ID;
RETURN (reserva_existe LIKE 'Y');
EXCEPTION

        WHEN NO_DATA_FOUND THEN
           RETURN FALSE;
end;
/

CREATE OR REPLACE FUNCTION fncEstadoAdequadoReserva(reserva_ID RESERVA.ID%type)
RETURN BOOLEAN AS reserva_estado_adquado BOOLEAN;
reserva_estado CHAR(1);
BEGIN
SELECT 'Y' into reserva_estado
            from reserva r
            where r.id = reserva_ID
            and (r.id_estado_reserva = 1);

RETURN (reserva_estado LIKE 'Y');
EXCEPTION

        WHEN NO_DATA_FOUND THEN
           RETURN FALSE;
end;
/

CREATE OR REPLACE FUNCTION fncReservaComQuartoAssociado(reserva_ID RESERVA.ID%type)
RETURN BOOLEAN AS reserva_estado_adquado BOOLEAN;
reserva_com_Quarto CHAR(1);
BEGIN
SELECT 'y' into reserva_com_Quarto
        from checkin c
        where c.id_reserva = reserva_ID;

RETURN (reserva_com_Quarto LIKE 'y');
EXCEPTION

        WHEN NO_DATA_FOUND THEN
           RETURN FALSE;
end;
/

create or replace FUNCTION fncGetQuartoReserva(reserva_ID RESERVA.ID%type)
    RETURN QUARTO%rowtype AS info_Quarto QUARTO%rowtype;

    BEGIN

        if( reserva_ID IS NULL ) then
            dbms_output.put_line('A reserva inserida é NULL!!!');
            RETURN NULL;
        end if;

        if( fncReservaExistente(reserva_ID) = FALSE ) then
            dbms_output.put_line('Na base de dados não temos a reserva: ' || reserva_ID);
           RETURN NULL;
        end if;

        if(fncReservaComQuartoAssociado(reserva_ID) = TRUE ) then
            dbms_output.put_line('Não é possivel atribuir um quarto uma vez que já existe um quarto para alocar a reserva: ' || reserva_ID);
            RETURN NULL;
        end if;

        if( fncEstadoAdequadoReserva(reserva_ID) = FALSE ) then
            dbms_output.put_line('O estado não é o adequado para a reserva: ' || reserva_ID);
            RETURN NULL;
        end if;

    SELECT q1.* INTO info_Quarto
        from quarto q1
        INNER JOIN andar a on a.id = q1.id_andar
        INNER JOIN (select q.id, count(*) AS num_Ocupacao from quarto q
                                                                    FULL OUTER JOIN checkin ci on ci.id_quarto = q.id
                                                                    WHERE EXTRACT (YEAR FROM ci.data) LIKE EXTRACT (YEAR FROM sysdate)
                                                                    GROUP BY q.id) ocupacao on ocupacao.id = q1.id
        where q1.id not in ( SELECT ci.id_quarto from checkin ci
                                                     full outer JOIN checkout co on ci.id_reserva = co.id_reserva
                                                     where co.id_reserva is null)
        and q1.id_tipo_quarto = (select id_tipo_quarto from reserva r where r.id = reserva_ID)
        and q1.lotacao_maxima <= (select r.nr_pessoas from reserva r where r.id = reserva_ID)
        ORDER BY a.nr_andar ASC, ocupacao.num_Ocupacao ASC
        FETCH FIRST 1 ROWS ONLY;

       return info_Quarto;

     EXCEPTION

        WHEN NO_DATA_FOUND THEN
           dbms_output.put_line('Não existem quartos disponíveis para alocar a reserva: ' || reserva_ID);
           RETURN NULL;

        WHEN OTHERS THEN
           dbms_output.put_line('CODIGO ERRO: ' || SQLCODE);
           dbms_output.put_line('DESCRICAO DO ERRO: ' || SQLERRM);
           return null;

end;
/
--TESTES--
--RESERVA CRIADA--
insert into reserva(id, id_cliente, nome, id_tipo_quarto, data, data_entrada, data_saida, nr_pessoas, preco, id_estado_reserva)
values(331993, 1, 'Cliente reserva 19977', 3, SYSDATE-1, SYSDATE+1, SYSDATE+7, 2, 500, 1);
DECLARE
    infoQuarto QUARTO%rowtype;
BEGIN
    infoQuarto := fncGetQuartoReserva(331993);
    DBMS_OUTPUT.PUT_LINE('Quarto para alocar -> ID DO QUARTO: ' || infoQuarto.ID || '; ID DO ANDRA: ' || infoQuarto.ID_ANDAR || '; NÚMERO DO QUARTO: '|| infoQuarto.NR_QUARTO || '; ID DO TIPO DE QUARTO: ' || infoQuarto.ID_TIPO_QUARTO || '; LOTÇÃO MÁXIMA: ' || infoQuarto.LOTACAO_MAXIMA);
END;
/
-- RESERVA NULL --
DECLARE
    infoQuarto QUARTO%rowtype;
    idReserva     Reserva.ID%type := '';
BEGIN
    infoQuarto := fncGetQuartoReserva(idReserva);
END;
/
-- QUARTO JÁ COM QUARTO ASSOCIADO --
DECLARE
    infoQuarto QUARTO%rowtype;
BEGIN
    infoQuarto := fncGetQuartoReserva(132);
END;
/
