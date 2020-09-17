/*
	Aluno: Filipe Abner de Assis Santos
    Disciplina: 20202:CIN20187:GO1301 - ADMINISTRAÇÃO E ORGANIZAÇÃO DE BANCO DE DADOS
*/


create database if not exists locadora_veiculos;
use locadora_veiculos;
create table if not exists Cliente(
	id integer not null auto_increment primary key,
    nome varchar(255) not null,
    rg varchar(8) not null,
    cpf varchar(14) not null,
    endereco varchar(100),
    cnh varchar(20) not null,
    data_nascimento date not null
);
create table if not exists Categoria(
	id integer not null auto_increment primary key,
    codigo integer not null unique,
    nome varchar(255) not null,
    descricao text not null,
    preco double not null
);
create table if not exists Locacao(
	id integer not null auto_increment primary key,
    data_hora_locacao datetime,
    data_hora_delovolucao datetime,
    cliente_id integer not null, 
    categoria_id integer not null,
    constraint fk_cliente_locacao foreign key(cliente_id) references Cliente(id),
    constraint fk_categoria_locacao foreign key(categoria_id) references Categoria(id)
);

create table if not exists Veiculo(
	id integer not null auto_increment primary key,
    placa varchar(9) not null unique,
    marca varchar(100) not null,
    modelo varchar(100) not null,
    chassi varchar(200) not null unique,
    ano_fabricacao date not null,
    ano_modelo date not null,
    cor varchar(25),
    categoria_id integer not null,
    constraint fk_categoria_carro foreign key(categoria_id) references Veiculo(id)
);
create table if not exists Manutencao(
	id integer not null auto_increment primary key,
    data_inicio date not null,
    valor double not null,
    descricao text not null, 
    nota_fiscal varchar(255) not null,
    fornecedor varchar(255) not null,
	veiculo_id integer not null,
    constraint fk_veiculo_manutencao foreign key(veiculo_id) references Veiculo(id)
);
-- inserts

INSERT INTO `Cliente` VALUES 
('1','Ulices','515261','18091770121','43157 Terrence Courts\nSouth Jetttown, SC 51314','1425255374','1972-05-17'),
('2','Susana','14887','6418696977','027 Luettgen Corners Apt. 363\nPort Dallas, AR 54433','5086522265','1996-10-26'),
('3','Stacy','721831','15030566602','211 Pink Union\nEast Antonina, SC 54585-5478','1003873120','1995-04-21'),
('4','Mitchell','847746','99897544365','123 Julia Expressway\nLake Enriqueside, NM 61859','1613247375','1973-01-13'),
('5','Sigurd','141546','32706912048','2229 Mosciski Villages Suite 500\nClintton, MI 33152','3701901733','2008-11-22'),
('6','Abelardo','694082','72697635320','6195 Shaniya Turnpike\nEast Maggieburgh, TN 94518','1827006144','1984-03-06'),
('7','Cole','696560','18686438724','7081 Yolanda Pine Suite 718\nSouth Jamir, MN 87459-3714','7676290781','1999-03-13'),
('8','Braeden','4990','7989358855','44898 Hudson Estate\nNew Justen, NV 65101-4755','2922327867','1992-01-28'),
('9','Durward','822357','85871571954','12773 Eldora Divide\nNew Ariellebury, NJ 17492-7995','7187426113','1986-04-05'),
('10','Raymundo','891104','86909386981','8513 Casper Radial Suite 790\nBahringerchester, MA 93424','6777416071','1980-10-28'); 

INSERT INTO `Categoria` VALUES 
('1','951','Lexi','Eius nisi nostrum ea ipsa facilis nulla consequatur.','220'),
('2','356','Carleton','Perferendis consequatur at voluptatem accusamus eligendi vero.','164'),
('3','75','Geovanny','Velit reprehenderit suscipit nostrum quisquam molestiae velit molestiae perferendis itaque veniam voluptatem.','197'),
('4','230','Waino','Accusamus delectus quaerat sunt praesentium eveniet quo beatae magnam.','127'),
('5','293','Cecil','Blanditiis distinctio qui et ratione voluptatibus id consectetur impedit earum est deserunt molestiae voluptas.','234'),
('6','959','Pasquale','Beatae corporis et corporis laudantium laborum voluptatem sunt facilis est repellendus maiores.','110'),
('7','974','Roosevelt','Non reprehenderit ipsam veritatis similique dolor est fugit et est alias consequatur quo.','300'),
('8','811','Tyson','Quibusdam illum maiores ut eum perspiciatis ad accusantium saepe sint ex.','214'),
('9','21','Thora','Deserunt perferendis dolores consectetur laborum a ipsam vitae dolores maiores cumque id.','281'),
('10','970','Lavonne','Ea quia corporis eius debitis dolorum voluptas suscipit illo enim fugiat.','95'); 

