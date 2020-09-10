/*
	Aluno: Filipe Abner de Assis Santos
    Disciplina: 20202:CIN20187:GO1301 - ADMINISTRAÇÃO E ORGANIZAÇÃO DE BANCO DE DADOS
*/


create database if not exists agencia_financiamento; 
use agencia_financiamento;

-- tables
create table if not exists AreaPesquisa(
	id integer not null auto_increment primary key,
    codigo integer not null,
    nome varchar(200) not null,
    descricao text, 
    relevancia integer not null
);
create table if not exists Usuario(
	id integer not null auto_increment primary key,
    nome varchar(100) not null,
    rg varchar(8) not null,
    cpf varchar(14) not null,
    data_nascimento date not null,
	grau_cientifico varchar(200) not null,
    instuicao varchar(200) not null
);
create table if not exists Pesquisador(
	id integer not null auto_increment primary key,
    usuario_id integer not null,
    constraint fk_usuario_pesquisador foreign key (usuario_id) references Usuario(id)
);
create table if not exists Avaliador(
	id integer	not null auto_increment primary key,
    area_de_pesquisa integer not null,
    usuario_id integer not null, 
	constraint fk_usuario_avaliador foreign key (usuario_id) references Usuario(id)
);


create table if not exists Projeto(
	id integer not null auto_increment primary key,
    codigo integer not null,
    titulo varchar(100) not null,
    duracao date not null,
    instituicao varchar(200),
    pesquisador_id integer not null,
    area_pesquisa_id integer not null,
    constraint fk_pesquisar_projeto foreign key(pesquisador_id) references Pesquisador(id),
    constraint fk_area_pesquisa_projeto foreign key(area_pesquisa_id) references AreaPesquisa(id)
);


create table if not exists Analise(
	id integer not null auto_increment primary key,
    data_cadastro date not null,
    data_avaliacao date not null,
    data_resultado date not null,
    status varchar(100) not null,
    resultado varchar(100) not null,
    projeto_id integer not null,
    constraint fk_projeto_analise foreign key(projeto_id) references Projeto(id)
);
-- pivots
create table if not exists AvaliadorAreaPesquisa(
	avaliador_id integer not null,
	area_pesquisa_id integer not null,
	constraint fk_avaliador_area_pesquisa foreign key (avaliador_id) references Avaliador(id),
	constraint fk_area_pesquisa_avaliador foreign key (area_pesquisa_id) references AreaPesquisa(id),
	constraint composta_id primary key(avaliador_id, area_pesquisa_id) 
);

create table if not exists AvaliadorAnalise(
	avaliador_id integer not null,
	analise_id integer not null,
	constraint fk_avaliador_analise foreign key (avaliador_id) references Avaliador(id),
	constraint fk_analise_avaliador foreign key (analise_id) references Analise(id),
	constraint composta_id primary key(avaliador_id, analise_id) 
);


-- inserts 

INSERT INTO `AreaPesquisa` VALUES 
('1','3','fuchsia','Non reprehenderit nemo porro recusandae. Necessitatibus aut eius nulla nisi voluptatem. Rerum nemo reprehenderit quia. Et similique temporibus qui nesciunt qui assumenda omnis.','5'),
('2','1','purple','Porro rerum tempore explicabo quidem debitis incidunt ratione. Officiis nihil eum eius occaecati ipsa hic rerum. Eos sequi fuga rerum sunt odit accusamus sit.','3'),
('3','8','black','Aperiam omnis reiciendis ex eaque aliquid facilis quos voluptatibus. Ea nam occaecati ut ut sunt provident commodi. Accusantium porro labore odit.','8'),
('4','6','gray','Facilis necessitatibus corrupti molestiae dolorum nostrum eligendi. Dolor atque blanditiis et. Quos rerum totam blanditiis praesentium illo qui alias. Enim nihil autem labore maxime a soluta modi.','1'),
('5','1','gray','Eius non nostrum vel consequuntur. Delectus aperiam animi laborum aut vitae saepe odit. Iusto odit molestiae praesentium commodi.','0'),
('6','3','navy','Voluptates animi sit et placeat quod alias magni. Accusantium dolores mollitia libero est nihil consequuntur. Porro earum aut adipisci saepe. Soluta veritatis aliquid et quibusdam debitis.','10'),
('7','3','silver','Et iste dolores alias aliquam aut. Temporibus esse est consequatur ea officia. Vel totam voluptates iusto aut eaque tempora.','5'),
('8','6','yellow','Possimus aut laboriosam aut. Minima qui non iure perspiciatis. Harum ab fugit est sit provident odit quidem. Natus optio voluptas nemo et.','8'),
('9','1','white','Mollitia quam velit repellat excepturi. Praesentium vero provident vel molestiae sunt non nihil. Ipsa provident error voluptatem eaque nihil ut.','7'),
('10','9','aqua','Dicta vitae recusandae quaerat et eius ipsum in. Harum nostrum quasi dolorum esse pariatur.','6'); 

