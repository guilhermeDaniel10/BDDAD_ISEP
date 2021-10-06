-- ** eliminar tabelas se existentes **
-- CASCADE CONSTRAINTS para eliminar as restricoes de integridade das chaves primarias e chaves unicas
-- PURGE elimina a tabela da base de dados e da "reciclagem"
DROP TABLE quarto                   CASCADE CONSTRAINTS PURGE;
DROP TABLE andar                    CASCADE CONSTRAINTS PURGE;
DROP TABLE produto                  CASCADE CONSTRAINTS PURGE;
DROP TABLE conta                    CASCADE CONSTRAINTS PURGE;
DROP TABLE reserva                  CASCADE CONSTRAINTS PURGE;
DROP TABLE pagamento                CASCADE CONSTRAINTS PURGE;
DROP TABLE precoreserva             CASCADE CONSTRAINTS PURGE;
DROP TABLE funcionario              CASCADE CONSTRAINTS PURGE;
DROP TABLE fatura                   CASCADE CONSTRAINTS PURGE;
DROP TABLE cliente                  CASCADE CONSTRAINTS PURGE;
DROP TABLE rececao                  CASCADE CONSTRAINTS PURGE;
DROP TABLE restauracao              CASCADE CONSTRAINTS PURGE;
DROP TABLE camareira                CASCADE CONSTRAINTS PURGE;
DROP TABLE manutencao               CASCADE CONSTRAINTS PURGE;
DROP TABLE intervencao              CASCADE CONSTRAINTS PURGE;
DROP TABLE endereco                 CASCADE CONSTRAINTS PURGE;
DROP TABLE intervencao_limpeza      CASCADE CONSTRAINTS PURGE;
DROP TABLE intervencao_manutencao   CASCADE CONSTRAINTS PURGE;
DROP TABLE tipoquarto               CASCADE CONSTRAINTS PURGE;
DROP TABLE epocaano                 CASCADE CONSTRAINTS PURGE;
DROP TABLE consumo                  CASCADE CONSTRAINTS PURGE;
DROP TABLE tipopagamento            CASCADE CONSTRAINTS PURGE;

CREATE TABLE andar (
    nome          VARCHAR(30)                    CONSTRAINT nn_andar_nome                 NOT NULL,
    numeroandar   NUMBER GENERATED AS IDENTITY,
    PRIMARY KEY ( numeroandar )
);

CREATE TABLE quarto (
    id               INTEGER GENERATED ALWAYS AS IDENTITY ( START WITH 1 INCREMENT BY 1 MAXVALUE 40 CACHE 5 CYCLE ),
    lotacao          NUMBER                      CONSTRAINT ck_quarto_lotacao             CHECK( lotacao > 0 )
                                                 CONSTRAINT nn_quarto_lotacao             NOT NULL,
    numeroandar      NUMBER                      CONSTRAINT nn_quarto_numeroAndar         NOT NULL,
    numeroquarto     NUMBER AS ( numeroandar * 10000 + id )
                                                 CONSTRAINT nn_quarto_numeroquarto        NOT NULL,
    designacaotipo   VARCHAR(10)                 CONSTRAINT nn_quarto_tipoquarto          NOT NULL,
    CONSTRAINT numeroquarto PRIMARY KEY ( numeroandar, numeroquarto )
);

CREATE TABLE tipoquarto (
    designacaotipo   VARCHAR(20)                 CONSTRAINT nn_tipoquarto_designacaotipo  NOT NULL,
    PRIMARY KEY ( designacaotipo )
);

CREATE TABLE epocaano (
    nomeepoca    VARCHAR(20)                     CONSTRAINT nn_epocaano_nomeepoca         NOT NULL,
    datainicio   DATE                            CONSTRAINT nn_epocaano_datainicio        NOT NULL,
    datafim      DATE                            CONSTRAINT nn_epocaano_datafim           NOT NULL,
                                                 CONSTRAINT ck_epocaano_datafim           CHECK( datafim >= datainicio ),
    PRIMARY KEY ( nomeepoca )
);


