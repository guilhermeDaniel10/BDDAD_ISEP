create or replace procedure prcRegistarReserva (
-- PARAMETROS OBRIGATORIOS----------------
p_id_tipo_quarto tipo_quarto.id%type,
p_data_entrada reserva.data_entrada%type,
p_data_saida reserva.data_saida%type,
p_numero_pessoas quarto.lotacao_maxima%type,

 

--PARAMETROS OPCIONAIS---------------------
p_id_cliente cliente.id%type default null,
p_nome_cliente cliente.nome%type default null,
p_nif_cliente cliente.nif%type default null,
p_telefone_cliente cliente.telefone%type default null,
p_email_cliente cliente.email%type default null) AS

 

--- EXCEPCOES -----------------------------------------
nao_especificar_outros exception;
especificar_nome_id_cliente exception;
especificar_nif exception;
--- VARIAVEIS -----------------------------------------
preco_reserva reserva.preco%type;
id_reserva reserva.id%type;
id_epoca_reservacao epoca.id%type;
duracao int;

 

Begin

 

---  DECLARACOES DE EXCEPCOES (VERIFICAR QUE SE CUMPREM TUDAS AS CONDICOES) -------------------------------

 

if (p_id_cliente is not null and ((p_nome_cliente is not null) or (p_nif_cliente is not null) 
or (p_telefone_cliente is not null) or (p_email_cliente is not null))) then
raise nao_especificar_outros;
end if;

 

if (p_id_cliente is null and p_nome_cliente is null) then
raise especificar_nome_id_cliente;
end if;

 

if (p_nome_cliente is not null and p_nif_cliente is null) then
raise especificar_nif;
end if;

 

--- QUERY PARA DETERMINAR O PRECO DA RESERVA --------------------------------------------------------------
--dbms_output.put_line('Comenzando a hacer las querys');

 

select data_final - data_incial into duracao from (select p_data_entrada data_incial , p_data_saida data_final from Dual);
--dbms_output.put_line('Duracao ' || duracao);

 

select id into id_epoca_reservacao from EPOCA where p_data_entrada between data_ini and data_fim;
--dbms_output.put_line('id_epoca_reservacao ' || id_epoca_reservacao);

 

select preco into preco_reserva from preco_epoca_tipo_quarto where id_tipo_quarto = p_id_tipo_quarto and 
id_epoca = id_epoca_reservacao;

 

--dbms_output.put_line('Preco determinado pela epoca e tipo de quarto ' || preco_reserva);

 

--- QUERY PARA DETERMINAR O ID DA RESERVA SEM QUE SEJA REPETIDO---------------------------------------------
select nvl(max(id),0)+1 into id_reserva from reserva;
--dbms_output.put_line('ID Reserva ' || id_reserva);

 

--- INSERT NA TABELA RESERVA DEPOIS DE VERIFICAR QUE TODAS AS CONDICOES FORAM CUMPRIDAS --------------------

 


if (fncDisponibilidadeReserva(p_id_tipo_quarto,p_data_entrada,duracao,p_numero_pessoas) = true) then
insert into reserva (id, id_cliente, nome, id_tipo_quarto, data, data_entrada, data_saida, nr_pessoas, preco, id_estado_reserva)
values (id_reserva,p_id_cliente,p_nome_cliente,p_id_tipo_quarto,sysdate,p_data_entrada,p_data_saida,p_numero_pessoas,
preco_reserva,1);
dbms_output.put_line('Já esta feito o registo da reserva ');
 else
        DBMS_OUTPUT.PUT_LINE('Não é possivel fazer a reserva na data pretendida');
end if;

 

EXCEPTION

 

    WHEN nao_especificar_outros THEN
        dbms_output.put_line('Se já esta especifico o id do cliente não pode especificar o nome, o NIF, o telefone nem o email .');
    WHEN especificar_nome_id_cliente THEN
        dbms_output.put_line('Tem que especificar o nome ou o id (não pode especificar os dois só um deles).');
    WHEN especificar_nif THEN
        dbms_output.put_line('Se especifico o nome do cliente também tem que especificar o nif');
    WHEN OTHERS THEN
        dbms_output.put_line('Erro inesperado');

 

end;