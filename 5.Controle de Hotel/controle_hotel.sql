/*
	Aluno: Filipe Abner de Assis Santos
    Disciplina: 20202:CIN20187:GO1301 - ADMINISTRAÇÃO E ORGANIZAÇÃO DE BANCO DE DADOS
*/


create database if not exists controle_hotel;
use controle_hotel;
create table if not exists Cliente(
	id integer not null auto_increment primary key,
    nome varchar(255) not null,
    rg varchar(8) not null,
    sexo varchar(14) not null,
    endereco varchar(100),
    email varchar(100),
    telefones varchar(255) not null,
    data_nascimento date not null
);
create table if not exists Quarto(
	id integer not null auto_increment primary key,
    numero varchar(20) not null,
    andar varchar(20) not null,
    tipo varchar(20) not null,
    descricao text not null,
    preco double not null
);
create table if not exists Reserva(
	id integer not null auto_increment primary key,
	data_hora_entrada datetime not null,
    data_hora_saida datetime not null,
    cliente_id integer not null,
    quarto_id integer not null,
    constraint fk_cliente_reserva foreign key(cliente_id) references Cliente(id),
    constraint fk_quarto_reserva foreign key(quarto_id) references Quarto(id)
);
create table if not exists Status_quarto(
	id integer not null auto_increment primary key,
    codigo integer not null,
    descricao text not null,
	data_hora_entrada datetime not null, 
    data_hora_saida datetime, 
    quarto_id integer not null,
    constraint fk_quarto_status foreign key(quarto_id) references Quarto(id)
);
create table if not exists Servico(
	id integer not null auto_increment primary key,
    codigo integer  not null,
    tipo varchar(200) not null,
    descricao text,
    valor double not null,
    quarto_id integer not null,
    constraint fk_quarto_servio foreign key(quarto_id) references Quarto(id)
);

-- inserts 

INSERT INTO `Cliente` VALUES
('1','Flavio','122865','Masculino','20712 London Forest\nSouth Ashleeland, PA 93564','murazik.karelle@example.com','998964377','1992-08-20'),
('2','Justice','745834','Feminino','921 Elinor Isle Apt. 861\nEast Allan, HI 92892-1991','mandy29@example.org','918641080','2000-10-21'),
('3','Tyrell','303459','Masculino','9896 Ebba Circles\nNew Margareteport, NV 80163','lea.pfeffer@example.org','930621471','1985-03-20'),
('4','Kyra','312664','Feminino','4823 Collier Landing Suite 227\nHeaneyberg, ME 58911','ernser.kaleigh@example.net','944792309','2003-10-03'),
('5','Maggie','979638','Feminino','007 Aufderhar Alley\nHarrisstad, UT 18319-6000','ricky09@example.net','940396765','1989-04-21'),
('6','Abigail','765895','Feminino','72409 Aniyah Rest\nLafayetteport, ID 17734-8631','celine.cronin@example.net','918398229','1996-10-07'),
('7','Francis','445954','Masculino','791 Keeling Ports\nLibbiebury, NJ 95782-5030','ana55@example.com','991302578','1980-01-01'),
('8','Shanon','790264','Feminino','92245 Xavier Point Apt. 767\nNew Carole, CA 92964-7671','anderson.block@example.com','980546079','1991-09-05'),
('9','Camryn','397720','Feminino','011 Loyal Manors\nEast Chad, WI 54777-4909','crist.kathleen@example.com','931508129','1982-01-01'),
('10','Reagan','703334','Masculino','35954 Tate Court Suite 079\nRatkeside, IN 62634','fern32@example.com','937047335','1999-02-12'); 

INSERT INTO `Quarto` VALUES ('1','9','9','Beliche','Porro aliquam voluptas itaque quisquam praesentium ut reprehenderit deleniti fuga animi ipsum amet eaque quis voluptas et sunt.','363.93'),
('2','9','7','Beliche','Non quaerat deserunt officia et suscipit est neque ullam quo et ratione molestias ipsum velit.','310.11'),
('3','2','2','Solteiro','Enim ut possimus consequatur omnis ipsa atque et distinctio non repellat voluptatum nihil rem aliquam sunt officia et libero et qui non doloremque aut nihil fuga fuga qui.','240.31'),
('4','2','3','Casal','Aut molestiae ducimus rerum sit tenetur aut quidem et cum quasi voluptatem qui aut iure.','307.04'),
('5','4','8','Casal','Aspernatur repellat aspernatur vero maxime id et modi dolores quia reiciendis expedita suscipit.','25.31'),
('6','4','3','Solteiro','Doloremque doloremque ullam odio hic non at qui accusantium et dolorum laudantium iure ut distinctio nam earum nulla suscipit nulla qui eum beatae recusandae excepturi excepturi minus.','465.08'),
('7','9','2','Beliche','Animi illo quo sunt eius consequatur architecto quo harum incidunt distinctio laboriosam non enim qui soluta aut cupiditate sit ad reiciendis nisi maxime reiciendis quaerat voluptates nesciunt.','88.3'),
('8','8','6','Solteiro','Enim nihil voluptatibus unde error laborum aut voluptatem eius ut officiis praesentium aut ut dolor quas quaerat et provident.','163.8'),
('9','1','8','Beliche','Doloremque et possimus nemo recusandae tenetur deserunt tenetur asperiores iste minus alias ea ut iusto impedit cupiditate sit.','146.69'),
('10','2','5','Beliche','Ut at non dolores nihil consequatur eius non quidem aperiam ratione est quo est nulla.','450.72'); 

