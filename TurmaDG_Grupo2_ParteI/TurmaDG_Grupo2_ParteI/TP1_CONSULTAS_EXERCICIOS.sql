---PARTE 1- Guilherme Daniel

----------- alinea a ---------------------------------------------------------------------------------------------
SELECT DISTINCT f.nome, f.nifFuncionario, inter.designacao, inter.idIntervencao, inter.numeroAndar, inter.numeroQuarto
FROM manutencao m
INNER JOIN funcionario f on f.nifFuncionario = m.nifFuncionario
INNER JOIN intervencao_manutencao inM on inM.nifFuncionario = m.nifFuncionario
INNER JOIN intervencao inter on inter.idIntervencao = inM.idIntervencao
WHERE m.nifFuncionario NOT IN(
   SELECT m.nifFuncionario
   FROM manutencao m
   INNER JOIN intervencao_manutencao inM on inM.nifFuncionario = m.nifFuncionario
   WHERE 24 * (CURRENT_DATE - inM.dataIntervencao) <= 48 AND inM.registoAtividade IS NOT NULL) AND inM.registoAtividade IS NULL;

----------- alinea b 

SELECT r.dataCheckIn as DATA, TO_CHAR(r.dataCheckIn,'HH24:MI:SS') as HORA, c.nome, c.nifCliente, CASE q.designacaoTipo WHEN 'suite' THEN e.localidade ELSE ' ' END as Zona_do_pais
FROM cliente c
INNER JOIN reserva r on r.nifCliente = c.nifCliente  
INNER JOIN endereco e on e.nifcliente = c.nifcliente
INNER JOIN quarto q on r.numeroQuarto = q.numeroQuarto
WHERE c.nifCliente NOT IN (
     SELECT c.nifCliente
     FROM cliente c
     INNER JOIN reserva r on r.nifCliente = c.nifCliente
     WHERE EXTRACT(MONTH FROM r.dataCheckIn) != 4 AND EXTRACT(MONTH FROM r.dataCheckIn) != 6)
ORDER BY c.nome, r.dataCheckIn DESC;

-- PARTE 2- Lucas Sousa
-- alinea a

SELECT DISTINCT c.nome, e.localidade, e.concelho
FROM cliente c
INNER JOIN endereco e on c.nifCliente = e.nifCliente
INNER JOIN reserva r on c.nifCliente = r.nifCliente
WHERE r.numeroquarto IN
    ( SELECT q.numeroquarto
      FROM cliente c
      INNER JOIN reserva r on r.nifCliente = c.nifCliente
      INNER JOIN quarto q on q.numeroquarto = r.numeroquarto
      INNER JOIN endereco e on c.nifCliente = e.nifCliente
      WHERE c.nome LIKE '%Jose Silva%'
                    AND e.concelho LIKE '%Vila Real%'
                    AND r.estado LIKE '%FINALIZADA%')
        AND r.estado LIKE '%FINALIZADA%'
        AND (c.nome NOT LIKE '%Jose Silva%' and e.concelho NOT LIKE '%Vila Real%');

-- alinea b

WITH 
    lista as
        (SELECT q.numeroQuarto as nQuarto, q.designacaoTipo as tipo, (r.dataCheckOut - r.dataCheckIn) as diff
                FROM quarto q
                INNER JOIN reserva r ON r.numeroQuarto = q.numeroQuarto),
    media as 
        (SELECT  AVG(r.dataCheckOut - r.dataCheckIn) m, q.designacaoTipo as tipo2
                FROM quarto q
                INNER JOIN reserva r on q.numeroQuarto = r.numeroQuarto
                GROUP BY (q.designacaoTipo)),
                
    intervencoes as 
        (SELECT mes, tipo as TipoQuarto ,funNome as Camareira, max(fun) as maximo
                FROM( 
                SELECT distinct EXTRACT (MONTH FROM il.dataIntervencao) mes, nQuarto, tipo, diff, i.idIntervencao idI , f.nome funNome, il.nifFuncionario ilNif, count(il.idIntervencao)  fun
                    FROM lista
                    INNER JOIN intervencao i ON i.numeroQuarto = nQuarto
                    INNER JOIN intervencao_limpeza il ON i.idIntervencao = il.idIntervencao
                    INNER JOIN funcionario f ON f.nifFuncionario = il.nifFuncionario
                    WHERE diff > (SELECT m FROM media WHERE tipo = tipo2)
                    and il.dataIntervencao between  add_months(sysdate,-6) AND sysdate
                         GROUP BY (EXTRACT (MONTH FROM il.dataIntervencao), nQuarto, tipo, diff, i.idIntervencao, f.nome, il.nifFuncionario)
                        ORDER BY mes,nQuarto, fun DESC)
                group by ( mes, tipo, funNome)
                ORDER BY mes , max(fun) ),
     maximos as  
        (SELECT mes, TipoQuarto , max(maximo) as Mcamareira
               FROM intervencoes
               GROUP BY (mes, TipoQuarto)
               ORDER BY mes, TipoQuarto)
               
SELECT intervencoes.mes , intervencoes.TipoQuarto, Camareira
    FROM intervencoes, maximos
    where intervencoes.mes = maximos.mes
    and intervencoes.TipoQuarto = maximos.TipoQuarto
    and intervencoes.maximo = maximos.Mcamareira;

--PARTE 3- Kevin Sousa
----------- alinea a ---------------------------------------------------------------------------------------------
select r.numeroQuarto,r.numeroandar,q.designacaotipo
from Reserva r
inner join Quarto q on q.numeroquarto = r.numeroquarto
where r.dataCancelamento is null and r.numeroandar = 1 and q.designacaotipo not like 'single'
group by r.numeroquarto,r.numeroandar,q.designacaotipo
having count(*)>2 and count(*) = (SELECT MAX(COUNT(*))FROM reserva GROUP BY numeroquarto)
union
select r.numeroQuarto,r.numeroandar,q.designacaotipo
from Reserva r
inner join Quarto q on q.numeroquarto = r.numeroquarto
where r.dataCancelamento is null and r.numeroandar = 2 and q.designacaotipo not like 'single'
group by r.numeroquarto,r.numeroandar,q.designacaotipo
having count(*)>2 and count(*) = (SELECT MAX(COUNT(*))FROM reserva GROUP BY numeroquarto);

----------- alinea b ---------------------------------------------------------------------------------------------
select cli.* from cliente cli
inner join Reserva r on r.nifcliente = cli.nifcliente
inner join Quarto q on r.numeroquarto = q.numeroquarto
inner join Conta cont on cont.idreserva = r.idreserva
inner join Consumo consumo on consumo.numerounico = cont.numerounico
inner join produto p on p.idproduto = consumo.idproduto
where upper(r.nomeepoca) like 'ALTA' and upper(q.designacaotipo) like 'SUITE'
and datacheckin between ( select * from (select datainicio from EpocaAno where upper(nomeepoca) like 'ALTA' order by datainicio desc) where rownum = 1)
and ( select * from (select datafim from EpocaAno where upper(nomeepoca) like 'ALTA' order by datafim asc) where rownum = 1)
and (extract(year from cont.dataabertura) = (select (extract(year from sysdate) - 2) from dual) or
extract(year from cont.dataabertura) = (select (extract(year from sysdate)- 1) from dual))
and consumo.idproduto in (select * from (select idproduto from consumo group by idproduto order by count(*) desc ) where rownum <= 2)
group by cli.nome,cli.nifcliente,cli.email,cli.telefone
order by sum(p.preco) desc;