CREATE TABLE produto (
    idproduto     NUMBER GENERATED AS IDENTITY,
    nome          VARCHAR(30)                    CONSTRAINT nn_produto_nome                 NOT NULL,
    preco         NUMBER(4,2)                    CONSTRAINT nn_produto_preco                NOT NULL,
    PRIMARY KEY ( idproduto )
);

CREATE TABLE consumo (
    idconsumo      NUMBER GENERATED AS IDENTITY,
    numerounico    NUMBER                       CONSTRAINT nn_consumo_numerounico          NOT NULL,
    idProduto      NUMBER                       CONSTRAINT nn_consumo_produto              NOT NULL,
    nifFuncionario   NUMBER                       CONSTRAINT nn_conta_nifFuncionario         NOT NULL,
    dataRegistoConsumo  DATE                    CONSTRAINT nn_consumo_dataRegistoConsumo    NOT NULL,
    PRIMARY KEY ( idconsumo )
);

CREATE TABLE conta (
    idreserva       NUMBER                       CONSTRAINT nn_conta_idreserva              NOT NULL,
    numerounico     NUMBER GENERATED AS IDENTITY,
    dataabertura    DATE                         CONSTRAINT nn_conta_dataabertura           NOT NULL,
    PRIMARY KEY ( numerounico )
);

CREATE TABLE precoreserva (
    designacaotipo   VARCHAR(20)                 CONSTRAINT nn_precoreserva_designacaotipo  NOT NULL,
    preco            NUMBER(8,2)                 CONSTRAINT nn_precoreserva_preco           NOT NULL
                                                 CONSTRAINT ck_precoreserva_preco           CHECK(preco > 0),
    nomeepoca        VARCHAR(10)                 CONSTRAINT nn_precoreserva_nomeepoca       NOT NULL,
    PRIMARY KEY ( nomeepoca , designacaotipo )
);

CREATE TABLE reserva (
    idreserva           NUMBER GENERATED AS IDENTITY 
                                                 CONSTRAINT pk_reserva_idreserva            PRIMARY KEY,
    estado              VARCHAR(20)                 DEFAULT 'RESERVADA',
    numeropessoas       NUMBER(2,0)              CONSTRAINT nn_reserva_numeropessoas        NOT NULL
                                                 CONSTRAINT ck_reserva_numeropessoas        CHECK(numeropessoas > 0),
    datacheckin         DATE                     CONSTRAINT nn_reserva_datacheckin          NOT NULL,
    datacheckout        DATE                     CONSTRAINT nn_reserva_datacheckout         NOT NULL,
    nifCliente           NUMBER                   CONSTRAINT nn_reserva_nifCliente           NOT NULL,
    numeroandar         NUMBER                   CONSTRAINT nn_reserva_numeroandar          NOT NULL,
    numeroquarto        NUMBER                   CONSTRAINT nn_reserva_numeroquarto         NOT NULL,
    datacancelamento    DATE                     DEFAULT NULL,
    custocancelamento   NUMBER(6,2)              DEFAULT NULL,
    nomeepoca           VARCHAR(20)              CONSTRAINT nn_reserva_nomeepoca            NOT NULL,
    designacaoTipo      VARCHAR(20),
    CONSTRAINT ck_reserva_datacheckout         CHECK(datacheckout >= datacheckin)
);

CREATE TABLE fatura (
    idfatura        NUMBER GENERATED AS IDENTITY                PRIMARY KEY,
    valortotal      NUMBER                       DEFAULT 0,
    idReserva       INTEGER                      CONSTRAINT nn_fatura_idReserva             NOT NULL
);

