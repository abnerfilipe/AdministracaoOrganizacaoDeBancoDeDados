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
create table if not exists Locacao(
	id integer not null auto_increment primary key,
    data_hora_locacao datetime,
    data_hora_delovolucao datetime,
    cliente_id integer not null, 
    categoria_id integer not null,
    constraint fk_cliente_locacao foreign key(cliente_id) references Cliente(id),
    constraint fk_categoria_locacao foreign key(categoria_id) references Categoria(id)
);
create table if not exists Categoria(
	id integer not null auto_increment primary key,
    codigo integer not null unique,
    nome varchar(255) not null,
    descricao text not null,
    preco double not null
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
