create or replace trigger trgAtualizaCliente
    before insert or update on reserva
    for each row   
    declare 
        nomeCliente varchar (250) ;
        nifCliente int ;
        emailCliente varchar (200) ;
        telefoneCliente int ;
        clienteNaoExiste Exception ;
        dado_novo_invalido EXCEPTION;
        contadorCliente int ;

 

    begin
    
        
   if (:new.id_cliente is null) then
    raise dado_novo_invalido;
   end if;
      
        select c.nome into nomeCliente from cliente c where c.id = :new.id_cliente ;
        select c.nif into nifCliente from Cliente c where c.id = :new.id_cliente ;
        select c.email into emailCliente from Cliente c where c.id = :new.id_cliente ;
        select c.telefone into telefoneCliente from Cliente c where c.id = :new.id_cliente ;
        select count(distinct c.id) into contadorCliente from cliente c where c.id = :new.id_cliente;
        if (contadorCliente = 0 ) then
            raise clienteNaoExiste;
        end if;        
        
   
        :new.nome := nomeCliente ;
        :new.nif := nifCliente ;
        :new.email := emailCliente;
        :new.telefone := telefoneCliente ;

 

   exception 
    when clienteNaoExiste then 
      raise_application_error (-20006, 'Não existe nenhum cliente com esse id');
    WHEN dado_novo_invalido THEN
            raise_application_error(-20002, 'O update de uma informação do cliente não pode ser alterada para null');
  end;