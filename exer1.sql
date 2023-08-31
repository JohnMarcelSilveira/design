DROP DATABASE IF EXISTS portal;

CREATE DATABASE portal;

\c portal


CREATE TABLE postagem(
    id serial primary key,
    titulo varchar(60) not null,
    texto text not null,
    data_hora timestamp default current_timestamp,
    compartilhado bool default false
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



/*

Informações de todos os leitores e autores 

select * from leitor
union
select * from autor

Quantidade de autores envolvidos na escrita de cada Post 

select post_id,count(*) from autor_post group by post_id 


O título de cada Post e o nome de cada autores envolvido na escrita de cada Post 

select p.titulo, a.nome from postagem p inner join autor_post ap on ap.post_id=p.id inner join autor a on a.id=ap.autor_id


Listar os leitores com e sem endereços. Caso tenha endereço, coloque o endereço. Se não tiver, coloque "Sem endereço cadastrado" 


*/



