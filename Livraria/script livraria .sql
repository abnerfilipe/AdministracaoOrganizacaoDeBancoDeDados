create database livraria;

use livraria;

create table autores (
	 idAutor int(11) not null auto_increment primary key,
     nome varchar(100) not null,
     pseudonimo varchar(100),
     ano date not null,
     paisOrigem varchar(100),
     notaBibliografica text
     );
     
     create table editoras (
	 idEditora int(11) not null auto_increment primary key,
     nome varchar(100) not null,
     razaoSocial varchar(100) not null,
     endereco varchar(200) not null
     );
     
     create table telefones (
	 idTelefone int(11) not null auto_increment primary key,
     codigoPais varchar(4) not null,
     ddd varchar(5) not null,
     telefone varchar(10) not null,
     tipo varchar(100),
     idEditora int(11),
     constraint fkEditora foreign key (idEditora) references editoras(idEditora)
     );
     
     create table livros (
	 idLivro int(11) not null auto_increment primary key,
     titulo varchar(255) not null,
     codigo varchar(100) not null unique,
     idioma varchar(100) not null,
     anoLancamento int(4) not null
     );
     
     create table autoresLivros(
     idAutor int(11) not null,
     idLivro int(11) not null,
     constraint fkAutoresLivros foreign key (idAutor) references autores(idAutor),
     constraint fkLivrosAutores foreign key (idLivro) references livros(idLivro),
     constraint idComposta primary key(idAutor, idLivro) 
     );
     
      create table edicoes (
	 idEdicao int(11) not null auto_increment primary key,
     paginas int(11) not null,
     isbn varchar(100) not null unique,
     precoVenda double(9,2) not null,
     qtdeEstoque int(11) not null,
     anoPublicacao int(4) not null
     #idEditora int(11),
     #constraint fkEditoraEdicao foreign key (idEditora) references editoras(idEditora)
     );
     
     
     create table edicoesLivros(
     idEdicao int(11) not null,
     idLivro int(11) not null,
     constraint fkEdicoesLivros foreign key (idEdicao) references edicoes(idEdicao),
     constraint fkLivrosEdicoes foreign key (idLivro) references livros(idLivro),
     constraint idComposta primary key(idEdicao, idLivro) 
     );
     
     alter table edicoes add column idEditora int(11) not null; 
     
     alter table edicoes add constraint fkEditoraEdicao foreign key (idEditora) references editoras(idEditora);
     
     
     #drop table edicoes;
     #drop table edicoesLivros;
     
     insert into autores(nome, pseudonimo, paisOrigem, notaBibliografica, ano) 
		values("shakespear", "chato", "Inglaterra", "", "1560-01-01"),
			  ("autorTeste", "", "Canadá", "", "1978-01-01");
              
        insert into autores(nome, pseudonimo, paisOrigem, notaBibliografica, ano) 
		values("Rui Barbosa", "rui", "Brasil", null, "1860-01-01");
              
              select idAutor, nome, paisOrigem from autores where idAutor > 1;
              
              INSERT INTO livros (titulo, codigo, idioma, anoLancamento)
				VALUES ("Romeu e Julieta", "R&J2000", "portugues",2000);
                
                insert into autoreslivros values(1,1);
                
                INSERT INTO editoras(nome, razaoSocial, endereco)
					VALUES("Editora abc", "ABCLivros", "Rua das editoras Centro" );
                    
			INSERT INTO edicoes(paginas, isbn, precoVenda, qtdeEstoque, anoPublicacao,idEditora)
				VALUES(350, "AAAR&J2000", 50.90, 5, 2000,1);
                
                insert into edicoeslivros values(1,1);
                
                select * from edicoeslivros;
                
                delete from edicoeslivros where idEdicao = 2;
                
                update autores set nome="Cecilia Meirelles" where idAutor = 2;
                
                update autores set pseudonimo = null where idAutor = 2;
                
	-- Buscar todos os registros da tabela autores e seus atribuitos
    select * from autores;
    
    -- Buscar todos os autores que não tem pseudonimo;
    
    select * from autores where pseudonimo is null;
    
    -- buscar o autor mais antigo(data nascimento mais antiga)
    
    select idAutor, nome, pseudonimo, min(ano), paisOrigem from autores;
    
    -- Busque todos os autores que o nome comece com r e nasceram no Brasil
	
    select * from autores where  nome like "%a%" and paisOrigem = "brasil";
    
    -- tamanho do nome
    select nome from autores where(select char_length(nome)) = 10;
    
    select * from editoras;
    
    INSERT INTO telefones(codigoPais,ddd,telefone,tipo,idEditora)
VALUES("+55", "(62)","3222-2222", "fixo", 1),
("+55", "(62)","9999-2222", "celular", 1);

select * from telefones;

-- mostre todos os telefones das editoras
#select idEditora from editoras intersect select ideditora from telefones;

select nome, razaoSocial  from editoras union select ddd, telefone from telefones;

select * from editoras as e
inner join telefones as t on t.idEditora = e.idEditora;

-- busque todos os livros e seus autores
select l.idLivro, l.titulo, l.anoLancamento, a.idAutor, a.nome, a.paisOrigem
 from livros as l
inner join autoreslivros al on al.idLivro = l.idLivro
inner join autores a on al.idAutor = a.idAutor;


    
    
    
    
    
			

                
                