INSERT INTO `Reserva` VALUES ('1','1982-02-18 09:57:02','2005-03-14 17:02:43','1','1'),
('2','1978-05-13 02:35:11','1985-10-05 16:46:53','2','2'),
('3','2014-12-18 17:18:25','1987-09-09 21:08:46','3','3'),
('4','2015-09-05 08:30:28','1974-09-11 03:53:09','4','4'),
('5','2019-04-03 05:35:58','1980-10-16 21:09:13','5','5'),
('6','2016-09-02 11:02:20','2007-12-11 06:43:55','6','6'),
('7','1980-02-09 11:57:26','1978-05-11 08:16:16','7','7'),
('8','1975-07-22 22:40:40','1977-01-13 01:00:31','8','8'),
('9','2008-06-16 01:54:01','2019-02-01 19:19:00','9','9'),
('10','1992-11-16 18:11:39','2017-11-03 15:32:43','10','10'); 

INSERT INTO `Status_quarto` VALUES ('1','1','Libero eos rerum repellat voluptas reprehenderit inventore vero consectetur nihil quo.','1995-05-01 13:26:23','1977-06-26 20:29:28','1'),
('2','6','Nobis dolores molestiae consequatur suscipit placeat iste ut veniam sint quibusdam ut.','1971-09-25 13:55:48','2009-09-25 00:14:30','2'),
('3','1','Non facere ipsam omnis inventore dolorum error eos facere quas eveniet in sunt quaerat.','1981-12-28 20:58:36','2007-02-17 01:57:14','3'),
('4','5','Laudantium sint ut modi provident similique molestiae non.','2020-04-01 03:41:52','2007-02-12 00:06:32','4'),
('5','8','Minus et et aut est harum quis illo iusto.','2009-05-30 10:35:49','1987-06-14 02:38:25','5'),
('6','1','Amet beatae alias totam iure voluptatem ullam saepe eligendi amet aut qui aut.','2017-01-12 15:52:53','1974-11-08 22:31:32','6'),
('7','1','Aut illum et voluptatem dignissimos consequatur qui eius.','1984-05-15 09:15:53','2009-05-24 03:12:23','7'),
('8','3','Id perferendis rerum dicta odio harum voluptatem.','1973-08-12 11:11:30','2004-03-01 12:47:32','8'),
('9','1','Ea praesentium deserunt autem eligendi explicabo maiores voluptatibus incidunt laudantium ad voluptas incidunt.','1970-12-13 21:49:39','1995-12-18 22:07:23','9'),
('10','4','Rerum dolorem corrupti quam excepturi nihil nemo.','2011-04-11 12:27:12','2006-06-05 20:39:52','10'); 

INSERT INTO `Servico` VALUES ('1','4','jacobi','Porro architecto quisquam optio sint blanditiis cupiditate.','129.36','1'),
('2','4','wunsch','Eum non est ratione totam quia enim qui et ullam.','46.69','2'),
('3','4','wisokyprice','Impedit cumque et quasi commodi dolorem quaerat laborum aliquid.','34.24','3'),
('4','2','will','Eos vero asperiores ut ad est accusantium enim facilis amet dolore nam omnis.','66.82','4'),
('5','9','quigley','Qui eius dolorem enim enim corrupti voluptatem rem voluptatibus.','403.87','5'),
('6','4','jenkins','Nihil omnis ipsam quas reiciendis excepturi officiis reprehenderit libero.','295.38','6'),
('7','3','weissnatwunsch','Facere exercitationem molestias autem maxime possimus ipsum accusamus voluptatem aperiam deleniti.','407.33','7'),
('8','3','altenwerthmaggio','Accusamus ipsa earum rerum et sit assumenda consequatur repellendus beatae quae.','49.12','8'),
('9','7','gradyhalvorson','Et vel pariatur a consequatur consequuntur voluptas amet tempore sed maiores.','28.08','9'),
('10','1','haley','Sed blanditiis enim autem cupiditate temporibus aut vitae eveniet eum voluptates qui necessitatibus.','3.98','10'); 

-- selects 
SELECT * FROM controle_hotel.Cliente;
SELECT * FROM controle_hotel.Quarto;
SELECT * FROM controle_hotel.Reserva;
SELECT * FROM controle_hotel.Servico;
SELECT * FROM controle_hotel.Status_quarto;
