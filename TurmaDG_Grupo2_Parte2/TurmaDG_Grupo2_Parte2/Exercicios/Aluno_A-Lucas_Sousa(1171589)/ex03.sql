CREATE OR REPLACE TRIGGER trgEpocasNaoSobrepostas
BEFORE INSERT OR UPDATE ON epoca
FOR EACH ROW
DECLARE
    sobreposicao int;
    sobreposicaoEXPT EXCEPTION;
    pragma AUTONOMOUS_TRANSACTION;
BEGIN
    IF INSERTING THEN
        SELECT count(e.id) INTO sobreposicao FROM epoca e WHERE ((e.data_ini <= :new.data_ini AND e.data_fim >= :new.data_ini)
                                                            OR (e.data_fim >= :new.data_fim AND e.data_ini <= :new.data_fim)
                                                            OR (e.data_ini > :new.data_ini AND e.data_ini < :new.data_fim));
        IF sobreposicao > 0 THEN
            RAISE sobreposicaoEXPT;
            END IF;
    END IF;

    IF UPDATING THEN
        SELECT count(e.id) INTO sobreposicao FROM epoca e WHERE e.id != :old.id
                                                            AND ((e.data_ini <= :new.data_ini AND e.data_fim >= :new.data_ini)
                                                            OR (e.data_fim >= :new.data_fim AND e.data_ini <= :new.data_fim)
                                                            OR (e.data_ini > :new.data_ini AND e.data_ini < :new.data_fim));
        IF sobreposicao > 0 THEN
            RAISE sobreposicaoEXPT;
        END IF;
    END IF;

    EXCEPTION
        WHEN sobreposicaoEXPT THEN
            RAISE_APPLICATION_ERROR(-20006,'Existe sobreposição entre as datas das época no sistema!!!');
END trgEpocasNaoSobrepostas;
--TESTES--
--INPUT--
insert into epoca (id,nome,data_ini,data_fim) values (111,'Epoca Transição',TO_DATE('03-03-2021','dd-mm-yyyy'),TO_DATE('01-10-2021','dd-mm-yyyy'));
--TRIGGER LEVANTADO--
UPDATE epoca SET data_ini=TO_DATE('02-07-2020','dd-mm-yyyy') WHERE id=2;
UPDATE epoca SET data_fim=TO_DATE('20-11-2020','dd-mm-yyyy') WHERE id=2;
insert into epoca (id,nome,data_ini,data_fim) values (112,'Epoca ERRADA',TO_DATE('03-03-2020','dd-mm-yyyy'),TO_DATE('01-10-2021','dd-mm-yyyy'));