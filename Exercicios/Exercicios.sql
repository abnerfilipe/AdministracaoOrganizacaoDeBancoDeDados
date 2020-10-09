/*
	Aluno: Filipe Abner de Assis Santos
    Disciplina: 20202:CIN20187:GO1301 - ADMINISTRAÇÃO E ORGANIZAÇÃO DE BANCO DE DADOS
*/

create database if not exists intranet;
use intranet;
create table if not exists usuario(
	id integer not null auto_increment primary key,
	senha varchar(255) not null, 
    nome varchar(255) not null, 
    ramal integer,
    especialidade varchar(255) not null
);
create table if not exists maquina(
	id integer not null auto_increment primary key ,
    tipo varchar(255) not null,
	velocidade double not null,
    hd varchar(255) not null,
    placa_rede varchar(255) not null,
    memoria_ram varchar(255) not null
);
create table if not exists software(
	id integer not null auto_increment primary key,
    produto varchar(255) not null,
	hd varchar(255) not null,
    memoria_ram varchar(255) not null
);
create table if not exists possuem(
    id_usuario integer,
    id_maquina integer,
    constraint fk_possui_usuario foreign key (id_usuario) references usuario(id),
    constraint fk_possui_maquina foreign key (id_maquina) references maquina(id),
    constraint id primary key(id_usuario,id_maquina)
);
create table if not exists contem(
	id_maquina integer,
    id_software integer,
    constraint fk_contem_maquina foreign key (id_maquina) references maquina(id),
    constraint fk_contem_software foreign key (id_software) references software(id),
    constraint id primary key(id_maquina,id_software)
);


