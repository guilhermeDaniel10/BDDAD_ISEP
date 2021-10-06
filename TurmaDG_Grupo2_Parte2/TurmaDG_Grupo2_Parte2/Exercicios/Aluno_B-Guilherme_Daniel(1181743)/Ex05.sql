set serveroutput on;

CREATE OR REPLACE PROCEDURE prcAtualizarBonusCamareiras(mes int, ano int DEFAULT (EXTRACT (year from SYSDATE()))) AS
        idCamareira camareira.id%type;
        valorBonus number;
        valorTotalRegistos int;
        bonusTemValores int;
        

        CURSOR cur IS 
            SELECT DISTINCT cam.id, SUM(linha.preco_unitario) 
        FROM camareira cam, linha_conta_consumo linha
        WHERE cam.id = linha.id_camareira AND EXTRACT(MONTH FROM linha.data_registo) = mes AND EXTRACT (YEAR FROM linha.data_registo) = ano
        GROUP BY cam.id;
        
        BEGIN
        
        IF mes < 1 OR mes > 12
            THEN
            RAISE no_data_found;
            END IF;
            

        OPEN cur; 
           LOOP 
           FETCH cur into idCamareira, valorTotalRegistos;  
              EXIT WHEN cur%notfound;
              
            -- Verificar se a tabela tem valores para o determinado mês e ano para a tabela bonus
            SELECT COUNT(*) INTO bonusTemValores
            FROM bonus
            WHERE mes_bonus = mes AND ano_bonus = ano AND id_camareira = idCamareira; 
            
              IF valorTotalRegistos <= 100 THEN
                 valorBonus := 0;
                 END IF;
              IF  valorTotalRegistos > 100 AND valorTotalRegistos < 500 THEN
                 valorBonus := valorTotalRegistos * 0.05;
                END IF; 
                
              IF valorTotalRegistos >= 500 AND valorTotalRegistos <= 1000 THEN
                 valorBonus := valorTotalRegistos * 0.10;
                 END IF;
              IF valorTotalRegistos > 1000 THEN
                 valorBonus := valorTotalRegistos * 0.15;
                 
              END IF; 
            
              --Se nao existirem valores na tabela bonus para o respetivo mes e ano, sao inseridos valores as tabelas com as camareiras que fizeram registos
              --nesse mes e ano
              IF(bonusTemValores = 0 ) THEN
              INSERT INTO bonus(id_camareira,mes_bonus,ano_bonus,valor_bonus)
                 VALUES(idCamareira, mes, ano, 0); 
              END IF;
              --É feito o update pedido no enunciado
              UPDATE bonus
                SET valor_bonus = valorBonus
                WHERE id_camareira = idCamareira AND mes_bonus = mes AND ano_bonus = ano;
                DBMS_OUTPUT.PUT_LINE('Bonus da camareira com id ' || idCamareira || ', atualizado para ' || valorBonus || ' para ' || mes || '/' || ano);
              
                   
           END LOOP; 
           CLOSE cur;
           
           EXCEPTION WHEN no_data_found THEN
           DBMS_OUTPUT.PUT_LINE('O mês ' || mes || ' introduzido por parametro é inválido!');
        END;
    /            

-- Teste----------------------------------
set serveroutput on;
        DECLARE
            mes1 int;
            mes2 int;
            mes3 int;
            ano1 int;
            ano2 int;
        BEGIN
            mes1 := 1;
            mes2 := 2;
            mes3 := 3;
            ano1 := 2020;
            ano2 := 2019;
            -- Sem ano por parametro e com o mes de Janeiro (o ano por predefinicao será 2020)
            prcAtualizarBonusCamareiras(mes1);
            -- Teste para o mês de Fevereiro no ano 2020 e 2019. Não eistem quaisquer valores para 2019 sendo que não foram registados valores para esse ano
            prcAtualizarBonusCamareiras(mes2, 2020);
            prcAtualizarBonusCamareiras(mes2, 2019);
            -- Teste para o mês de Março
            prcAtualizarBonusCamareiras(mes3);
            --Teste para um meses inválidos
            prcAtualizarBonusCamareiras(13);
            prcAtualizarBonusCamareiras(-1);
            
            DBMS_OUTPUT.PUT_LINE('   ');
            DBMS_OUTPUT.PUT_LINE('Valores na tabela Bonus:');
            FOR cursoTestes IN (SELECT * FROM BONUS)
            LOOP 
                DBMS_OUTPUT.PUT_LINE('ID Camareira: ' || cursoTestes.id_camareira || ' | Mes: ' || cursoTestes.mes_bonus || ' | Ano: ' || cursoTestes.ano_bonus || ' | Valor de bonus: ' || cursoTestes.valor_bonus);
                
            END LOOP;  
            DBMS_OUTPUT.PUT_LINE('--------------------------------------');
        END;
        
        