CREATE TABLE pagamento (
    idpagamento    NUMBER GENERATED AS IDENTITY,
    tipoPagamento  VARCHAR(20)            CONSTRAINT nn_pagamento_tipoPagamento       NOT NULL,
    valorTotal     NUMBER                 CONSTRAINT nn_pagamento_valorTotal          NOT NULL
                                          CONSTRAINT ck_pagamento_valorTotal          CHECK(valortotal > 0),                                       
    idfatura       NUMBER                 CONSTRAINT nn_pagamento_idfatura            NOT NULL, 
    PRIMARY KEY ( idpagamento )
);

CREATE TABLE tipopagamento (
    designacao      VARCHAR(20)                  CONSTRAINT nn_tipopagamento_designacao      NOT NULL,
    PRIMARY KEY ( designacao )
);


CREATE TABLE cliente (
    nome        VARCHAR(20)                      CONSTRAINT nn_cliente_nome                  NOT NULL,
    nifCliente         NUMBER(9)                 CONSTRAINT nn_cliente_nif                 	 NOT NULL
                                                 CONSTRAINT ck_cliente_nif                   CHECK(REGEXP_LIKE(nifCliente, '^\d{9}$'))
                                                 CONSTRAINT pk_cliente_nif                   PRIMARY KEY,
    email       VARCHAR(50)                      DEFAULT NULL
                                                 CONSTRAINT uk_cliente_email                 UNIQUE,
    telefone    NUMBER(9)                        DEFAULT NULL
                                                 CONSTRAINT ck_cliente_telefone              CHECK((REGEXP_LIKE(telefone, '^\d{9}$')) OR (REGEXP_LIKE(telefone, '')))
                                                 CONSTRAINT uk_cliente_telefone              UNIQUE,
    CONSTRAINT nn_cliente_telefone_or_email     CHECK ((email IS NULL OR telefone IS NULL) AND NOT (email IS NULL AND telefone IS NULL))                                          
);

CREATE TABLE endereco (
    codpostal    VARCHAR(15)                     CONSTRAINT nn_endereco_codpostal            NOT NULL,
    rua          VARCHAR(30)                     CONSTRAINT nn_endereco_rua                  NOT NULL,
    localidade   VARCHAR(30)                     CONSTRAINT nn_endereco_localidade           NOT NULL,
    concelho     VARCHAR(30)                     CONSTRAINT nn_endereco_concelho             NOT NULL,
    pais         VARCHAR(30)                     CONSTRAINT nn_endereco_pais                 NOT NULL,
    nifCliente    NUMBER                          CONSTRAINT nn_endereco_nifCliente          NOT NULL,
    PRIMARY KEY ( nifCliente )
);

CREATE TABLE funcionario (
    nome            VARCHAR(30)                  CONSTRAINT nn_funcionario_nome              NOT NULL,
    nifFuncionario             NUMBER(9)         CONSTRAINT nn_funcionario_nif               NOT NULL
                                                 CONSTRAINT ck_funcionario_nif               CHECK(REGEXP_LIKE(nifFuncionario, '^\d{9}$'))
                                                 CONSTRAINT pk_funcionario_nif               PRIMARY KEY,
    morada          VARCHAR(50)                  CONSTRAINT nn_funcionario_morada            NOT NULL,
    telefone        NUMBER(9)                    CONSTRAINT nn_funcionario_telefone          NOT NULL
                                                 CONSTRAINT ck_funcionario_telefone          CHECK(REGEXP_LIKE(telefone, '^\d{9}$'))
                                                 CONSTRAINT uk_funcionario_telefone          UNIQUE,
    email           VARCHAR(30)                  CONSTRAINT nn_funcionario_email             NOT NULL
                                                 CONSTRAINT uk_funcionario_email             UNIQUE
);

CREATE TABLE rececao (
    nifFuncionario NUMBER                         CONSTRAINT nn_rececao_nifFuncionario         NOT NULL,
    PRIMARY KEY ( nifFuncionario )
);

