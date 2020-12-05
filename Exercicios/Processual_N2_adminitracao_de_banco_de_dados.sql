/*
	Aluno: Filipe Abner de Assis Santos
    Matricula: 20192243000
*/


create database atividadeN2;
use atividadeN2;

SELECT * FROM atividadeN2.cliente;
SELECT * FROM atividadeN2.fornecedor;
SELECT * FROM atividadeN2.fornecedor_produto;
SELECT * FROM atividadeN2.pagamento;
SELECT * FROM atividadeN2.pedido;
SELECT * FROM atividadeN2.produto;
SELECT * FROM atividadeN2.produto_has_pedido;
SELECT * FROM atividadeN2.tipoPagamento;

/*
Exercícios Banco de dados 2:
A partir do modelo modeloatividadeN2 crie o banco de dados e faça o que se pede:
(0bs) caso seja necessário faça ajustes no banco de dados.
1-	 Crie uma view para verificar produtos por fornecedor
*/
	create view VW_PRODUTOS_FORNECEDOR as select 
    p.idproduto as 'id produto', 
    p.descricao as 'produto descricao',  
    p.quantidade,
    p.preco ,  
    p.codigo,
    f.idfornecedor as 'id fornecedor', 
    f.nome as 'fornecedor', 
    f.razaoSocial as 'fornecedor razao social',
    f.telefone,
    f.endereco
    from fornecedor_produto as fp 
    inner join produto as p on p.idproduto = fp.idproduto
    inner join fornecedor as f on f.idfornecedor = fp.idfornecedor;
    
    select * from atividadeN2.VW_PRODUTOS_FORNECEDOR;

/*
2-	Crie uma view para ver os pedidos por cliente
*/
	create view VW_PEDIDOS_CLIENTES as select 
    c.nome,
    c.cpf,
    c.endereco,
    c.telefone,
    ped.data,
    ped.status, 
    prod.codigo,
    prod.descricao,
    prod.preco,
	pag.parcelas,
    tpag.tipo,
    ped.total
    from cliente as c 
    inner join pedido as ped on ped.cliente_idcliente = c.idcliente
    inner join produto_has_pedido on produto_has_pedido.pedido_idpedido = ped.idpedido
	inner join produto as prod on prod.idproduto = produto_has_pedido.produto_idproduto
    inner join pagamento as pag on pag.idpagamento = ped.pagamento_idpagamento
    inner join tipoPagamento as tpag on tpag.idtipoPagamento = pag.tipoPagamento_idtipoPagamento
    ;
    
    select * from atividadeN2.VW_PEDIDOS_CLIENTES;
/*
3-	Implemente a entidade vendedor e inclua o vendedor aos pedidos.
*/
	create table if not exists vendedor(
		idvendedor integer not null primary key auto_increment,
        nome varchar(45) not null,
        codigo varchar(45) not null,
        data_nascimento date,
        telefone varchar(15) not null
    );
	create table if not exists vendedor_pedidos(
		 id_vendedor integer not null,
		 id_pedido integer not null,
		 constraint fk_vendedor_pedidos foreign key (id_vendedor) references vendedor(idvendedor),
		 constraint fk_pedidos_vendedor foreign key (id_pedido) references pedido(idpedido),
		 constraint idComposta primary key(id_vendedor, id_pedido) 
    ); 
    
/*
4-	Crie uma view para ver os pedidos por vendedor.
*/
	create view VW_PEDIDOS_VENDEDOR as select 
    v.idvendedor,
    v.nome,
    v.codigo,
    v.data_nascimento,
    v.telefone,
    ped.idpedido,
    ped.data,
    ped.status, 
    ped.total,
    pag.parcelas,
	tpag.tipo
    from vendedor as v 
    inner join vendedor_pedidos on vendedor_pedidos.id_vendedor = v.idvendedor
    inner join pedido as ped on ped.idpedido = vendedor_pedidos.id_pedido
    inner join pagamento as pag on pag.idpagamento = ped.pagamento_idpagamento
    inner join tipoPagamento as tpag on tpag.idtipoPagamento = pag.tipoPagamento_idtipoPagamento
    ;
    
    select * from atividadeN2.VW_PEDIDOS_CLIENTES;
/*
5-	Crie uma trigger para diminuir a quantidade em estoque a partir dos itens do pedido
*/
	DELIMITER $$
		create trigger reduz_estoque after insert on produto_has_pedido
		for each row
			BEGIN
				update produto set quantidade = 
				(quantidade - new.qtdePedido) 
				where idproduto = new.produto_idproduto;
			end;
	$$
/*
6-	Crie triggers para não permitir que novos itens sejam vendidos caso a quantidade de itens estejam com quantidade zerada
*/
	
