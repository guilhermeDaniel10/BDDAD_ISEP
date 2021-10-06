

------ VERIFICAR SE HA RESERVAS PARA O QUARTO NA DATA A SER INSERIDO
CREATE OR REPLACE TRIGGER verificarDataReserva
BEFORE INSERT
ON reserva
FOR EACH ROW
DECLARE
vCount NUMBER;
begin
    SELECT count(*) INTO vCount
    FROM reserva
    WHERE numeroQuarto = :NEW.numeroQuarto AND :NEW.dataCheckIn < dataCheckOut AND :NEW.dataCheckIn <= CURRENT_DATE AND :NEW.dataCheckOut > CURRENT_DATE;
    
    if vCount > 0 then
     raise_application_error(-20005, '»»»»»Reserva já efetuada na data pretendida!«««««');
    end if;
end;   
/
    
    
---------------------------------------------------
--------    TABELA TIPO QUARTO  -------------------
INSERT INTO TipoQuarto(designacaoTipo)
VALUES('suite');

INSERT INTO TipoQuarto(designacaoTipo)
VALUES('twin');

INSERT INTO TipoQuarto(designacaoTipo)
VALUES('superior');

INSERT INTO TipoQuarto(designacaoTipo)
VALUES('single');
---------------------------------------------------------
----------   TABELA ANDAR   -----------------------------
INSERT INTO Andar(nome)
VALUES('paraiso');

INSERT INTO Andar(nome)
VALUES('luxo');

