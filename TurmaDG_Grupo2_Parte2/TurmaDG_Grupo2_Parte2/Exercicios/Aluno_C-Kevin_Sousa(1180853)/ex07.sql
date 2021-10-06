CREATE OR REPLACE FUNCTION fncDisponibilidadeReserva(p_id_tipo_quarto tipo_quarto.id%type, p_data_pretendida reserva.data_entrada%type, p_duracao int, p_numPessoas quarto.lotacao_maxima%type) RETURN boolean AS

 

    existe_disponibilidade_reserva int;
    maximo quarto.lotacao_maxima%type;
    lotacao_maxima_excedida exception;

 

    BEGIN
    
        select max(lotacao_maxima) into maximo 
        from quarto where id_tipo_quarto = p_id_tipo_quarto;

 

        if p_numPessoas > maximo then
        raise lotacao_maxima_excedida;
        end if;

 

        SELECT count(*) into  existe_disponibilidade_reserva
        FROM tipo_quarto tq
        inner join Quarto q on q.id_tipo_quarto = tq.id
        inner join Reserva r on r.id_tipo_quarto = tq.id
        where tq.id = p_id_tipo_quarto and q.lotacao_maxima >= p_numPessoas
        and ((r.data_entrada between p_data_pretendida and p_data_pretendida + p_duracao)
        or (r.data_saida between p_data_pretendida and p_data_pretendida + p_duracao));

 

       
        IF existe_disponibilidade_reserva = 0 THEN
            RETURN true;
        end if;

 

        RETURN false;

 

    EXCEPTION
         WHEN lotacao_maxima_excedida THEN
        dbms_output.put_line('Não é possivel reservar esse tipo de quarto o numero de pessoas é maior do que a lotação maxima');
        return false;
        WHEN OTHERS THEN
            RETURN null;
    end;