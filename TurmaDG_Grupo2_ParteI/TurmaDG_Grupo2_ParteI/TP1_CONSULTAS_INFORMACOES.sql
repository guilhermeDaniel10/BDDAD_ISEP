
-- Andares, tipos de quarto e Quartos presentes na base de dados
SELECT *
FROM andar;

SELECT * 
FROM tipoQuarto; 

SELECT *
FROM quarto q
WHERE q.numeroAndar = 1;

-- Quartos ocupados numa determinada altura
SELECT q.numeroAndar, q.numeroQuarto, r.dataCheckIn, r.dataCheckOut, c.nome, r.nifCliente, r.estado
FROM quarto q
INNER JOIN reserva r ON q.numeroQuarto = r.numeroQuarto
INNER JOIN cliente c ON c.nifCliente = r.nifCliente
WHERE CURRENT_DATE >= r.dataCheckIn AND CURRENT_DATE <= r.dataCheckOut AND r.estado = 'ATIVA'

-- Quartos livres numa determinada altura
SELECT q.numeroAndar, q.numeroQuarto
FROM quarto q
WHERE q.numeroAndar NOT IN (
SELECT q.numeroAndar
FROM quarto q
INNER JOIN reserva r ON q.numeroQuarto = r.numeroQuarto
INNER JOIN cliente c ON c.nifCliente = r.nifCliente
WHERE CURRENT_DATE >= r.dataCheckIn AND CURRENT_DATE <= r.dataCheckOut AND r.estado = 'ATIVA');


SELECT q.numeroAndar, q.numeroQuarto, r.dataCheckIn, r.dataCheckOut, c.nome, r.nifCliente, r.estado
FROM quarto q
INNER JOIN reserva r ON q.numeroQuarto = r.numeroQuarto
INNER JOIN cliente c ON c.nifCliente = r.nifCliente
WHERE r.estado = 'RESERVADA'
-- Clientes
SELECT *
FROM cliente;

-- Tipo de funcionarios e Funcionarios
SELECT f.nome, f.nifFuncionario, 'Manutencao' as Tipo_Funcionario
FROM funcionario f
INNER JOIN manutencao m ON m.nifFuncionario = f.nifFuncionario
UNION
SELECT f.nome, f.nifFuncionario, 'Camareira' as Tipo_Funcionario
FROM funcionario f
INNER JOIN camareira c ON c.nifFuncionario = f.nifFuncionario
UNION
SELECT f.nome, f.nifFuncionario, 'Restauracao' as Tipo_Funcionario
FROM funcionario f
INNER JOIN restauracao r ON r.nifFuncionario = f.nifFuncionario
UNION
SELECT f.nome, f.nifFuncionario, 'Rececao' as Tipo_Funcionario
FROM funcionario f
INNER JOIN rececao re ON re.nifFuncionario = f.nifFuncionario;

-- Reservas
SELECT *
FROM reserva

-- Produtos, Consumo e Conta
SELECT cT.numeroUnico, c.nome, c.nifCliente, count(pr.idProduto) as Nmr_produtos_consumidos,sum(pr.preco) as Preco_total
FROM cliente c
INNER JOIN reserva r ON r.nifCliente = c.nifCliente
INNER JOIN conta cT ON r.idReserva = cT.idReserva
INNER JOIN consumo cons ON cons.numeroUnico = cT.numeroUnico
INNER JOIN produto pr ON cons.idProduto = pr.idProduto
GROUP BY (ct.numeroUnico, c.nome, c.nifCliente)
ORDER BY cT.numeroUnico;

-- Consulta intervencoes
SELECT im.idIntervencao, i.designacao, f.nome, im.nifFuncionario
FROM intervencao_manutencao im
INNER JOIN intervencao i ON im.idIntervencao = i.idIntervencao 
INNER JOIN funcionario f ON f.nifFuncionario = im.nifFuncionario 
WHERE registoAtividade IS NOT NULL
UNION ALL
SELECT il.idIntervencao, i.designacao, f.nome, il.nifFuncionario
FROM intervencao_limpeza il
INNER JOIN intervencao i ON il.idIntervencao = i.idIntervencao
INNER JOIN funcionario f ON f.nifFuncionario = il.nifFuncionario

-- Consulta de faturas e pagamentos
SELECT f.idFatura, c.nome, c.nifCliente, f.valorTotal, p.idPagamento, p.valorTotal, p.tipoPagamento
FROM fatura f
INNER JOIN reserva r ON r.idReserva = f.idReserva
INNER JOIN cliente c ON r.nifCliente = c.nifCliente
INNER JOIN pagamento p ON p.idFatura = f.idFatura