--------------------------------------------------------
------------- TABELA QUARTOS----------------------------
INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(1,3,'single' );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(1,4,'single'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(1,1,'single'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(1,3,'single'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(1,2,'single'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(1,1,'single'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(1,2,'single'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(1,3,'single'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(1,1,'single'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(1,1,'single'  );
-- TWIN
INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(1,4,'twin'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(1,6,'twin'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(1,10,'twin'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(1,4,'twin'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(1,5,'twin'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(1,9,'twin'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(1,6,'twin'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(1,2,'twin'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(1,3,'twin'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(1,7,'twin'  );

-- SUPERIOR
INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(1,10,'superior'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(1,12,'superior'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(1,7,'superior'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(1,6,'superior'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(1,5,'superior'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(1,9,'superior'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(1,6,'superior'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(1,4,'superior'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(1,3,'superior'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(1,5,'superior'  );

-- SUITE
INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(1,13,'suite'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(1,10,'suite'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(1,6,'suite'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(1,10,'suite'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(1,7,'suite'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(1,9,'suite'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(1,6,'suite'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(1,7,'suite'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(1,5,'suite'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(1,9,'suite'  );

-- 2Âº ANDAR
-- SINGLE
INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(2,1,'single'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(2,3,'single'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(2,4,'single'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(2,1,'single'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(2,3,'single'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(2,2,'single'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(2,1,'single'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(2,2,'single'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(2,3,'single'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(2,1,'single'  );

-- TWIN
INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(2,4,'twin' );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(2,6,'twin'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(2,10,'twin'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(2,4,'twin' );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(2,5,'twin' );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(2,9,'twin'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo )
VALUES(2,6,'twin'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo)
VALUES(2,2,'twin'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo)
VALUES(2,3,'twin'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo)
VALUES(2,7,'twin'  );

-- SUPERIOR
INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo)
VALUES(2,10,'superior'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo)
VALUES(2,12,'superior'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo)
VALUES(2,7,'superior' );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo)
VALUES(2,6,'superior' );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo)
VALUES(2,5,'superior'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo)
VALUES(2,9,'superior'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo)
VALUES(2,6,'superior'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo)
VALUES(2,4,'superior'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo)
VALUES(2,3,'superior'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo)
VALUES(2,5,'superior'  );

-- SUITE
INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo)
VALUES(2,13,'suite' );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo)
VALUES(2,10,'suite'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo)
VALUES(2,6,'suite'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo)
VALUES(2,10,'suite'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo)
VALUES(2,7,'suite'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo)
VALUES(2,9,'suite'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo)
VALUES(2,6,'suite'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo)
VALUES(2,7,'suite'  );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo)
VALUES(2,5,'suite' );

INSERT INTO quarto(numeroAndar, lotacao, designacaoTipo)
VALUES(2,9,'suite'  );


----------------------------------------------------------------
--          TABELA EPOCA DO ANO             --------------------

INSERT INTO EpocaAno(nomeEpoca, dataInicio, dataFim)
VALUES('BAIXA', TO_DATE('2020-01-01', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-03-31', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO EpocaAno(nomeEpoca, dataInicio, dataFim)
VALUES('BAIXA2', TO_DATE('2020-11-01', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-12-31', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO EpocaAno(nomeEpoca, dataInicio, dataFim)
VALUES('MEDIA', TO_DATE('2020-04-01', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-06-15', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO EpocaAno(nomeEpoca, dataInicio, dataFim)
VALUES('MEDIA2', TO_DATE('2020-09-16', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-10-31', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO EpocaAno(nomeEpoca, dataInicio, dataFim)
VALUES('ALTA', TO_DATE('2020-06-16', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-09-15', 'yyyy-mm-dd hh24:mi:ss'));

----------------------------------------------------------------
----------------- TABELA FUNCIONARIOs --------------------------


INSERT INTO Funcionario(nome, nifFuncionario, morada, telefone, email)
VALUES ('Maria Sousa', 321432321, 'Rua Passos Manuel, 445, Porto', 922113243, 'mariasousa@gmail.com');

INSERT INTO Camareira(nifFuncionario)
VALUES (321432321);

INSERT INTO Funcionario(nome, nifFuncionario, morada, telefone, email)
VALUES ('Jo?o Costa', 555432321, 'Rua Joaquim Pinto, 43, Porto', 914454578, 'joaocosta@gmail.com');

INSERT INTO Camareira(nifFuncionario)
VALUES (555432321);

INSERT INTO Funcionario(nome, nifFuncionario, morada, telefone, email)
VALUES ('Marisa Mota', 656543432, 'Rua Samuel Maria, 11, Porto', 923211211, 'marisamota@gmail.com');

INSERT INTO Camareira(nifFuncionario)
VALUES (656543432);

INSERT INTO Funcionario(nome, nifFuncionario, morada, telefone, email)
VALUES ('Ricardo Matias', 323434432, 'Rua da Liberdade, 4, Porto', 923323212, 'ricardomatias@gmail.com');

INSERT INTO Camareira(nifFuncionario)
VALUES (323434432);

INSERT INTO Funcionario(nome, nifFuncionario, morada, telefone, email)
VALUES ('Carla Correira', 232345643, 'Rua de Matos, 422, Porto', 911123212, 'carlacorreira@gmail.com');

INSERT INTO Camareira(nifFuncionario)
VALUES (232345643);
----------------------------------------------------------------
---------       TABELA PRECO RESERVA        --------------------
INSERT INTO PrecoReserva(designacaoTipo, nomeEpoca, preco)
VALUES ('single', 'BAIXA', 400);

INSERT INTO PrecoReserva(designacaoTipo, nomeEpoca, preco)
VALUES ('single', 'MEDIA', 425);


INSERT INTO PrecoReserva(designacaoTipo, nomeEpoca, preco)
VALUES ('single', 'ALTA', 450);

INSERT INTO PrecoReserva(designacaoTipo, nomeEpoca, preco)
VALUES ('suite', 'BAIXA', 450);

INSERT INTO PrecoReserva(designacaoTipo, nomeEpoca, preco)
VALUES ('suite', 'MEDIA', 475);

INSERT INTO PrecoReserva(designacaoTipo, nomeEpoca, preco)
VALUES ('suite', 'ALTA', 500);


INSERT INTO PrecoReserva(designacaoTipo, nomeEpoca, preco)
VALUES ('superior', 'BAIXA', 500);

INSERT INTO PrecoReserva(designacaoTipo, nomeEpoca, preco)
VALUES ('superior', 'MEDIA', 525);

INSERT INTO PrecoReserva(designacaoTipo, nomeEpoca, preco)
VALUES ('superior', 'ALTA', 550);


INSERT INTO PrecoReserva(designacaoTipo, nomeEpoca, preco)
VALUES ('twin', 'BAIXA', 600);

INSERT INTO PrecoReserva(designacaoTipo, nomeEpoca, preco)
VALUES ('twin', 'MEDIA', 625);

INSERT INTO PrecoReserva(designacaoTipo, nomeEpoca, preco)
VALUES ('twin', 'ALTA', 650);

----------------------------------------------------------------
-----------      TABELA CLIENTES        ------------------------

-- AÇORES --
INSERT INTO Cliente(nome,nifCliente,email)
VALUES('Antonio Silva', 100000000, 'tone@gmail.com');

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(100000000, 'Rua Fonte de Cima', 'Corvo', 'Açores', '9980-021', 'Portugal');

INSERT INTO Cliente(nome,nifCliente,telefone)
VALUES('Marcos Marques', 100000001,910001111);

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(100000001, 'Termo da Igreja', 'Vila do Porto', 'Açores', '9580-115', 'Portugal');

INSERT INTO Cliente(nome,nifCliente,email)
VALUES('Mariana Moreira', 111111111, 'mary@gmail.com');

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(111111111, 'Caminho da Igreja', 'Velas', 'Açores', '9800-024', 'Portugal');

-- AVEIRO --
INSERT INTO Cliente(nome,nifCliente,email)
VALUES('Tatiana Neves', 111111112, 'Taty@hotmail.com');

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(111111112, 'Praça 1º de Maio', 'Ovar', 'Aveiro', '3880-040', 'Portugal');

INSERT INTO Cliente(nome,nifCliente,telefone)
VALUES('Fabio Martins', 111111113,911223344);

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(111111113, 'Apartado 1', 'Ovar', 'Aveiro', '3880-041', 'Portugal');

INSERT INTO Cliente(nome,nifCliente,email)
VALUES('Filipa Meireles', 111111141, 'filper@gmail.com');

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(111111141, 'Estrada Nacional 109', 'Ovar', 'Aveiro', '3885-100', 'Portugal');

-- BEJA --
INSERT INTO Cliente(nome,nifCliente,email)
VALUES('Catarina Romanova', 111116141, 'romanova@gmail.com');

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(111116141, 'Monte Igreja', 'Mombeja', 'Beja', '7800-640', 'Portugal');

INSERT INTO Cliente(nome,nifCliente,telefone)
VALUES('Ricardo Couto', 111016141,911111614);

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(111016141, 'Monte Vilarinho', 'Mombeja', 'Beja', '7800-641', 'Portugal');

INSERT INTO Cliente(nome,nifCliente,email)
VALUES('Joana Alencar', 111116147, 'alencar@gmail.com');

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(111116147, 'Estrada Nacional', 'Beja', 'Beja', '4450-223', 'Portugal');

-- BRAGA --
INSERT INTO Cliente(nome,nifCliente,email)
VALUES('Nuno Braga', 111816141, 'FCBraga@gmail.com');

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(111816141, 'Rua 25 de Abril', 'Braga', 'Braga', '4715-604', 'Portugal');

INSERT INTO Cliente(nome,nifCliente,telefone)
VALUES('Sara Santos', 121816141,911816141);

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(121816141, 'Rua 25 de Abril', 'Braga', 'Braga', '4715-604', 'Portugal');

INSERT INTO Cliente(nome,nifCliente,email)
VALUES('Afonso Almeirim', 131816141, 'madeiras@gmail.com');

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(131816141, 'Rua 8 de Dezembro', 'Braga', 'Braga', '4715-621', 'Portugal');

-- BRAGANÇA --
INSERT INTO Cliente(nome,nifCliente,telefone)
VALUES('Alice Pereira', 131816147,931816147);

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(131816147, 'Apartado 1', 'Bragança', ' Bragança ', '5300-235', 'Portugal');

INSERT INTO Cliente(nome,nifCliente,telefone)
VALUES('Paulo Pereira', 131716147,931716147);

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(131716147, 'Apartado 10', 'Bragança', ' Bragança ', '5300-236', 'Portugal');

INSERT INTO Cliente(nome,nifCliente,telefone)
VALUES('Ana Isabel', 111111121,911111121);

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(111111121, 'Rua velha', 'Bragança', ' Bragança ', '5300-237', 'Portugal');

-- CASTELO BRANCO --
INSERT INTO Cliente(nome,nifCliente,email)
VALUES('Miguel Tavares', 111111117, 'mt@gmail.com');

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(111111117, 'Rua T 1', 'Castelo Branco', 'Castelo Branco', '6001-909 ', 'Portugal');

INSERT INTO Cliente(nome,nifCliente,email)
VALUES('Joao Baiao', 111111118, 'jBaiao@gmail.com');

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(111111118, '1º Transvessal', 'Castelo Branco', 'Castelo Branco', '6000-909 ', 'Portugal');

INSERT INTO Cliente(nome,nifCliente,email)
VALUES('Sonia Sousa', 122222222, 'sony@gmail.com');

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(122222222, 'Travessa da esquina', 'Castelo Branco', 'Castelo Branco', '6000-901 ', 'Portugal');

-- COIMBRA --
INSERT INTO Cliente(nome,nifCliente,email)
VALUES('Ivete Sangalo', 217665555, 'Samba@gmail.com');

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(217665555, 'Rua Sem Nome', 'Coimbra', 'Coimbra', '3000-522', 'Portugal');

INSERT INTO Cliente(nome,nifCliente,telefone)
VALUES('Alexandre Pires', 217665554, 921766555);

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(217665554, 'Rua da Infantaria', 'Coimbra', 'Coimbra', '3004-006', 'Portugal');

INSERT INTO Cliente(nome,nifCliente,email)
VALUES('Bruno Mars', 217115554, 'MTV@gmail.com');

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(217115554, 'Largo de Se Nova', 'Coimbra', 'Coimbra', '3000-528', 'Portugal');

-- ÉVORA --
INSERT INTO Cliente(nome,nifCliente,email)
VALUES('Filomena Cautela', 144477444, 'rtpFilo@gmail.com');

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(144477444, 'Caminho Municipal 1088', 'Evora', 'Evora', '7005-874', 'Portugal');

INSERT INTO Cliente(nome,nifCliente,telefone)
VALUES('Ana Galvao', 144444444,944444444);

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(144444444, 'Caminho Municipal 1089', 'Evora', 'Evora', '7005-875', 'Portugal');

INSERT INTO Cliente(nome,nifCliente,email)
VALUES('Maria Moniz', 144444447, 'moniz@gmail.com');

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(144444447, 'Caminho Municipal 1098', 'Evora', 'Evora', '7005-877', 'Portugal');

-- FARO --
INSERT INTO Cliente(nome,nifCliente,telefone)
VALUES('Paulo Portas', 100020211,910000211);

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(100020211, 'Apartado 13', 'Faro', 'Faro', '8970-056', 'Portugal');

INSERT INTO Cliente(nome,nifCliente,email)
VALUES('Guilherme Bernardo', 100000211, 'SaoBernardo@gmail.com');

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(100000211, 'Apartado 11', 'Faro', 'Faro', '8970-057', 'Portugal');

INSERT INTO Cliente(nome,nifCliente,email)
VALUES('Carolina Puteiro', 100000021, 'puts@gmail.com');

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(100000021, 'Estrada Municipal 2', 'Faro', 'Faro', '8970-059', 'Portugal');

-- GUARDA --
INSERT INTO Cliente(nome,nifCliente,telefone)
VALUES('Mariana Mortagua', 111117171,911117171);

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(111117171, 'Penedo de Se', 'Guarda', 'Guarda', '6300-130', 'Portugal');

INSERT INTO Cliente(nome,nifCliente,telefone)
VALUES('Carlos Costa', 111117172,911117172);

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(111117172, 'Monte Bras', 'Guarda', 'Guarda', '6300-130', 'Portugal');

INSERT INTO Cliente(nome,nifCliente,email)
VALUES('Manuel Azevedo', 123456769, 'marco@gmail.com');

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(123456769, 'Quinta Gonçalo Martins', 'Guarda', 'Guarda', '6300-130', 'Portugal');

-- LEIRIA --
INSERT INTO Cliente(nome,nifCliente,telefone)
VALUES('Vanda Magina', 191999999,911999999);

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(191999999, 'Apartado 1, Amor', 'Leiria', 'Leiria', '2401-701', 'Portugal');

INSERT INTO Cliente(nome,nifCliente,email)
VALUES('Micaela Contante', 120056769, 'miquelina@gmail.com');

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(120056769, 'Apartado 2, Amor', 'Leiria', 'Leiria', '2401-702', 'Portugal');

INSERT INTO Cliente(nome,nifCliente,email)
VALUES('Raquela Moreira', 123056060, 'raquelMoreira@gmail.com');

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(123056060, 'Rua Base Aerea', 'Leiria', 'Leiria', '2401-702', 'Portugal');

-- LISBOA --
INSERT INTO Cliente(nome,nifCliente,email)
VALUES('Sara Ambrosio', 127777777, 'ambrose@gmail.com');

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(127777777, 'Apartado 10, Mafra', 'Mafra', 'Lisboa', '2644-011', 'Portugal');

INSERT INTO Cliente(nome,nifCliente,email)
VALUES('Filipe Alboquerque', 127777776, 'Fylipe@gmail.com');

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(127777776, 'Rua 1º de Maio', 'Mafra', 'Lisboa', '2644-013', 'Portugal');

INSERT INTO Cliente(nome,nifCliente,email)
VALUES('John Mayer', 127777775, 'JohnMayer@gmail.com');

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(127777775, 'Rua escura', 'Lisboa', 'Lisboa', '2649-011', 'Portugal');

-- MADEIRA --
INSERT INTO Cliente(nome,nifCliente,telefone)
VALUES('Neyo Santos', 127788775, 927788775);

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(127788775, 'Travessa 1 da Estrada', 'Camara de Lobos', 'Madeira', '9300-262', 'Portugal');

INSERT INTO Cliente(nome,nifCliente,email)
VALUES('Carla Ferreira', 120036769, 'carlaFerreira@gmail.com');

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(120036769, 'Praceta 24 Julho', 'Camara de Lobos', 'Madeira', '9300-262', 'Portugal');

INSERT INTO Cliente(nome,nifCliente,email)
VALUES('Nelly Furtado', 109456769, 'furto@gmail.com');

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(109456769, 'Caminho Campo 1º de Maio', 'Funchal', 'Madeira', '9060-418', 'Portugal');

-- PORTALEGRE --
INSERT INTO Cliente(nome,nifCliente,telefone)
VALUES('Danilo Pereira', 133333333, 933333333);

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(133333333, 'Rua nova', 'Portalegre', 'Portalegre', '7300-458', 'Portugal');

INSERT INTO Cliente(nome,nifCliente,email)
VALUES('Joao Felix', 133333335, 'feliz@gmail.com');

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(133333335, 'Rua velha', 'Portalegre', 'Portalegre', '7300-452', 'Portugal');

INSERT INTO Cliente(nome,nifCliente,email)
VALUES('Patricia Mamona', 133333337, 'mamona@gmail.com');

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(133333337, 'Rua velha', 'Portalegre', 'Portalegre', '7300-451', 'Portugal');

-- PORTO --
INSERT INTO Cliente(nome,nifCliente,email)
VALUES('Guilherme Daniel', 111115555, 'guilhermeDaniel70@gmail.com');

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(111115555, 'Rua Paços Manuel', 'Matosinhos', 'Porto', '4460-078', 'Portugal');

INSERT INTO Cliente(nome,nifCliente,email)
VALUES('Lucas Sousa', 111111777, 'LucasSousa@gmail.com');

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(111111777, 'Rua Professora Alzira', 'Gondomar', 'Porto', '4420-621', 'Portugal');

INSERT INTO Cliente(nome,nifCliente,email)
VALUES('Ana Pereira', 211111777, 'Isa@gmail.com');

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(211111777, 'Rua do Pinheiro', 'Gaia', 'Porto', '4410-007', 'Portugal');

-- SANTAREM --
INSERT INTO Cliente(nome,nifCliente,telefone)
VALUES('Maria Matia', 223456789, 911199999);

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(223456789, 'Travessa Nova', 'Torres Nova', 'Santarem', '2350-144', 'Portugal');

INSERT INTO Cliente(nome,nifCliente,telefone)
VALUES('Helena Coelho', 211111111, 910871117);

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(211111111, 'Largo Outubro', 'Torres Nova', 'Santarem', '2351-144', 'Portugal');

INSERT INTO Cliente(nome,nifCliente,telefone)
VALUES('Leonor Costa', 211111112, 910871118);

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(211111112, 'Largo da Igreja', 'Santarem', 'Santarem', '2350-176', 'Portugal');

-- SETUBAL --
INSERT INTO Cliente(nome,nifCliente,email)
VALUES('Guilherme Sao', 299999999, 'sao@hotmail.com');

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(299999999, 'Apartado 121,Seixal', 'Seixal', 'Setubal', '2840-721', 'Portugal');

INSERT INTO Cliente(nome,nifCliente,telefone)
VALUES('Jessica Athaide', 299999991, 911118888);

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(299999991, 'Avenida 121', 'Setubal', 'Setubal', '2840-720', 'Portugal');

INSERT INTO Cliente(nome,nifCliente,telefone)
VALUES('Ruben Rua', 299898991, 944433221);

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(299898991, 'Rua velha', 'Setubal', 'Setubal', '2840-765', 'Portugal');

-- VIANA DO CASTELO --
INSERT INTO Cliente(nome,nifCliente,email)
VALUES('Teresa Guilherme', 222222222, 'tvi@gmail.com');

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(222222222, 'Reservatorio de agua', 'Vila Nova de Cerveira', 'Viana do Castelo', '4920-054', 'Portugal');

INSERT INTO Cliente(nome,nifCliente,telefone)
VALUES('Carlos Mota', 222222221, 944444777);

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(222222221, 'Carreiro novo', 'Vila Nova de Cerveira', 'Viana do Castelo', '4920-057', 'Portugal');

INSERT INTO Cliente(nome,nifCliente,telefone)
VALUES('Justina Alguidar', 222222223, 912666666);

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(222222223, 'Carreiro antigo', 'Vila Nova de Cerveira', 'Viana do Castelo', '4921-054', 'Portugal');

-- VILA REAL --
INSERT INTO Cliente(nome,nifCliente,email)
VALUES('Jose Silva', 123456789, 'josesilva@gmail.com');

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(123456789, 'Estrada Nacional', 'Vila Real', 'Vila Real', '5000-188', 'Portugal');

INSERT INTO Cliente(nome,nifCliente,telefone)
VALUES('Maria Rosa', 233333333, 917777777);

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(233333333, 'Estrada Nacional 3', 'Vila Real', 'Vila Real', '5000-189', 'Portugal');

INSERT INTO Cliente(nome,nifCliente,email)
VALUES('Miguel Quadrado', 119898726, 'geometrico@gmail.com');

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(119898726, 'Estrada Nacional 3', 'Vila Real', 'Vila Real', '5000-190', 'Portugal');

-- VISEU --
INSERT INTO Cliente(nome,nifCliente,email)
VALUES('Diogo Coutinho', 100430089, 'desaparecido@gmail.com');

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(100430089, 'Rua Santo Estevao', 'Lamego', 'Viseu', '5100-081', 'Portugal');

INSERT INTO Cliente(nome,nifCliente,email)
VALUES('Ana Rocha', 436778870, 'calhau@gmail.com');

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(436778870, 'Rua Santo Estevao 2', 'Lamego', 'Viseu', '5100-082', 'Portugal');

INSERT INTO Cliente(nome,nifCliente,email)
VALUES('Gabriela Pinto', 448878760, 'prqtxn@gmail.com');

INSERT INTO Endereco(nifCliente, rua, concelho, localidade, codPostal, pais)
VALUES(448878760, 'Estrada Nacional 2', 'Lamego', 'Viseu', '5100-086', 'Portugal');

--------------------------------------------------------------------
-----------     TABELA RESERVAS ------------------------------------

-- EPOCA BAIXA -------
INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(1,TO_DATE('2020-02-17 10:41:11', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-02-20 11:52:27', 'yyyy-mm-dd hh24:mi:ss'),123456789,1,10001,'BAIXA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, dataCancelamento, nomeepoca)
VALUES(3,TO_DATE('2020-11-12 14:42:21', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-11-28 13:05:07', 'yyyy-mm-dd hh24:mi:ss'),448878760,1,10019,TO_DATE('2020-02-15 14:32:16', 'yyyy-mm-dd hh24:mi:ss'),'BAIXA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, dataCancelamento, nomeepoca)
VALUES(4,TO_DATE('2020-01-17 11:51:05', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-01-25 13:46:22', 'yyyy-mm-dd hh24:mi:ss'),436778870,1,10028, TO_DATE('2020-01-09 16:52:19', 'yyyy-mm-dd hh24:mi:ss'),'BAIXA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(5,TO_DATE('2020-12-17 10:56:20', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-12-25 11:31:43', 'yyyy-mm-dd hh24:mi:ss'),119898726,2,20033,'BAIXA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(1,TO_DATE('2020-11-04 15:36:54', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-11-08 12:20:01', 'yyyy-mm-dd hh24:mi:ss'),123456789,2,20004,'BAIXA');


-- EPOCA MEDIA -------
INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(1,TO_DATE('2020-04-17 12:41:21', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-04-20 12:41:01', 'yyyy-mm-dd hh24:mi:ss'),123456789,1,10006,'MEDIA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(1,TO_DATE('2020-04-17 15:21:51', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-04-20 11:51:21', 'yyyy-mm-dd hh24:mi:ss'),217665555,1,10035,'MEDIA');


INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, dataCancelamento, nomeepoca)
VALUES(3,TO_DATE('2020-05-09 13:13:25', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-05-19 15:21:13', 'yyyy-mm-dd hh24:mi:ss'),222222222,1,10015,TO_DATE('2020-05-17 21:41:53', 'yyyy-mm-dd hh24:mi:ss'),'MEDIA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(4,TO_DATE('2020-09-17 10:52:41', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-09-25 14:11:02', 'yyyy-mm-dd hh24:mi:ss'),299999991,1,10023,'MEDIA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, dataCancelamento, nomeepoca)
VALUES(5,TO_DATE('2020-10-10 15:45:26', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-10-17 13:41:26', 'yyyy-mm-dd hh24:mi:ss'),223456789,2,20032,TO_DATE('2020-10-05 17:34:29', 'yyyy-mm-dd hh24:mi:ss'),'MEDIA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(1,TO_DATE('2020-06-01 16:27:31', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-06-05 11:11:04', 'yyyy-mm-dd hh24:mi:ss'),223456789,2,20006,'MEDIA');


-- EPOCA ALTA --------

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(1,TO_DATE('2020-07-12 12:32:35', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-07-20 10:31:11', 'yyyy-mm-dd hh24:mi:ss'),211111111,1,10003,'ALTA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, dataCancelamento, nomeepoca)
VALUES(3,TO_DATE('2020-06-19 11:51:14', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-06-25 11:42:41', 'yyyy-mm-dd hh24:mi:ss'),223456789,1,10021, TO_DATE('2020-06-09 10:42:32', 'yyyy-mm-dd hh24:mi:ss'),'ALTA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(4,TO_DATE('2020-09-01 15:44:59', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-09-12 13:13:22', 'yyyy-mm-dd hh24:mi:ss'),100430089,1,10029,'ALTA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(5,TO_DATE('2020-07-11 16:11:28', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-07-16 12:24:26', 'yyyy-mm-dd hh24:mi:ss'),111111141,2,20030,'ALTA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, dataCancelamento, nomeepoca)
VALUES(1,TO_DATE('2020-08-17 12:25:37', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-08-25 11:55:43', 'yyyy-mm-dd hh24:mi:ss'),299898991,2,20006,TO_DATE('2020-08-21 23:51:53', 'yyyy-mm-dd hh24:mi:ss'),'ALTA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(1,TO_DATE('2020-08-01 12:11:12', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-08-09 12:12:11', 'yyyy-mm-dd hh24:mi:ss'),217665555,1,10033,'ALTA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(1,TO_DATE('2020-08-01 12:11:12', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-08-09 12:12:11', 'yyyy-mm-dd hh24:mi:ss'),127777775,1,10035,'ALTA');

------------------------------------------------------------------
---------- REGISTOS DE CLIENTES QUE CONSUMIRAM NOS ULTIMOS 6 MESES
INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(1,TO_DATE('2020-12-15 11:11:22', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-12-23 11:11:21', 'yyyy-mm-dd hh24:mi:ss'),123456769,1,10005,'BAIXA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(3,TO_DATE('2020-06-20 12:21:31', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-06-25 12:25:31', 'yyyy-mm-dd hh24:mi:ss'),127777776,1,10021,'ALTA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(4,TO_DATE('2020-09-04 13:31:25', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-09-12 13:34:34', 'yyyy-mm-dd hh24:mi:ss'),131716147,1,10029,'ALTA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(5,TO_DATE('2020-12-01 14:41:51', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-12-13 14:43:54', 'yyyy-mm-dd hh24:mi:ss'),133333333,2,20030,'ALTA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(1,TO_DATE('2020-08-15 11:51:32', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-08-25 11:52:23', 'yyyy-mm-dd hh24:mi:ss'),211111111,2,20010,'ALTA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(1,TO_DATE('2020-07-11 12:41:31', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-07-17 12:11:54', 'yyyy-mm-dd hh24:mi:ss'),217665554,1,10005,'ALTA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(3,TO_DATE('2020-06-09 13:11:54', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-06-13 13:29:41', 'yyyy-mm-dd hh24:mi:ss'),223456789,1,10027,'MEDIA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(4,TO_DATE('2020-06-17 14:21:51', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-06-25 14:38:22', 'yyyy-mm-dd hh24:mi:ss'),299898991,2,20008,'ALTA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(5,TO_DATE('2020-08-11 15:31:14', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-08-19 11:47:43', 'yyyy-mm-dd hh24:mi:ss'),299999999,2,20033,'ALTA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(1,TO_DATE('2020-09-17 11:41:45', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-09-25 12:56:54', 'yyyy-mm-dd hh24:mi:ss'),133333335,2,20004,'ALTA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(1,TO_DATE('2020-07-22 12:51:42', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-07-28 13:15:56', 'yyyy-mm-dd hh24:mi:ss'),211111111,1,10029,'ALTA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(3,TO_DATE('2020-06-09 13:11:24', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-06-13 14:24:59', 'yyyy-mm-dd hh24:mi:ss'),217665555,1,10031,'MEDIA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(4,TO_DATE('2020-06-01 14:51:55', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-06-14 11:33:44', 'yyyy-mm-dd hh24:mi:ss'),123456789,2,20015,'MEDIA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(5,TO_DATE('2020-08-03 11:21:44', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-08-09 12:42:34', 'yyyy-mm-dd hh24:mi:ss'),127788775,2,20037,'ALTA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(1,TO_DATE('2020-09-27 12:31:23', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-10-04 13:51:45', 'yyyy-mm-dd hh24:mi:ss'),131816147,2,20038,'MEDIA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(1,TO_DATE('2020-07-04 13:41:21', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-07-18 14:19:41', 'yyyy-mm-dd hh24:mi:ss'),123456769,1,10029,'ALTA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(3,TO_DATE('2020-06-09 14:51:43', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-06-13 11:28:24', 'yyyy-mm-dd hh24:mi:ss'),127777775,1,10021,'MEDIA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(4,TO_DATE('2020-06-21 11:21:44', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-06-28 12:37:51', 'yyyy-mm-dd hh24:mi:ss'),127788775,2,20015,'ALTA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(5,TO_DATE('2020-08-16 12:11:41', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-08-21 13:46:15', 'yyyy-mm-dd hh24:mi:ss'),133333333,1,10031,'ALTA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(1,TO_DATE('2020-11-15 13:31:15', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-11-24 14:55:16', 'yyyy-mm-dd hh24:mi:ss'),133333335,2,20005,'MEDIA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(1,TO_DATE('2020-11-19 13:31:15', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-11-29 14:55:16', 'yyyy-mm-dd hh24:mi:ss'),127788775,2,20005,'MEDIA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(1,TO_DATE('2020-11-18 14:41:16', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-11-26 15:14:56', 'yyyy-mm-dd hh24:mi:ss'),127777776,2,20020,'MEDIA');

------------------------------------------------
------------------ REGISTOS FORA DOS 6 MESES
INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(3,TO_DATE('2020-01-09 14:51:21', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-01-13 11:11:25', 'yyyy-mm-dd hh24:mi:ss'),133333335,1,10017,'BAIXA');
 
INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(4,TO_DATE('2020-01-21 16:21:32', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-01-28 20:31:32', 'yyyy-mm-dd hh24:mi:ss'),127777776,2,20005,'BAIXA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(5,TO_DATE('2020-02-16 19:41:52', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-02-21 18:41:21', 'yyyy-mm-dd hh24:mi:ss'),299999991,1,10030,'BAIXA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(1,TO_DATE('2020-03-15 15:04:21', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-03-19 11:20:41', 'yyyy-mm-dd hh24:mi:ss'),436778870,2,20002,'BAIXA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(1,TO_DATE('2020-01-01 12:41:22', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-01-09 12:02:12', 'yyyy-mm-dd hh24:mi:ss'),217665554,2,20013,'BAIXA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(1,TO_DATE('2020-08-10 13:00:44', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-08-17 13:00:00', 'yyyy-mm-dd hh24:mi:ss'),436778870,1,10001,'ALTA');

INSERT INTO reserva(numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(3,TO_DATE('2020-07-29 12:00:00', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-08-04 12:00:00', 'yyyy-mm-dd hh24:mi:ss'),109456769,1,10006,'ALTA');

INSERT INTO reserva(numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(4,TO_DATE('2020-06-29 11:21:44', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-06-30 11:21:44', 'yyyy-mm-dd hh24:mi:ss'),131816141,2,20015,'ALTA');

INSERT INTO reserva(numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(5,TO_DATE('2020-08-10 14:50:47', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-08-15 14:50:47', 'yyyy-mm-dd hh24:mi:ss'),211111112,1,10001,'ALTA');

INSERT INTO reserva(numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(1,TO_DATE('2020-10-10 13:00:44', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-10-17 13:00:44', 'yyyy-mm-dd hh24:mi:ss'),448878760,2,20015,'MEDIA');

------------------------------------------------
------- FUNCIONARIOS -----------------
INSERT INTO funcionario(nome, nifFuncionario, morada, telefone, email)
VALUES ('Guilherme Marques', 199999878, 'Rua de Baixo, Porto', 967778889, 'guilhermemarques@gmail.com');

INSERT INTO restauracao (nifFuncionario)
VALUES (199999878);

INSERT INTO funcionario(nome, nifFuncionario, morada, telefone, email)
VALUES ('Inês Martins', 777899887, 'Avenida da Liberdade, Porto', 961112222, 'inesmartins@gmail.com');

INSERT INTO rececao (nifFuncionario)
VALUES (777899887);

INSERT INTO funcionario(nome, nifFuncionario, morada, telefone, email)
VALUES ('Rodrigo Loures', 333787787, 'Rua da Costa, Porto', 966666555, 'rodrigoloures@gmail.com');

INSERT INTO restauracao (nifFuncionario)
VALUES (333787787);

INSERT INTO funcionario(nome, nifFuncionario, morada, telefone, email)
VALUES ('Amelia Rocha', 876767676, 'Avenidade Joao Vilarret, Porto', 966787765, 'ameliarocha@gmail.com');

INSERT INTO rececao (nifFuncionario)
VALUES (876767676);




------------------------------------------------
------- INTERVENCAO MANUTENCAO -----------------

INSERT INTO funcionario(nome, nifFuncionario, morada, telefone, email)
VALUES ('Fernando Medina', 411109878, 'Rua de Baixo, Porto', 929944004, 'fernandomedina@gmail.com');

INSERT INTO manutencao (nifFuncionario, telefoneServico)
VALUES (411109878, 911133448);

INSERT INTO funcionario(nome, nifFuncionario, morada, telefone, email)
VALUES ('Joao Tavares', 400009878, 'Rua de Cima, Matosinhos', 923344004, 'joaotavares@gmail.com');

INSERT INTO manutencao (nifFuncionario, telefoneServico)
VALUES (400009878, 912424242);

INSERT INTO funcionario(nome, nifFuncionario, morada, telefone, email)
VALUES ('Miguel Rocha', 212290921, 'Rua de Cima, Matosinhos', 923344334, 'miguelrocha@gmail.com');

INSERT INTO manutencao (nifFuncionario, telefoneServico, nifResponsavel)
VALUES (212290921, 912400042, 434009878);

INSERT INTO funcionario(nome, nifFuncionario, morada, telefone, email)
VALUES ('Ana Costa', 990012132, 'Rua de Cima, Matosinhos', 923340000, 'anacosta11@gmail.com');

INSERT INTO manutencao (nifFuncionario, telefoneServico, nifResponsavel)
VALUES (990012132, 912455424, 434009878);

INSERT INTO funcionario(nome, nifFuncionario, morada, telefone, email)
VALUES ('Marta Couto', 229989092, 'Rua de Cima, Matosinhos', 921114334, 'martacouto@gmail.com');

INSERT INTO manutencao (nifFuncionario, telefoneServico, nifResponsavel)
VALUES (229989092, 912424211, 990012132);

INSERT INTO funcionario(nome, nifFuncionario, morada, telefone, email)
VALUES ('Helena Marinho', 333888111, 'Rua de Cima, Matosinhos', 911222222, 'helenamarinho@gmail.com');

INSERT INTO manutencao (nifFuncionario, telefoneServico, nifResponsavel)
VALUES (333888111, 920000123, 990012132);

INSERT INTO funcionario(nome, nifFuncionario, morada, telefone, email)
VALUES ('Mauricio Castelo', 151514140, 'Rua de Cima, Matosinhos', 960000111, 'mauriciocastelo@gmail.com');

INSERT INTO manutencao (nifFuncionario, telefoneServico, nifResponsavel)
VALUES (151514140, 922992290, 990012132);

INSERT INTO funcionario(nome, nifFuncionario, morada, telefone, email)
VALUES ('Martim Manha', 333000333, 'Rua de Cima, Matosinhos', 910009191, 'martimmanha@gmail.com');

INSERT INTO manutencao (nifFuncionario, telefoneServico, nifResponsavel)
VALUES (333000333, 911999000, 151514140);


INSERT INTO intervencao(designacao, numeroAndar, numeroQuarto)
VALUES('Avaria no frigobar',1,10001);

INSERT INTO intervencao(designacao, numeroAndar, numeroQuarto)
VALUES('Avaria no aquecedor',1,10002);

INSERT INTO intervencao(designacao, numeroAndar, numeroQuarto)
VALUES('Avaria no ar condicionado',1,10010);

INSERT INTO intervencao(designacao, numeroAndar, numeroQuarto)
VALUES('Avaria na televisao',1,10011);

INSERT INTO intervencao(designacao, numeroAndar, numeroQuarto)
VALUES('Avaria no ar condicionado',2,20001);

INSERT INTO intervencao(designacao, numeroAndar, numeroQuarto)
VALUES('Avaria na banheira',2,20006);

INSERT INTO intervencao(designacao, numeroAndar, numeroQuarto)
VALUES('Avaria nas colunas',2,20015);

INSERT INTO intervencao(designacao, numeroAndar, numeroQuarto)
VALUES('Avaria no radio',2,20020);

INSERT INTO intervencao(designacao, numeroAndar, numeroQuarto)
VALUES('Avaria no forno',2,20005);

INSERT INTO intervencao(designacao, numeroAndar, numeroQuarto)
VALUES('Avaria no forno',1,10008);

INSERT INTO intervencao(designacao, numeroAndar, numeroQuarto)
VALUES('Avaria no microondas',1,10009);


INSERT INTO intervencao_manutencao(idIntervencao, registoAtividade, nifFuncionario, dataIntervencao)
VALUES (1, 'reparação de frigobar', 411109878, TO_DATE('2020-11-16 09:30:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_manutencao(idIntervencao, nifFuncionario)
VALUES (2, 411109878);

INSERT INTO intervencao_manutencao(idIntervencao, registoAtividade, nifFuncionario,dataIntervencao)
VALUES (3, 'reparação de ar condicionado', 400009878, TO_DATE('2020-11-18 08:20:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_manutencao(idIntervencao, nifFuncionario)
VALUES (4, 400009878);

INSERT INTO intervencao_manutencao(idIntervencao, registoAtividade, nifFuncionario,dataIntervencao)
VALUES (5, 'reparação de ar condicionado', 990012132, TO_DATE('2020-11-10 08:20:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_manutencao(idIntervencao, nifFuncionario)
VALUES (6, 990012132);

INSERT INTO intervencao_manutencao(idIntervencao, nifFuncionario)
VALUES (7,229989092);

INSERT INTO intervencao_manutencao(idIntervencao, nifFuncionario)
VALUES (8,333888111);

INSERT INTO intervencao_manutencao(idIntervencao, nifFuncionario)
VALUES (9,151514140);

INSERT INTO intervencao_manutencao(idIntervencao, nifFuncionario)
VALUES (10,333000333);

INSERT INTO intervencao_manutencao(idIntervencao, registoAtividade, nifFuncionario,dataIntervencao)
VALUES (11,'reparação do microondas',333000333, TO_DATE('2020-11-08 15:35:00', 'yyyy-mm-dd hh24:mi:ss'));




------EXEMPLOS ALINEA B-------
-- VALORES QUE OBEDECEM A CLIENTES QUE FIZERAM RESERVAS APENAS EM ABRIL OU JUNHO

-- EM QUARTOS SUITE (QUARTOS SINGLE ESTAO ENTRE O NUMERO 10031 E 10040 E ENTRE 20031 E 20040
INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(1,TO_DATE('2020-06-01 12:11:12', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-06-09 12:12:11', 'yyyy-mm-dd hh24:mi:ss'),100000001,1,10031,'MEDIA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(2,TO_DATE('2020-06-02 13:21:22', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-06-10 13:22:22', 'yyyy-mm-dd hh24:mi:ss'),120036769,1,10032,'MEDIA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(3,TO_DATE('2020-06-03 14:31:32', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-06-11 14:32:33', 'yyyy-mm-dd hh24:mi:ss'),121816141,1,10033,'MEDIA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(1,TO_DATE('2020-04-04 15:41:42', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-06-12 15:42:44', 'yyyy-mm-dd hh24:mi:ss'),144477444,2,20031,'MEDIA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(2,TO_DATE('2020-04-05 11:51:52', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-06-13 11:52:55', 'yyyy-mm-dd hh24:mi:ss'),109456769,2,20032,'MEDIA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(3,TO_DATE('2020-04-06 12:41:12', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-06-14 11:12:16', 'yyyy-mm-dd hh24:mi:ss'),111117171,2,20033,'MEDIA');

-- EM QUARTO NAO SUITE
INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(1,TO_DATE('2020-06-01 12:11:12', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-06-09 12:12:11', 'yyyy-mm-dd hh24:mi:ss'),109456769,1,10020,'MEDIA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(2,TO_DATE('2020-06-02 13:21:22', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-06-10 13:22:22', 'yyyy-mm-dd hh24:mi:ss'),211111777,1,10021,'MEDIA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(3,TO_DATE('2020-06-03 14:31:32', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-06-11 14:32:33', 'yyyy-mm-dd hh24:mi:ss'),100000000,1,10022,'MEDIA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(3,TO_DATE('2020-08-06 14:41:12', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-08-14 13:12:16', 'yyyy-mm-dd hh24:mi:ss'),100000000,2,20022,'MEDIA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(1,TO_DATE('2020-04-04 15:41:42', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-04-12 15:42:44', 'yyyy-mm-dd hh24:mi:ss'),111111112,2,20020,'MEDIA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(2,TO_DATE('2020-04-05 11:51:52', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-04-13 11:52:55', 'yyyy-mm-dd hh24:mi:ss'),120056769,2,20021,'MEDIA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(3,TO_DATE('2020-04-06 14:41:12', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-04-14 13:12:16', 'yyyy-mm-dd hh24:mi:ss'),111117171,2,20022,'MEDIA');

-- RESERVAS FUTURAS

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(1,TO_DATE('2020-12-06 14:41:12', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-12-14 13:12:16', 'yyyy-mm-dd hh24:mi:ss'),111117171,1,10008,'BAIXA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(2,TO_DATE('2020-12-12 14:41:12', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-12-16 13:12:16', 'yyyy-mm-dd hh24:mi:ss'),111117171,1,10029,'BAIXA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(3,TO_DATE('2020-01-14 14:41:12', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-01-17 13:12:16', 'yyyy-mm-dd hh24:mi:ss'),111117171,2,20031,'BAIXA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(1,TO_DATE('2020-01-03 14:41:12', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-01-19 13:12:16', 'yyyy-mm-dd hh24:mi:ss'),111117171,1,10018,'BAIXA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(2,TO_DATE('2020-02-06 14:41:12', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-02-14 13:12:16', 'yyyy-mm-dd hh24:mi:ss'),111117171,2,20012,'BAIXA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(3,TO_DATE('2020-02-04 14:41:12', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-02-11 13:12:16', 'yyyy-mm-dd hh24:mi:ss'),111117171,2,20007,'BAIXA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(1,TO_DATE('2020-03-04 14:41:12', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-03-14 13:12:16', 'yyyy-mm-dd hh24:mi:ss'),111117171,1,10015,'BAIXA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(2,TO_DATE('2020-03-05 14:41:12', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-03-10 13:12:16', 'yyyy-mm-dd hh24:mi:ss'),111117171,1,10007,'BAIXA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(3,TO_DATE('2020-03-03 14:41:12', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-03-09 13:12:16', 'yyyy-mm-dd hh24:mi:ss'),111117171,2,20022,'BAIXA');

INSERT INTO reserva( numeroPessoas, dataCheckIn, dataCheckOut, nifCliente, numeroAndar, numeroQuarto, nomeepoca)
VALUES(1,TO_DATE('2020-03-01 14:41:12', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2020-03-09 13:12:16', 'yyyy-mm-dd hh24:mi:ss'),111117171,2,20025,'BAIXA');
---- MUDANCA DO ESTADO DA RESERVA
UPDATE reserva
SET estado = 'FINALIZADA'
WHERE dataCheckOut < CURRENT_DATE AND estado != 'CANCELADA';

---- UPDATE DA RESERVA
UPDATE reserva 
SET custoCancelamento = 25, estado = 'CANCELADA'
WHERE dataCancelamento IS NOT NULL AND (dataCheckOut - dataCancelamento) < 15;

UPDATE reserva 
SET custoCancelamento = 0, estado = 'CANCELADA'
WHERE dataCancelamento IS NOT NULL AND (dataCheckOut - dataCancelamento) >= 15;

UPDATE reserva 
SET estado = 'ATIVA'
WHERE CURRENT_DATE BETWEEN dataCheckIn AND dataCheckOut AND dataCancelamento IS NULL;

---- UPDATE DE PRODUTOS E CONSUMO
--------------------------------------------------------
----------  TABELA PRODUTOS  ---------------------------
INSERT INTO produto(nome, preco)
VALUES('coca-cola',1.70);

INSERT INTO produto(nome, preco)
VALUES('agua',0.70);

INSERT INTO produto(nome, preco)
VALUES('7up',1.60);

INSERT INTO produto(nome, preco)
VALUES('fanta',1.65);

INSERT INTO produto(nome, preco)
VALUES('agua com gas',1.10);

INSERT INTO produto(nome, preco)
VALUES('tango',2.00);

INSERT INTO produto(nome, preco)
VALUES('pepsi',1.65);

INSERT INTO produto(nome, preco)
VALUES('twix',2);

INSERT INTO produto(nome, preco)
VALUES('mars',1.75);

INSERT INTO produto(nome, preco)
VALUES('maltesers',1.60);

INSERT INTO produto(nome, preco)
VALUES('skittles',2.30);

INSERT INTO produto(nome, preco)
VALUES('doritos',3.70);

INSERT INTO produto(nome, preco)
VALUES('oreo',5.20);

INSERT INTO produto(nome, preco)
VALUES('snickers',3.10);
--------------------------------------------------------
------------- TABELA CONSUMO    ------------------------

INSERT INTO conta(idReserva, dataabertura)
VALUES(2,TO_DATE('2020-03-12', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO consumo(numeroUnico, idProduto, nifFuncionario,dataRegistoConsumo)
VALUES(1,1,323434432,TO_DATE('2020-11-13 15:03:31', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO consumo(numeroUnico, idProduto, nifFuncionario,dataRegistoConsumo)
VALUES(1,2,323434432,TO_DATE('2020-11-14 14:05:24', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO consumo(numeroUnico, idProduto, nifFuncionario,dataRegistoConsumo)
VALUES(1,3,323434432,TO_DATE('2020-11-15 14:31:22', 'yyyy-mm-dd hh24:mi:ss'));


INSERT INTO conta(idReserva, dataabertura)
VALUES(6,TO_DATE('2020-03-12', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO consumo(numeroUnico, idProduto, nifFuncionario,dataRegistoConsumo)
VALUES(2,3,232345643,TO_DATE('2020-04-17 14:31:22', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO consumo(numeroUnico, idProduto, nifFuncionario,dataRegistoConsumo)
VALUES(2,5,323434432,TO_DATE('2020-04-17 14:31:22', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO consumo(numeroUnico, idProduto, nifFuncionario,dataRegistoConsumo)
VALUES(2,6,656543432,TO_DATE('2020-04-18 11:31:22', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO consumo(numeroUnico, idProduto, nifFuncionario,dataRegistoConsumo)
VALUES(2,8,656543432,TO_DATE('2020-04-18 11:31:22', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO consumo(numeroUnico, idProduto, nifFuncionario,dataRegistoConsumo)
VALUES(2,9,323434432,TO_DATE('2020-04-19 09:20:45', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO consumo(numeroUnico, idProduto, nifFuncionario,dataRegistoConsumo)
VALUES(2,10,656543432,TO_DATE('2020-04-20 08:43:09', 'yyyy-mm-dd hh24:mi:ss'));


INSERT INTO conta(idReserva, dataabertura)
VALUES(9,TO_DATE('2020-09-17', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO consumo(numeroUnico, idProduto, nifFuncionario,dataRegistoConsumo)
VALUES(3,4,232345643,TO_DATE('2020-09-20 08:43:09', 'yyyy-mm-dd hh24:mi:ss'));


INSERT INTO conta(idReserva, dataabertura)
VALUES(28,TO_DATE('2020-09-17', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO consumo(numeroUnico, idProduto, nifFuncionario,dataRegistoConsumo)
VALUES(4,6,555432321,TO_DATE('2020-09-18 08:43:09', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO consumo(numeroUnico, idProduto, nifFuncionario,dataRegistoConsumo)
VALUES(4,8,656543432,TO_DATE('2020-09-19 10:55:11', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO consumo(numeroUnico, idProduto, nifFuncionario,dataRegistoConsumo)
VALUES(4,8,555432321,TO_DATE('2020-09-20 11:16:15', 'yyyy-mm-dd hh24:mi:ss'));

-- INTERVENCOES

------------------------------------------------
------- INTERVENCAO CAMAREIRA ------------------
--
INSERT INTO intervencao(designacao, numeroAndar, numeroQuarto)
VALUES('Limpeza e Arrumaçao',2,20004);

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (12, 321432321, TO_DATE('2020-11-18 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (12, 321432321, TO_DATE('2020-11-19 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (12, 321432321, TO_DATE('2020-11-20 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (12, 321432321, TO_DATE('2020-11-21 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (12, 321432321, TO_DATE('2020-11-22 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (12, 321432321, TO_DATE('2020-11-23 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (12, 321432321, TO_DATE('2020-11-24 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (12, 321432321, TO_DATE('2020-11-25 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

--
INSERT INTO intervencao(designacao, numeroAndar, numeroQuarto)
VALUES('Limpeza e Arrumaçao',1,10006);

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (13, 555432321, TO_DATE('2020-04-18 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (13, 555432321, TO_DATE('2020-04-19 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (13, 555432321, TO_DATE('2020-04-20 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

--
INSERT INTO intervencao(designacao, numeroAndar, numeroQuarto)
VALUES('Limpeza e Arrumaçao',1,10031);

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (14, 656543432, TO_DATE('2020-04-18 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (14, 656543432, TO_DATE('2020-04-19 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (14, 656543432, TO_DATE('2020-04-20 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

--
INSERT INTO intervencao(designacao, numeroAndar, numeroQuarto)
VALUES('Limpeza e Arrumaçao',1,10015);

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (14, 323434432, TO_DATE('2020-05-10 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (14, 323434432, TO_DATE('2020-05-11 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (14, 323434432, TO_DATE('2020-05-12 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (14, 323434432, TO_DATE('2020-05-13 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (14, 323434432, TO_DATE('2020-05-14 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (14, 323434432, TO_DATE('2020-05-15 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (14, 323434432, TO_DATE('2020-05-16 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (14, 323434432, TO_DATE('2020-05-17 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (14, 323434432, TO_DATE('2020-05-18 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (14, 323434432, TO_DATE('2020-05-19 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

--
INSERT INTO intervencao(designacao, numeroAndar, numeroQuarto)
VALUES('Limpeza e Arrumaçao',1,10023);

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (15, 232345643, TO_DATE('2020-09-18 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (15, 232345643, TO_DATE('2020-09-19 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (15, 232345643, TO_DATE('2020-09-20 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (15, 232345643, TO_DATE('2020-09-21 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (15, 232345643, TO_DATE('2020-09-22 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (15, 232345643, TO_DATE('2020-09-23 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (15, 232345643, TO_DATE('2020-09-24 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (15, 232345643, TO_DATE('2020-09-25 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

--
INSERT INTO intervencao(designacao, numeroAndar, numeroQuarto)
VALUES('Limpeza e Arrumaçao',2,20032);

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (16, 232345643, TO_DATE('2020-10-11 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (16, 232345643, TO_DATE('2020-10-12 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (16, 232345643, TO_DATE('2020-10-13 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (16, 232345643, TO_DATE('2020-10-14 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (16, 232345643, TO_DATE('2020-10-15 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (16, 232345643, TO_DATE('2020-10-16 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (16, 232345643, TO_DATE('2020-10-17 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

--
INSERT INTO intervencao(designacao, numeroAndar, numeroQuarto)
VALUES('Limpeza e Arrumaçao',2,20006);

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (17, 321432321, TO_DATE('2020-06-02 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (17, 321432321, TO_DATE('2020-06-03 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (17, 321432321, TO_DATE('2020-06-04 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (17, 321432321, TO_DATE('2020-06-05 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (17, 321432321, TO_DATE('2020-06-06 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

--
INSERT INTO intervencao(designacao, numeroAndar, numeroQuarto)
VALUES('Limpeza e Arrumaçao',1,10003);

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (18, 321432321, TO_DATE('2020-07-13 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (18, 321432321, TO_DATE('2020-07-14 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (18, 321432321, TO_DATE('2020-07-15 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (18, 321432321, TO_DATE('2020-07-16 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (18, 321432321, TO_DATE('2020-07-17 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (18, 321432321, TO_DATE('2020-07-18 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (18, 321432321, TO_DATE('2020-07-19 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (18, 321432321, TO_DATE('2020-07-20 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));


--
INSERT INTO intervencao(designacao, numeroAndar, numeroQuarto)
VALUES('Limpeza e Arrumaçao',1,10021);

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (19, 232345643, TO_DATE('2020-06-19 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (19, 232345643, TO_DATE('2020-06-20 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (19, 232345643, TO_DATE('2020-06-21 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (19, 232345643, TO_DATE('2020-06-22 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (19, 232345643, TO_DATE('2020-06-23 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (19, 232345643, TO_DATE('2020-06-24 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (19, 232345643, TO_DATE('2020-06-25 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

--
INSERT INTO intervencao(designacao, numeroAndar, numeroQuarto)
VALUES('Limpeza e Arrumaçao',1,10029);

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (20, 323434432, TO_DATE('2020-09-02 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (20, 323434432, TO_DATE('2020-09-03 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (20, 323434432, TO_DATE('2020-09-04 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (20, 323434432, TO_DATE('2020-09-05 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (20, 323434432, TO_DATE('2020-09-06 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (20, 323434432, TO_DATE('2020-09-07 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (20, 323434432, TO_DATE('2020-09-08 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (20, 323434432, TO_DATE('2020-09-09 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (20, 323434432, TO_DATE('2020-09-10 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (20, 323434432, TO_DATE('2020-09-11 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (20, 323434432, TO_DATE('2020-09-12 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

--
INSERT INTO intervencao(designacao, numeroAndar, numeroQuarto)
VALUES('Limpeza e Arrumaçao',2,20030);

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (21, 321432321, TO_DATE('2020-07-12 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (21, 321432321, TO_DATE('2020-07-13 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (21, 321432321, TO_DATE('2020-07-14 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (21, 321432321, TO_DATE('2020-07-15 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (21, 321432321, TO_DATE('2020-07-16 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

--
INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (17, 555432321, TO_DATE('2020-08-18 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (17, 555432321, TO_DATE('2020-08-19 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (17, 555432321, TO_DATE('2020-08-20 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (17, 555432321, TO_DATE('2020-08-21 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (17, 555432321, TO_DATE('2020-08-22 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (17, 555432321, TO_DATE('2020-08-23 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (17, 555432321, TO_DATE('2020-08-24 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (17, 555432321, TO_DATE('2020-08-25 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

--
INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (14, 656543432, TO_DATE('2020-08-02 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (14, 656543432, TO_DATE('2020-08-03 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (14, 656543432, TO_DATE('2020-08-04 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (14, 656543432, TO_DATE('2020-08-05 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (14, 656543432, TO_DATE('2020-08-06 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (14, 656543432, TO_DATE('2020-08-07 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (14, 656543432, TO_DATE('2020-08-08 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (14, 656543432, TO_DATE('2020-08-09 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

--
INSERT INTO intervencao(designacao, numeroAndar, numeroQuarto)
VALUES('Limpeza e Arrumaçao',1,10035);

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (22, 323434432, TO_DATE('2020-08-01 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (22, 323434432, TO_DATE('2020-08-02 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (22, 323434432, TO_DATE('2020-08-03 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (22, 323434432, TO_DATE('2020-08-04 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (22, 323434432, TO_DATE('2020-08-05 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (22, 323434432, TO_DATE('2020-08-06 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (22, 323434432, TO_DATE('2020-08-07 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (22, 323434432, TO_DATE('2020-08-08 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (22, 323434432, TO_DATE('2020-08-09 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

--
INSERT INTO intervencao(designacao, numeroAndar, numeroQuarto)
VALUES('Limpeza e Arrumaçao',1,10005);

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (23, 323434432, TO_DATE('2020-07-16 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (23, 323434432, TO_DATE('2020-07-17 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (23, 323434432, TO_DATE('2020-07-18 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (23, 323434432, TO_DATE('2020-07-19 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (23, 323434432, TO_DATE('2020-07-20 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

--
INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (19, 656543432, TO_DATE('2020-06-21 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (19, 656543432, TO_DATE('2020-06-22 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (19, 656543432, TO_DATE('2020-06-23 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (19, 656543432, TO_DATE('2020-06-24 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (19, 656543432, TO_DATE('2020-06-25 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

--
INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (20, 232345643, TO_DATE('2020-09-05 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (20, 232345643, TO_DATE('2020-09-06 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (20, 232345643, TO_DATE('2020-09-07 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (20, 232345643, TO_DATE('2020-09-08 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (20, 232345643, TO_DATE('2020-09-09 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (20, 232345643, TO_DATE('2020-09-10 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (20, 232345643, TO_DATE('2020-09-11 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (20, 232345643, TO_DATE('2020-09-12 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

--
INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (21, 232345643, TO_DATE('2020-07-14 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (21, 232345643, TO_DATE('2020-07-15 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (21, 232345643, TO_DATE('2020-07-16 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

--
INSERT INTO intervencao(designacao, numeroAndar, numeroQuarto)
VALUES('Limpeza e Arrumaçao',2,20010);

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (24, 323434432, TO_DATE('2020-08-16 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (24, 323434432, TO_DATE('2020-08-17 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (24, 323434432, TO_DATE('2020-08-18 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (24, 323434432, TO_DATE('2020-08-19 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (24, 323434432, TO_DATE('2020-08-20 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (24, 323434432, TO_DATE('2020-08-21 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (24, 323434432, TO_DATE('2020-08-22 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (24, 323434432, TO_DATE('2020-08-23 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (24, 323434432, TO_DATE('2020-08-24 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (24, 323434432, TO_DATE('2020-08-25 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

--
INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (23, 656543432, TO_DATE('2020-07-12 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (23, 656543432, TO_DATE('2020-07-13 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (23, 656543432, TO_DATE('2020-07-14 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (23, 656543432, TO_DATE('2020-07-15 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (23, 656543432, TO_DATE('2020-07-16 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (23, 656543432, TO_DATE('2020-07-17 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

--
INSERT INTO intervencao(designacao, numeroAndar, numeroQuarto)
VALUES('Limpeza e Arrumaçao',1,10027);

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (25, 323434432, TO_DATE('2020-06-10 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (25, 323434432, TO_DATE('2020-06-11 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (25, 323434432, TO_DATE('2020-06-12 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (25, 323434432, TO_DATE('2020-06-13 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

--
INSERT INTO intervencao(designacao, numeroAndar, numeroQuarto)
VALUES('Limpeza e Arrumaçao',2,20008);

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (26, 323434432, TO_DATE('2020-06-18 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (26, 323434432, TO_DATE('2020-06-19 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (26, 323434432, TO_DATE('2020-06-20 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (26, 323434432, TO_DATE('2020-06-21 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (26, 323434432, TO_DATE('2020-06-22 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (26, 323434432, TO_DATE('2020-06-23 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (26, 323434432, TO_DATE('2020-06-24 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (26, 323434432, TO_DATE('2020-06-25 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

--
INSERT INTO intervencao(designacao, numeroAndar, numeroQuarto)
VALUES('Limpeza e Arrumaçao',2,20033);

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (27, 323434432, TO_DATE('2020-08-12 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (27, 323434432, TO_DATE('2020-08-13 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (27, 323434432, TO_DATE('2020-08-14 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (27, 323434432, TO_DATE('2020-08-15 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (27, 323434432, TO_DATE('2020-08-16 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (27, 323434432, TO_DATE('2020-08-17 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (27, 323434432, TO_DATE('2020-08-18 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (27, 323434432, TO_DATE('2020-08-19 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

--
INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (12, 656543432, TO_DATE('2020-09-18 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (12, 656543432, TO_DATE('2020-09-19 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (12, 656543432, TO_DATE('2020-09-20 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (12, 656543432, TO_DATE('2020-09-21 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (12, 656543432, TO_DATE('2020-09-22 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (12, 656543432, TO_DATE('2020-09-23 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (12, 656543432, TO_DATE('2020-09-24 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (12, 656543432, TO_DATE('2020-09-25 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

--
INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (14, 232345643, TO_DATE('2020-06-10 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (14, 232345643, TO_DATE('2020-06-11 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (14, 232345643, TO_DATE('2020-06-12 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (14, 232345643, TO_DATE('2020-06-13 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

--
INSERT INTO intervencao(designacao, numeroAndar, numeroQuarto)
VALUES('Limpeza e Arrumaçao',2,20015);

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (29, 321432321, TO_DATE('2020-06-01 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (29, 321432321, TO_DATE('2020-06-02 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (29, 321432321, TO_DATE('2020-06-03 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (29, 321432321, TO_DATE('2020-06-04 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (29, 321432321, TO_DATE('2020-06-05 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (29, 321432321, TO_DATE('2020-06-06 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (29, 321432321, TO_DATE('2020-06-07 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (29, 321432321, TO_DATE('2020-06-08 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (29, 321432321, TO_DATE('2020-06-09 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (29, 321432321, TO_DATE('2020-06-10 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (29, 321432321, TO_DATE('2020-06-11 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (29, 321432321, TO_DATE('2020-06-12 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (29, 321432321, TO_DATE('2020-06-13 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (29, 321432321, TO_DATE('2020-06-14 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO intervencao_limpeza(idIntervencao, nifFuncionario, dataIntervencao)
VALUES (29, 321432321, TO_DATE('2020-06-15 8:00:00', 'yyyy-mm-dd hh24:mi:ss'));

--------------------------------------------------------
------------- TABELA CONSUMO    ------------------------

 
INSERT INTO conta(idReserva, dataabertura)
VALUES(24,TO_DATE('2020-03-12', 'yyyy-mm-dd'));
INSERT INTO conta(idReserva, dataabertura)
VALUES(34,TO_DATE('2020-03-12', 'yyyy-mm-dd'));
INSERT INTO conta(idReserva, dataabertura)
VALUES(29,TO_DATE('2020-03-12', 'yyyy-mm-dd'));

 


INSERT INTO consumo(numeroUnico, idProduto, nifFuncionario, dataRegistoConsumo)
VALUES(5,1,323434432, TO_DATE('2020-07-12 12:23:33', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO consumo(numeroUnico, idProduto, nifFuncionario, dataRegistoConsumo)
VALUES(5,3,323434432, TO_DATE('2020-07-13 11:44:54', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO consumo(numeroUnico, idProduto, nifFuncionario, dataRegistoConsumo)
VALUES(5,4,323434432, TO_DATE('2020-07-14 13:42:56','yyyy-mm-dd hh24:mi:ss'));

INSERT INTO consumo(numeroUnico, idProduto, nifFuncionario, dataRegistoConsumo)
VALUES(5,5,323434432, TO_DATE('2020-07-15 15:56:31', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO consumo(numeroUnico, idProduto, nifFuncionario, dataRegistoConsumo)
VALUES(6,6,323434432, TO_DATE('2020-07-06 16:34:39', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO consumo(numeroUnico, idProduto, nifFuncionario, dataRegistoConsumo)
VALUES(6,7,323434432, TO_DATE('2020-07-07 17:43:20', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO consumo(numeroUnico, idProduto, nifFuncionario, dataRegistoConsumo)
VALUES(6,8,323434432, TO_DATE('2020-07-08 15:31:30', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO consumo(numeroUnico, idProduto, nifFuncionario, dataRegistoConsumo)
VALUES(7,9,323434432, TO_DATE('2020-07-23 11:35:23', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO consumo(numeroUnico, idProduto, nifFuncionario, dataRegistoConsumo)
VALUES(7,10,323434432, TO_DATE('2020-07-24 13:26:30', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO consumo(numeroUnico, idProduto, nifFuncionario, dataRegistoConsumo)
VALUES(7,11,323434432, TO_DATE('2020-07-25 15:53:51', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO conta(idReserva, dataabertura)
VALUES(27,TO_DATE('2020-08-12 11:12:32', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO consumo(numeroUnico, idProduto, nifFuncionario,dataRegistoConsumo)
VALUES(8,3,232345643,TO_DATE('2020-04-17 14:31:22', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO consumo(numeroUnico, idProduto, nifFuncionario,dataRegistoConsumo)
VALUES(8,5,323434432,TO_DATE('2020-04-17 14:31:22', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO consumo(numeroUnico, idProduto, nifFuncionario,dataRegistoConsumo)
VALUES(8,6,656543432,TO_DATE('2020-04-18 11:31:22', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO consumo(numeroUnico, idProduto, nifFuncionario,dataRegistoConsumo)
VALUES(8,8,656543432,TO_DATE('2020-04-18 11:31:22', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO consumo(numeroUnico, idProduto, nifFuncionario,dataRegistoConsumo)
VALUES(8,8,323434432,TO_DATE('2020-04-19 09:20:45', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO consumo(numeroUnico, idProduto, nifFuncionario,dataRegistoConsumo)
VALUES(8,10,656543432,TO_DATE('2020-04-20 08:43:09', 'yyyy-mm-dd hh24:mi:ss'));

---------------------------------------------------
--------    TABELA TIPO PAGAMENTOS  -------------------
INSERT INTO tipopagamento(designacao)
VALUES ('cheque');

INSERT INTO tipopagamento(designacao)
VALUES ('cartão de crédito');

INSERT INTO tipopagamento(designacao)
VALUES ('cartão de débito');

---------------------------------------------------
--------    TABELA FATURA  -------------------
INSERT INTO fatura(valortotal,idReserva)
VALUES (1200,1);

INSERT INTO pagamento(idFatura, valorTotal, tipoPagamento)
VALUES (1, 1200, 'cartão de crédito');

INSERT INTO fatura(valorTotal, idReserva)
VALUES (9600,2);

INSERT INTO pagamento(idFatura, valorTotal, tipoPagamento)
VALUES (2, 9600, 'cartão de crédito');

INSERT INTO fatura(valortotal,idReserva)
VALUES (3500,3);

INSERT INTO pagamento(idFatura, valorTotal, tipoPagamento)
VALUES (3, 3500, 'cartão de crédito');

INSERT INTO fatura(valortotal,idReserva)
VALUES (3600,4);

INSERT INTO pagamento(idFatura, valorTotal, tipoPagamento)
VALUES (4, 3600, 'cartão de crédito');

INSERT INTO fatura(valortotal,idReserva)
VALUES (3200,5);

INSERT INTO pagamento(idFatura, valorTotal, tipoPagamento)
VALUES (5, 3200, 'cartão de crédito');

INSERT INTO fatura(valortotal,idReserva)
VALUES (1275,6);

INSERT INTO pagamento(idFatura, valorTotal, tipoPagamento)
VALUES (6, 1275, 'cartão de crédito');

INSERT INTO fatura(valortotal,idReserva)
VALUES (1425,7);

INSERT INTO pagamento(idFatura, valorTotal, tipoPagamento)
VALUES (7, 1425, 'cartão de crédito');

INSERT INTO fatura(valortotal,idReserva)
VALUES (6250,8);

INSERT INTO pagamento(idFatura, valorTotal, tipoPagamento)
VALUES (8, 6250, 'cartão de crédito');

INSERT INTO fatura(valortotal,idReserva)
VALUES (4200,9);

INSERT INTO pagamento(idFatura, valorTotal, tipoPagamento)
VALUES (9, 4200, 'cartão de crédito');

INSERT INTO fatura(valortotal,idReserva)
VALUES (2000,10);

INSERT INTO pagamento(idFatura, valorTotal, tipoPagamento)
VALUES (10, 2000, 'cartão de crédito');

INSERT INTO fatura(valortotal,idReserva)
VALUES (4500,11);

INSERT INTO pagamento(idFatura, valorTotal, tipoPagamento)
VALUES (11, 4500, 'cartão de crédito');

INSERT INTO fatura(valortotal,idReserva)
VALUES (1700,12);

INSERT INTO pagamento(idFatura, valorTotal, tipoPagamento)
VALUES (12, 1700, 'cartão de crédito');

INSERT INTO fatura(valortotal,idReserva)
VALUES (3400,13);

INSERT INTO pagamento(idFatura, valorTotal, tipoPagamento)
VALUES (13, 3400, 'cartão de crédito');

INSERT INTO fatura(valortotal,idReserva)
VALUES (2500,14);

INSERT INTO pagamento(idFatura, valorTotal, tipoPagamento)
VALUES (14, 2500, 'cartão de crédito');

INSERT INTO fatura(valortotal,idReserva)
VALUES (6700,15);

INSERT INTO pagamento(idFatura, valorTotal, tipoPagamento)
VALUES (15, 6700, 'cartão de crédito');

INSERT INTO fatura(valortotal,idReserva)
VALUES (4560,16);

INSERT INTO pagamento(idFatura, valorTotal, tipoPagamento)
VALUES (16, 4560, 'cartão de crédito');

INSERT INTO fatura(valortotal,idReserva)
VALUES (7400,17);

INSERT INTO pagamento(idFatura, valorTotal, tipoPagamento)
VALUES (17, 7400, 'cartão de crédito');

INSERT INTO fatura(valortotal,idReserva)
VALUES (3450,18);

INSERT INTO pagamento(idFatura, valorTotal, tipoPagamento)
VALUES (18, 3450, 'cartão de crédito');

INSERT INTO fatura(valortotal,idReserva)
VALUES (4560,19);

INSERT INTO pagamento(idFatura, valorTotal, tipoPagamento)
VALUES (19, 4560, 'cartão de crédito');

INSERT INTO fatura(valortotal,idReserva)
VALUES (3489,20);

INSERT INTO pagamento(idFatura, valorTotal, tipoPagamento)
VALUES (20, 3489, 'cartão de crédito');

INSERT INTO fatura(valortotal,idReserva)
VALUES (987,21);

INSERT INTO pagamento(idFatura, valorTotal, tipoPagamento)
VALUES (21, 987, 'cartão de crédito');

INSERT INTO fatura(valortotal,idReserva)
VALUES (450,22);

INSERT INTO pagamento(idFatura, valorTotal, tipoPagamento)
VALUES (22, 450, 'cartão de crédito');

INSERT INTO fatura(valortotal,idReserva)
VALUES (6780,23);

INSERT INTO pagamento(idFatura, valorTotal, tipoPagamento)
VALUES (23, 6780, 'cartão de crédito');

INSERT INTO fatura(valortotal,idReserva)
VALUES (5670,24);

INSERT INTO pagamento(idFatura, valorTotal, tipoPagamento)
VALUES (24, 5670, 'cartão de crédito');

INSERT INTO fatura(valortotal,idReserva)
VALUES (4560,25);

INSERT INTO pagamento(idFatura, valorTotal, tipoPagamento)
VALUES (25, 4560, 'cartão de crédito');

INSERT INTO fatura(valortotal,idReserva)
VALUES (3450,26);

INSERT INTO pagamento(idFatura, valorTotal, tipoPagamento)
VALUES (26, 3450, 'cartão de crédito');

INSERT INTO fatura(valortotal,idReserva)
VALUES (4560,27);

INSERT INTO pagamento(idFatura, valorTotal, tipoPagamento)
VALUES (27, 4560, 'cartão de crédito');

INSERT INTO fatura(valortotal,idReserva)
VALUES (2345,28);

INSERT INTO pagamento(idFatura, valorTotal, tipoPagamento)
VALUES (28, 2345, 'cartão de crédito');

INSERT INTO fatura(valortotal,idReserva)
VALUES (3200,29);

INSERT INTO pagamento(idFatura, valorTotal, tipoPagamento)
VALUES (29, 3200, 'cartão de crédito');

INSERT INTO fatura(valortotal,idReserva)
VALUES (2700,30);

INSERT INTO pagamento(idFatura, valorTotal, tipoPagamento)
VALUES (30, 2700, 'cartão de crédito');

INSERT INTO fatura(valortotal,idReserva)
VALUES (6450,31);

INSERT INTO pagamento(idFatura, valorTotal, tipoPagamento)
VALUES (31, 6450, 'cartão de crédito');

INSERT INTO fatura(valortotal,idReserva)
VALUES (1600,32);

INSERT INTO pagamento(idFatura, valorTotal, tipoPagamento)
VALUES (32, 1600, 'cartão de crédito');

INSERT INTO fatura(valortotal,idReserva)
VALUES (1780,33);

INSERT INTO pagamento(idFatura, valorTotal, tipoPagamento)
VALUES (33, 1780, 'cartão de crédito');

INSERT INTO fatura(valortotal,idReserva)
VALUES (4500,34);

INSERT INTO pagamento(idFatura, valorTotal, tipoPagamento)
VALUES (34, 4500, 'cartão de crédito');

INSERT INTO fatura(valortotal,idReserva)
VALUES (2100,35);

INSERT INTO pagamento(idFatura, valorTotal, tipoPagamento)
VALUES (35, 2100, 'cartão de crédito');

INSERT INTO fatura(valortotal,idReserva)
VALUES (3650,36);

INSERT INTO pagamento(idFatura, valorTotal, tipoPagamento)
VALUES (36, 3650, 'cartão de crédito');

INSERT INTO fatura(valortotal,idReserva)
VALUES (1450,37);

INSERT INTO pagamento(idFatura, valorTotal, tipoPagamento)
VALUES (37, 1450, 'cartão de crédito');

INSERT INTO fatura(valortotal,idReserva)
VALUES (1200,38);

INSERT INTO pagamento(idFatura, valorTotal, tipoPagamento)
VALUES (38, 1200, 'cartão de crédito');

INSERT INTO fatura(valortotal,idReserva)
VALUES (2250,40);

INSERT INTO pagamento(idFatura, valorTotal, tipoPagamento)
VALUES (39, 2250, 'cartão de crédito');

INSERT INTO fatura(valortotal,idReserva)
VALUES (2800,41);

INSERT INTO pagamento(idFatura, valorTotal, tipoPagamento)
VALUES (40, 2800, 'cartão de crédito');

INSERT INTO fatura(valortotal,idReserva)
VALUES (2500,42);

INSERT INTO pagamento(idFatura, valorTotal, tipoPagamento)
VALUES (41, 2500, 'cartão de crédito');

INSERT INTO fatura(valortotal,idReserva)
VALUES (1800,43);

INSERT INTO pagamento(idFatura, valorTotal, tipoPagamento)
VALUES (42, 1800, 'cartão de crédito');

INSERT INTO fatura(valortotal,idReserva)
VALUES (4050,44);

INSERT INTO pagamento(idFatura, valorTotal, tipoPagamento)
VALUES (43, 4050, 'cartão de crédito');

INSERT INTO fatura(valortotal,idReserva)
VALUES (3150,45);

INSERT INTO pagamento(idFatura, valorTotal, tipoPagamento)
VALUES (44, 3150, 'cartão de crédito');

INSERT INTO fatura(valortotal,idReserva)
VALUES (2700,46);

INSERT INTO pagamento(idFatura, valorTotal, tipoPagamento)
VALUES (45, 2700, 'cartão de crédito');

INSERT INTO fatura(valortotal,idReserva)
VALUES (450,47);

INSERT INTO pagamento(idFatura, valorTotal, tipoPagamento)
VALUES (46, 450, 'cartão de crédito');

INSERT INTO fatura(valortotal,idReserva)
VALUES (2000,48);

INSERT INTO pagamento(idFatura, valorTotal, tipoPagamento)
VALUES (47, 2000, 'cartão de crédito');

INSERT INTO fatura(valortotal,idReserva)
VALUES (4375,49);

INSERT INTO pagamento(idFatura, valorTotal, tipoPagamento)
VALUES (48, 4375, 'cartão de crédito');

UPDATE conta 
SET dataabertura = TO_DATE('2019-03-12', 'yyyy-mm-dd')
WHERE idreserva = 27;
