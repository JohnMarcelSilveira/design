DROP DATABASE IF EXISTS Portal;

CREATE DATABASE Portal;

\c Portal


CREATE TABLE postagem(
    id serial primary key,
    titulo varchar(60) not null,
    texto text not null,
    data_hora timestamp default current_timestamp
);

CREATE TABLE autor(
    id serial primary key,
	nome varchar(60),
	email varchar(60),
	senha varchar(30)
);

CREATE TABLE autor_post(
	autor_id integer references autor(id),
	post_id integer references postagem(id),
	primary key (autor_id,post_id)
);


CREATE TABLE leitor(
    id serial primary key,
	nome varchar(60),
	email varchar(60),
	senha varchar(30)
);

CREATE TABLE endereco(
    id serial primary key,
	bairro varchar(60),
	rua varchar(60),
	numero varchar(6),
	complemento varchar(60),
	cep varchar(8)
);