INSERT INTO `Locacao` VALUES 
('1','1996-12-23 03:49:54','1984-01-08 01:47:14','1','1'),
('2','1986-11-18 02:48:31','1972-12-10 14:54:16','2','2'),
('3','2004-08-07 07:07:01','1992-10-25 14:37:02','3','3'),
('4','1992-02-22 15:00:26','2018-12-22 16:53:52','4','4'),
('5','1987-03-02 18:00:45','2013-12-23 04:20:18','5','5'),
('6','1973-06-01 22:51:56','2007-12-05 02:31:40','6','6'),
('7','2004-04-04 09:58:56','1985-07-03 18:13:35','7','7'),
('8','1987-04-30 22:07:46','2009-11-01 12:27:43','8','8'),
('9','1986-04-30 05:53:50','2014-12-19 08:01:46','9','9'),
('10','1988-09-22 10:29:10','1991-04-01 00:07:47','10','10'); 

INSERT INTO `Veiculo` VALUES 
('1','her-8435','kassulkehettinger','balistreri','557781108','2008-08-17','1997-08-10','teal','1'),
('2','xlm-1478','hirthe','eichmann','2328779497','2010-07-29','2010-01-28','white','2'),
('3','ozx-3119','beierbarton','stoltenberg','5929846018','1971-03-08','1974-05-13','aqua','3'),
('4','kxa-4151','schillerquigley','doyleweimann','7360905138','1995-03-11','1990-11-18','olive','4'),
('5','drx-5319','pourosgrimes','mannyost','5935907033','2009-03-23','1995-04-29','black','5'),
('6','puq-2848','rippin','lefflerkutch','3459503920','1977-03-03','2004-12-24','white','6'),
('7','yln-4899','erdman','keeblerbecker','3053407892','1983-02-07','1977-01-11','yellow','7'),
('8','ggk-3564','jacobs','harber','6984344422','1992-07-06','1979-01-01','navy','8'),
('9','aqb-4709','streichboyle','robel','330897807','2018-03-16','1997-07-21','silver','9'),
('10','mtc-6350','wisozk','auerhessel','5472784936','2009-05-28','2007-09-08','aqua','10'); 

INSERT INTO `Manutencao` VALUES 
('1','1991-07-14','6188','Et nisi enim consequatur tenetur aut aliquid asperiores eos sit neque.','8018','gottlieb','1'),
('2','2014-06-30','9779','Tempora possimus possimus commodi qui eveniet rem reprehenderit blanditiis occaecati accusantium.','7717','lang','2'),
('3','1998-01-04','4110','Distinctio temporibus quam quibusdam voluptate qui consequatur et et sed nesciunt voluptatem cum ut earum.','2108','bauch','3'),
('4','1994-07-09','8767','Eaque perspiciatis molestias sed dolores voluptatibus adipisci modi eum a illo et.','2386','gusikowski','4'),
('5','1973-05-21','503','Ipsa corrupti dolorum doloremque inventore doloremque corrupti sed aut blanditiis.','7472','trantow','5'),
('6','1981-11-14','456','Earum velit aut voluptate sunt unde sunt velit sed quo sed.','2003','kleinbartoletti','6'),
('7','1979-06-08','5563','Vel sunt assumenda velit voluptatibus eum suscipit cum iusto eos ullam recusandae non tempora quas et.','4105','hettinger','7'),
('8','2013-07-01','4876','Aut quisquam incidunt occaecati odit ut eum eum aperiam rem et quod dolore asperiores fugit qui ut ipsa consequatur quis.','7417','langworthmitchell','8'),
('9','2003-04-06','4489','Quos et ipsum adipisci pariatur reprehenderit nesciunt qui error et.','8287','spinka','9'),
('10','1983-12-01','4839','Commodi nulla autem quam aut aut voluptatem repellendus quae sunt eum magnam dicta consequatur et molestiae alias.','831','smithleannon','10'); 

-- selects 
SELECT * FROM locadora_veiculos.Cliente;
SELECT * FROM locadora_veiculos.Categoria;
SELECT * FROM locadora_veiculos.Locacao;
SELECT * FROM locadora_veiculos.Manutencao;
SELECT * FROM locadora_veiculos.Veiculo;