/*
7-	Crie triggers que não permita inserir produtos com quantidade zerada
*/
	DELIMITER $$
		 create trigger quantidade_zerada
		 before insert on produto
		 for each row
		 begin
			declare msg varchar(128);
			if(new.quantidade <= 0) then
				set new.quantidade = null;
			end if;
		 end
  	$$
    select * from produto_has_pedido;
    
   
/*
8-	Crie triggers que validem a venda de itens não permitindo venda de produtos com quantidade maior que as existentes em estoque.
*/
 -- alter table produto_has_pedido add column qtdePedido integer;

 DELIMITER $$
		create trigger valida_qtde_pedido before insert on produto_has_pedido
			for each row
				BEGIN
					if(new.qtdePedido > (select quantidade from produto w where  idproduto = new.produto_idProduto)) then
						set new.qtdePedido = null;
                    end if;
				end;
    $$
	
/*
9-	Crie procedures que ajudem a inserir itens nas tabelas do banco(todas as tabelas)
*/
DELIMITER $$
	create procedure insert_cliente(
    in nome varchar(45),
    in cpf varchar(45),
    in nascimento date,
    in endereco varchar(100),
    in telefone varchar(45))
    begin 
		insert into cliente values (null,nome,cpf,nascimento,endereco,telefone);
    end;
$$
DELIMITER $$
	create procedure insert_fornecedor(
    in nome varchar(45),
    in endereco varchar(100),
    in razaoSocial varchar(45),
    in telefone varchar(45))
    begin 
		insert into fornecedor values (null,nome,endereco,razaoSocial,telefone);
    end;
$$
DELIMITER $$
	create procedure insert_produto(
    in descricao varchar(45),
    in quantidade varchar(45),
    in preco decimal(10,0),
    in codigo varchar(45))
    begin 
		insert into produto values (null,descricao,quantidade,preco,codigo);
    end;
$$
DELIMITER $$
	create procedure insert_vendedor(
    in nome varchar(45),
    in codigo varchar(45),
    in data_nascimento date,
    in telefone varchar(15))
    begin 
		insert into vendedor values (null,nome,codigo,data_nascimento,telefone);
    end;
$$

DELIMITER $$
	create procedure insert_pagamento_tipoPagamento(
    in pag_parcelas integer,
    in tipoPag_tipo varchar(45))
    begin 
		insert into tipoPagamento values (null,tipoPag_tipo);
        insert into pag_parcelas values(null,pag_parcelas,LAST_INSERT_ID());
    end;
$$
DELIMITER $$
	create procedure insert_pagamento_tipoPagamento(
    in pag_parcelas integer,
    in tipoPag_tipo varchar(45))
    begin 
		insert into tipoPagamento values (null,tipoPag_tipo);
        insert into pag_parcelas values(null,pag_parcelas,LAST_INSERT_ID());
    end;
$$

DELIMITER $$
	create procedure insert_pedido(
    in `data` date,
    in status varchar(45),
    in cliente_idcliente integer,
    in pagamento_idpagamento integer,
    in total  decimal(9,2))
    begin 
		insert into pedido values (null,`data`,status,cliente_idcliente,pagamento_idpagamento,total);
    end;
$$





/*
10-	Crie uma procedure para emitir pedidos, a procedure precisa verificar o tipo de pagamento, e fazer os cálculos necessários:
A)	Se for a vista o valor do pedido tem 10% de desconto
B)	Se for no débito o valor total não tem desconto
C)	Se for a credito em 2 vezes tem 5% de aumento
D)	Se for credito acima de 2 vezes 10% de aumento.
*/

DELIMITER $$
		create procedure insert_pedido(
        in tipoPagamento integer, 
        in parcelas varchar(45), 
        in idCliente int(11)
        )
		BLOCO1: begin 	
			declare excecao integer default 0;
            declare continue handler for sqlexception set excecao = 1;
            set autocommit = 0; 
            start transaction;
			insert into pagamento(parcelas, tipoPagamento_idtipoPagamento)
				values(parcelas, tipoPagamento);
                if(excecao =1)then 
					set erro = 'erro ao inserir pagamento';
                    rollback;
                    leave BLOCO1;
				end if;
			insert intopedido(data, status, cliente_idcliente, pagamento_idpagamento)
				values(now(),"aberto",idCliente,(select last_inserted_id()) );
			    if(excecao = 1)then 
					set erro = 'erro ao inserir pedido';
                    rollback;
                    leave BLOCO1;
				else
					set erro = 'cadastro efetuado';
                    commit;
				end if;
		end;
    $$ 
drop procedure insert_pedido;
call insert_pedido(2,3,1,@erro);

/*
11-	Crie índices para as tabelas cliente, fornecedor, produto e pedido.
*/
	create index index_cliente on cliente(nome,cpf,nascimento);
	create index index_fornecedor on fornecedor(nome,razaoSocial);
	create index index_produto on produto(quantidade,preco,codigo);
	create index index_pedido on pedido(statu,total,cliente_idcliente,pagamento_idpagamento);
/*
*/