INSERT INTO `Usuario` VALUES 
('1','Naomi','287962','27884148992','2015-06-24','Pos-Doutorado','Odit ut sit aut laboriosam aut soluta et.'),
('2','Garry','103887','91301656514','2015-12-21','Pos-Graduado','Laboriosam quia nemo tenetur sed.'),
('3','Terrence','858678','16078218398','2018-07-13','Doutorado','Quasi et dolorem sed molestiae.'),
('4','Laury','447029','71597468946','2001-07-12','Doutorado','Numquam fuga aut eum omnis eaque.'),
('5','Jaylan','895578','88945418596','2003-06-30','Doutorado','Sunt cumque accusamus beatae et cumque quod sunt.'),
('6','Susie','765263','87180820340','1978-02-17','Doutorado','Velit tenetur eos reiciendis cupiditate aut quia fugiat qui.'),
('7','Merlin','643370','83477553399','1999-11-28','Pos-Graduado','Qui placeat natus ut consequuntur.'),
('8','Kailey','409744','22094156965','1980-03-22','Pos-Graduado','Eius esse ea quis et inventore necessitatibus ut vitae.'),
('9','Hilbert','336772','16489621391','2018-12-03','Pos-Graduado','Autem et voluptas rerum voluptas.'),
('10','Louvenia','423236','14177996106','1977-07-20','Doutorado','Quam ea sed commodi officiis illum consequatur quas.'); 


INSERT INTO `Pesquisador` VALUES 
('1','1'),
('2','2'),
('3','3'),
('4','4'),
('5','5');
INSERT INTO `Avaliador` VALUES 
('1','10','6'),
('2','8','7'),
('3','9','8'),
('4','6','9'),
('5','8','10');

INSERT INTO `Projeto` VALUES 
('1','1','titulo 1','2020-10-09','Lorem Ipsum is therefore al','1','1'),
('2','2','titulo 2','2020-10-09','simply random text','1','2'),
('3','3','titulo 3','2020-10-09','Lorem Ipsum is therefore al','2','3'),
('4','4','titulo 4','2020-10-09','Lorem Ipsum is therefore al','3','4'),
('5','5','titulo 5','2020-10-09','psum dolor sit amet.','4','5'),
('6','6','titulo 6','2020-10-09','Lorem Ipsum is therefore al','5','6'),
('7','7','titulo 7','2020-10-09','Lorem Ipsum is therefore al','5','7'),
('8','8','titulo 8','2020-10-09','Lorem Ipsum is therefore al','4','8'),
('9','9','titulo 9','2020-10-09','Lorem Ipsum is therefore al','3','9'),
('10','10','titulo 10','2020-10-09','reproduced in their exact original','2','10');
INSERT INTO `Analise` VALUES 
('1','1977-07-20','1977-07-20','1977-07-20','concluido','deferido','1'),
('2','1977-07-20','1977-07-20','1977-07-20','em analise','deferido','2'),
('3','1977-07-20','1977-07-20','1977-07-20','aguardando analise','indeferido','3'),
('4','1977-07-20','1977-07-20','1977-07-20','em analise','deferido','4'),
('5','1977-07-20','1977-07-20','1977-07-20','concluido','deferido','5'),
('6','1977-07-20','1977-07-20','1977-07-20','concluido','indeferido','6'),
('7','1977-07-20','1977-07-20','1977-07-20','concluido','deferido','7'),
('8','1977-07-20','1977-07-20','1977-07-20','aguardando analise','deferido','8'),
('9','1977-07-20','1977-07-20','1977-07-20','em analise','indeferido','9'),
('10','1977-07-20','1977-07-20','1977-07-20','aguardando analise','indeferido','10');
INSERT INTO `AvaliadorAnalise` VALUES 
('1','5'),
('2','6'),
('3','7'),
('4','8'),
('5','9');
INSERT INTO `AvaliadorAreaPesquisa` VALUES 
('1','1'),
('2','2'),
('3','3'),
('4','4'),
('5','5');