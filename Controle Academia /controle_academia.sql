/*
	Aluno: Filipe Abner de Assis Santos
    Disciplina: 20202:CIN20187:GO1301 - ADMINISTRAÇÃO E ORGANIZAÇÃO DE BANCO DE DADOS
*/


create database if not exists controle_academia;
use controle_academia;

-- tables
create table if not exists Aluno(
	id integer not null auto_increment primary key,
    nome varchar(100) not null,
    rg varchar(8) not null,
    data_nascimento date not null,
    endereco varchar(200) ,
    telefones text,
    matricula varchar(200) not null,
    data_matricula date
);
create table if not exists Instrutor(
	id integer not null auto_increment primary key,
    nome varchar(100) not null,
    rg varchar(8) not null,
    data_nascimento date not null,
    endereco varchar(200) ,
    telefones text,
    titulacao varchar(200) not null
);
create table if not exists Turma(
	id integer not null auto_increment primary key,
    matriculados integer not null,
    horario time not null,
    duracao time not null,
    data_inicio date not null,
    data_final date not null,
    tipo_atividade varchar(100),
    instrutor_id integer not null,
    constraint fk_turma_instrutor foreign key (instrutor_id) references Instrutor(id)
);

-- pivots
create table if not exists Presenca(
	id integer not null auto_increment primary key,
    marcacao_inicial datetime not null,
    marcacao_final datetime not null,
    aluno_id integer not null,
	constraint fk_presenca_aluno_id foreign key (aluno_id) references Aluno(id)
);

create table if not exists AlunoTurma(
	aluno_id integer not null,
	turma_id integer not null,
    monitor bool, 
	constraint fk_aluno_turma foreign key (aluno_id) references Aluno(id),
	constraint fk_turma_aluno foreign key (turma_id) references Turma(id),
	constraint composta_id primary key(aluno_id, turma_id) 
);
-- inserts 

INSERT INTO `Aluno` VALUES 
('1','Mike','682944','1974-06-24','4858 Murray Centers\nJacobsonside, TX 94804-9654','(458)835-7528','494','2005-09-18'),
('2','Raheem','859872','1987-11-22','60237 Curtis Square\nPort Mckaylaborough, MI 26288-2569','9Aluno65-243-3300x0991','101','2003-06-02'),
('3','Brenna','776205','2016-01-11','929 Prohaska Tunnel Suite 067\nKuphalhaven, UT 09305','263.511.8461','205','1993-02-10'),
('4','Lilian','458121','1970-01-17','949 Sawayn Valleys Apt. 559\nNew Rosina, MN 33811-8435','1-413-429-1140x01808','442','1990-06-16'),
('5','Tate','835574','1980-06-12','3492 Schimmel Forges Suite 194\nEast Tedfort, OH 34028','03408766028','393','2009-10-22'),
('6','Joesph','851740','1980-01-31','3255 Easton Plaza\nLake Tatetown, IA 50065-5538','552-633-0365x69322','410','2015-03-30'),
('7','Dario','743888','2011-09-02','34337 Foster Motorway\nJamisonborough, MN 11824-2092','(072)801-4354','140','2008-02-18'),
('8','Domenica','637615','2003-07-21','51953 Daphnee Shores Suite 362\nEast Camdenbury, KY 13164-5195','+33(7)1176868043','257','2002-08-08'),
('9','Donna','429864','1984-09-01','459 Dejuan Village\nAdriannaberg, UT 16986','501.934.3617','222','2015-03-30'),
('10','Mitchell','167412','1988-11-12','10200 Fredrick Course Apt. 768\nWest Waldo, NY 42156','863-066-6164','440','1997-11-16'); 

INSERT INTO `Instrutor` VALUES 
('1','Fabian','990608','1999-11-30','413 Erdman Views\nCummingsville, NC 64280','710174877','musculacao'),
('2','Jaqueline','836580','2013-09-15','1520 Annabell Mount Apt. 751\nEast Hank, NJ 46012','330428552','natacao'),
('3','Piper','765015','2004-06-11','8058 Zion Field Suite 292\nPort Elvie, CO 16582-5558','692294635','hidroginastica'),
('4','Eliseo','23449','1985-01-23','5888 Electa Run Suite 731\nNew Casimirburgh, ME 20815-3507','196443169','musculacao'),
('5','Sigrid','407360','2017-03-19','15672 Helene Village Suite 212\nReichertchester, NC 17609-3783','568150054','natacao'),
('6','Roslyn','943022','2015-06-11','090 Ashley Spring\nGeraldineview, ME 25538-7044','765731762','pilates'),
('7','Ozella','585500','1978-04-04','3170 Mikayla Springs\nWest Hilton, GA 40297','639478521','hidroginastica'),
('8','Obie','675513','1991-01-07','383 Rau Radial Apt. 041\nEast Denaburgh, NV 70985','247780800','pilates'),
('9','Jammie','313805','1987-01-18','83076 Dexter Crescent Apt. 234\nRyanview, WY 20141-6576','651622906','musculacao'),
('10','Emmett','958771','1998-04-11','523 Nitzsche Courts\nBennettfort, NY 93008','873205803','natacao'); 

INSERT INTO `Turma` VALUES 
('1','7','09:03:40','19:04:58','1982-10-18','1998-10-27','hidroginastica','1'),
('2','8','02:47:00','01:41:43','2018-06-21','1976-04-09','musculacao','2'),
('3','8','14:06:10','14:58:29','1983-03-14','2005-01-03','natacao','3'),
('4','5','07:05:32','10:35:57','1970-02-16','2019-03-08','hidroginastica','4'),
('5','7','18:39:31','13:40:31','2002-11-19','1973-01-15','natacao','5'),
('6','1','10:34:07','13:03:35','1999-04-13','1986-10-30','musculacao','6'),
('7','8','06:18:50','14:32:25','2016-08-17','2003-02-10','hidroginastica','7'),
('8','2','03:19:31','09:11:12','2019-03-09','2013-01-07','musculacao','8'),
('9','8','01:40:29','06:53:57','2005-03-04','1970-02-23','musculacao','9'),
('10','6','15:30:10','07:54:27','2009-12-16','1995-03-09','musculacao','10'); 

INSERT INTO `Presenca` VALUES 
('1','2020-09-3 15:46:39','2020-09-3 15:46:39','10'),
('2','2020-09-3 15:46:39','2020-09-3 15:46:39','9'),
('3','2020-09-3 15:46:39','2020-09-3 15:46:39','8'),
('4','2020-09-3 15:46:39','2020-09-3 15:46:39','7'),
('5','2020-09-3 15:46:39','2020-09-3 15:46:39','6'),
('6','2020-09-3 15:46:39','2020-09-3 15:46:39','5'),
('7','2020-09-3 15:46:39','2020-09-3 15:46:39','4'),
('8','2020-09-3 15:46:39','2020-09-3 15:46:39','3'),
('9','2020-09-3 15:46:39','2020-09-3 15:46:39','2'),
('10','2020-09-3 15:46:39','2020-09-3 15:46:39','1');

INSERT INTO `AlunoTurma` VALUES 
('1','1',TRUE),
('2','2',FALSE),
('3','3',FALSE),
('4','4',FALSE),
('5','5',FALSE),
('6','6',FALSE),
('7','7',FALSE),
('8','8',FALSE),
('9','9',FALSE),
('10','10',FALSE);