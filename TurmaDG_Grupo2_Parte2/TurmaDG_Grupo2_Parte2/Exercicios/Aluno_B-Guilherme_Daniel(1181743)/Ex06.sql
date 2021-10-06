CREATE OR REPLACE TRIGGER trgCorrigirAlteracaoBonus
BEFORE UPDATE ON bonus
FOR EACH ROW
    DECLARE 
        pct50Bonus NUMBER;
        bonusMenor EXCEPTION;
        bonusMaior50Pct EXCEPTION;
    
    BEGIN 
        pct50Bonus := :old.valor_bonus + 0.5 * :old.valor_bonus;
        
        
        IF(:new.valor_bonus < :old.valor_bonus) THEN
            RAISE bonusMenor;
        END IF;
        
        IF(:new.valor_bonus > pct50bonus AND :old.valor_bonus != 0) THEN
            RAISE bonusMaior50Pct;
        END IF;    
        
    EXCEPTION
        WHEN bonusMenor THEN
            raise_application_error(-20000,'O bónus a atualizar é menor que o bónus previamente inserido');
        WHEN bonusMaior50Pct THEN
            raise_application_error(-20001,'O valor de aumento do bónus tem de ser no máximo 50%');
    END;    
    /
    -- TESTE
    
    INSERT INTO bonus(id_camareira,mes_bonus,ano_bonus,valor_bonus)
    VALUES(11,6,2020,100);
    INSERT INTO bonus(id_camareira,mes_bonus,ano_bonus,valor_bonus)
    VALUES(14,6,2020,100);
    
    -- Teste para um valor inferior ao valor de bónus previamente registado
    UPDATE bonus
    SET valor_bonus = 99
    WHERE id_camareira = 11 AND mes_bonus = 6 AND ano_bonus = 2020;
    -- Teste para um aumento superior a 50 %
    UPDATE bonus
    SET valor_bonus = 200
    WHERE id_camareira = 11 AND mes_bonus = 6 AND ano_bonus = 2020;
    -- Teste para um aumento inferior a 50 %
    UPDATE bonus
    SET valor_bonus = 149
    WHERE id_camareira = 11 AND mes_bonus = 6 AND ano_bonus = 2020;
    
    
    -- Teste para um valor inferior ao valor de bónus previamente registado
    UPDATE bonus
    SET valor_bonus = 99
    WHERE id_camareira = 14 AND mes_bonus = 6 AND ano_bonus = 2020;
    -- Teste pata um aumento superior a 50 %
    UPDATE bonus
    SET valor_bonus = 200
    WHERE id_camareira = 14 AND mes_bonus = 6 AND ano_bonus = 2020;
    -- Teste para um aumento inferior a 50 %
    UPDATE bonus
    SET valor_bonus = 149
    WHERE id_camareira = 14 AND mes_bonus = 6 AND ano_bonus = 2020;
    
    -- Mostrar os bonus para o mês de junho de 2020
    SELECT * 
    FROM bonus
    WHERE mes_bonus = 6;
    
    
    
    