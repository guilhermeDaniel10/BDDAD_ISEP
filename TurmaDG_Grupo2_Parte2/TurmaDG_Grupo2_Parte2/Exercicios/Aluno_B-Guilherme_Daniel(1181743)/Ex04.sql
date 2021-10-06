-- FUNCAO fncObterRegistoMensalCamareira
 SET SERVEROUTPUT ON
 
  CREATE OR REPLACE FUNCTION fncObterRegistoMensalCamareira(mes int, ano int DEFAULT (EXTRACT (year from SYSDATE()) - 1))
        RETURN SYS_REFCURSOR AS
        idCamareira camareira.id%type;
        nomeCamareira funcionario.nome%type;
        valorTotal_consumos number;
        dataPrimeiroConsumo date;
        dataUltimoConsumo date;
        qtd_diasSemConsumo number;
        nmrDiasMes int;
        
        cursorConsumos SYS_REFCURSOR;
    
        BEGIN  
         
            IF mes < 1 OR mes > 12
            THEN
            RAISE no_data_found;
            END IF;
            
            SELECT COUNT(*) INTO nmrDiasMes
            FROM (select to_date('01-' || mes || '-' || ano,'dd-mm-yyyy')+level-1
            from dual
            connect by level <= TO_CHAR(LAST_DAY(to_date('01-' || mes || '-' || ano,'dd-mm-yyyy')),'DD'));      
         
            OPEN cursorConsumos FOR
            SELECT DISTINCT cam.id, func.nome, SUM(linha.preco_unitario), min(linha.data_registo),max(linha.data_registo), nmrDiasMes - count(DISTINCT linha.data_registo)
            FROM camareira cam, funcionario func, linha_conta_consumo linha
            WHERE cam.id = linha.id_camareira AND EXTRACT(MONTH FROM linha.data_registo) = mes AND EXTRACT(YEAR FROM linha.data_registo) = ano AND cam.id = func.id
            GROUP BY cam.id, func.nome;
 
            
        RETURN cursorConsumos;
        EXCEPTION WHEN no_data_found THEN RETURN NULL;  
        END;
            
        
    -- TESTE  
    
    DECLARE
    -- Alterar valores neste parâmetro para ver os diferentes resultados do teste
    cursorConsumos SYS_REFCURSOR := fncObterRegistoMensalCamareira(2,2020);
    idCamareira camareira.id%type;
    nomeCamareira funcionario.nome%type;
    valorTotal_consumos number;
    dataPrimeiroConsumo date;
    dataUltimoConsumo date;
    qtd_diasSemConsumo number;
    
    BEGIN
        IF cursorConsumos IS NULL
        THEN
            DBMS_OUTPUT.PUT_LINE('Valores inválidos!');
        ELSE   

    LOOP
        FETCH cursorConsumos INTO idCamareira, nomeCamareira,valorTotal_consumos,dataPrimeiroConsumo,dataUltimoConsumo, qtd_diasSemConsumo;
        EXIT WHEN cursorConsumos%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('idCamareira: ' || idCamareira ||' | Nome: '|| nomeCamareira  ||' | Valor total: '||  valorTotal_consumos||' | Data primeiro registo: '|| dataPrimeiroConsumo ||' | Data ultimo registo: ' || dataUltimoConsumo || ' | Qtd dias sem registos: ' || qtd_diasSemConsumo);
    END LOOP;
    END IF;
        IF cursorConsumos%ROWCOUNT=0 THEN
        DBMS_OUTPUT.PUT_LINE('Não há dados para a data inserida!');
        END IF;    
    END;
    