CREATE TABLE restauracao (
    nifFuncionario NUMBER                         CONSTRAINT nn_restauracao_nifFuncionario     NOT NULL,
    PRIMARY KEY ( nifFuncionario )
);

CREATE TABLE camareira (
    nifFuncionario NUMBER                         CONSTRAINT nn_camareira_nifFuncionario       NOT NULL,
    PRIMARY KEY ( nifFuncionario )
);

CREATE TABLE manutencao (
    nifFuncionario     NUMBER                     CONSTRAINT nn_manutencao_nifFuncionario       NOT NULL,
    telefoneservico   NUMBER(9)                  CONSTRAINT nn_manutencao_telefoneservico     NOT NULL
                                                 CONSTRAINT ck_manutencao_telefoneservico     CHECK(REGEXP_LIKE(telefoneservico, '^\d{9}$'))
                                                 CONSTRAINT uk_manutencao_telefoneservico     UNIQUE,
    nifResponsavel     NUMBER                     DEFAULT NULL,
    PRIMARY KEY ( nifFuncionario )
);

CREATE TABLE intervencao (
    idintervencao   NUMBER GENERATED AS IDENTITY,
    designacao      VARCHAR(100)                 CONSTRAINT nn_intervencao_designacao        NOT NULL,
    numeroandar     NUMBER                       CONSTRAINT nn_intervencao_numeroandar       NOT NULL,
    numeroquarto    NUMBER                       CONSTRAINT nn_intervencao_numeroquarto      NOT NULL,
    PRIMARY KEY ( idintervencao )
);
 
CREATE TABLE intervencao_limpeza (
    idintervencao  NUMBER                        CONSTRAINT nn_intervencao_limpeza_idintervencao       NOT NULL,
    nifFuncionario  NUMBER                        CONSTRAINT nn_intervencao_limpeza_nifFuncionario       NOT NULL,
    dataIntervencao DATE                            CONSTRAINT nn_intervencao_limpeza_dataIntervencao   NOT NULL,
    PRIMARY KEY ( idintervencao, nifFuncionario, dataIntervencao )
);

CREATE TABLE intervencao_manutencao (
    idintervencao         NUMBER                 CONSTRAINT nn_intervencao_manutencao_idintervencao       NOT NULL,
    registoAtividade      VARCHAR(100)            DEFAULT NULL,
    nifFuncionario        NUMBER                 CONSTRAINT nn_intervencao_manutencao_nifFuncionario       NOT NULL,     
    dataIntervencao       DATE                    DEFAULT NULL, 
    PRIMARY KEY ( idintervencao, nifFuncionario ),
    CHECK ((registoAtividade IS NULL AND dataIntervencao IS NULL) OR (registoAtividade IS NOT NULL AND dataIntervencao IS NOT NULL))
);

ALTER TABLE quarto        ADD CONSTRAINT fkquartonumeroandar        FOREIGN KEY ( numeroandar )     REFERENCES andar ( numeroandar );
ALTER TABLE reserva       ADD CONSTRAINT fkreservanifCliente         FOREIGN KEY ( nifCliente )       REFERENCES cliente ( nifCliente );
ALTER TABLE conta         ADD CONSTRAINT fkcontaidreserva           FOREIGN KEY ( idreserva )       REFERENCES reserva ( idreserva );
ALTER TABLE endereco      ADD CONSTRAINT fkendereconifCliente        FOREIGN KEY ( nifCliente )       REFERENCES cliente ( nifCliente );
ALTER TABLE camareira     ADD CONSTRAINT fkcamareiranifFuncionario   FOREIGN KEY ( nifFuncionario )   REFERENCES funcionario ( nifFuncionario );
ALTER TABLE restauracao   ADD CONSTRAINT fkrestauracaonifFuncionario FOREIGN KEY ( nifFuncionario )   REFERENCES funcionario ( nifFuncionario );
ALTER TABLE rececao       ADD CONSTRAINT fkrececaonifFuncionario     FOREIGN KEY ( nifFuncionario )   REFERENCES funcionario ( nifFuncionario );
ALTER TABLE manutencao    ADD CONSTRAINT fkmanutencaonifFuncionario  FOREIGN KEY ( nifFuncionario )   REFERENCES funcionario ( nifFuncionario );
ALTER TABLE intervencao_limpeza    ADD CONSTRAINT fkintervencaolimpezaidintervencao   FOREIGN KEY ( idintervencao ) REFERENCES intervencao ( idintervencao );
ALTER TABLE intervencao_manutencao ADD CONSTRAINT fkintervencaomanutencaoidintevencao FOREIGN KEY ( idintervencao ) REFERENCES intervencao ( idintervencao );
ALTER TABLE intervencao_limpeza    ADD CONSTRAINT fkintervencaolimpezanifFuncionarios  FOREIGN KEY ( nifFuncionario ) REFERENCES camareira ( nifFuncionario );
ALTER TABLE intervencao   ADD CONSTRAINT fkintervencaoquarto        FOREIGN KEY ( numeroandar, numeroquarto )       REFERENCES quarto ( numeroandar, numeroquarto );
ALTER TABLE reserva       ADD CONSTRAINT fkreservaquarto            FOREIGN KEY ( numeroandar, numeroquarto )       REFERENCES quarto ( numeroandar, numeroquarto );
ALTER TABLE intervencao_manutencao ADD CONSTRAINT fkintervencaomanutencaonifFuncionario FOREIGN KEY ( nifFuncionario ) REFERENCES manutencao ( nifFuncionario );
ALTER TABLE quarto        ADD CONSTRAINT fkquartodesignacaotipo     FOREIGN KEY ( designacaotipo )  REFERENCES tipoquarto ( designacaotipo );
ALTER TABLE reserva       ADD CONSTRAINT fkReservaNomeEpoca         FOREIGN KEY ( nomeepoca )       REFERENCES epocaAno ( nomeepoca );
ALTER TABLE consumo         ADD CONSTRAINT fkconsumonifFuncionario       FOREIGN KEY ( nifFuncionario )   REFERENCES camareira ( nifFuncionario );
ALTER TABLE precoreserva  ADD CONSTRAINT fkprecoreservadesignacaotipo FOREIGN KEY ( designacaotipo ) REFERENCES tipoquarto ( designacaotipo );
ALTER TABLE precoreserva  ADD CONSTRAINT fkprecoreservanomeepoca    FOREIGN KEY ( nomeepoca )       REFERENCES epocaano ( nomeepoca );
ALTER TABLE consumo       ADD CONSTRAINT fkconsumonumerounico       FOREIGN KEY ( numerounico )     REFERENCES conta ( numerounico );
ALTER TABLE consumo       ADD CONSTRAINT fkconsumoIdProdutos        FOREIGN KEY ( idProduto )        REFERENCES produto ( idProduto );
ALTER TABLE reserva       ADD CONSTRAINT valoresRepetidosReserva    UNIQUE(dataCheckIn, dataCheckOut, numeroAndar, numeroQuarto);
ALTER TABLE fatura        ADD CONSTRAINT fkfaturaIdReserva            FOREIGN KEY ( idReserva )     REFERENCES reserva ( idReserva );
ALTER TABLE reserva       ADD CONSTRAINT fkReservaTipoQuarto         FOREIGN KEY ( designacaoTipo)  REFERENCES tipoquarto ( designacaoTipo);
ALTER TABLE pagamento        ADD CONSTRAINT fkpagamentoIdFatura          FOREIGN KEY ( idfatura )     REFERENCES fatura ( idfatura );
ALTER TABLE pagamento        ADD CONSTRAINT fkpagamentotipoPagamento            FOREIGN KEY ( tipoPagamento )     REFERENCES tipopagamento ( designacao );
