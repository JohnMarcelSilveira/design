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
	cep varchar(9)
);

/* inserts */

INSERT INTO autor (nome, email, senha)
VALUES
    ('Autor 1', 'autor1@email.com', 'senha1'),
    ('Autor 2', 'autor2@email.com', 'senha2'),
    ('Autor 3', 'autor3@email.com', 'senha3'),
    ('Autor 4', 'autor4@email.com', 'senha4'),
    ('Autor 5', 'autor5@email.com', 'senha5'),
    ('Autor 6', 'autor6@email.com', 'senha6'),
    ('Autor 7', 'autor7@email.com', 'senha7'),
    ('Autor 8', 'autor8@email.com', 'senha8'),
    ('Autor 9', 'autor9@email.com', 'senha9'),
    ('Autor 10', 'autor10@email.com', 'senha10');


INSERT INTO leitor (nome, email, senha)
VALUES
    ('Leitor 1', 'leitor1@email.com', 'senha11'),
    ('Leitor 2', 'leitor2@email.com', 'senha12'),
    ('Leitor 3', 'leitor3@email.com', 'senha13'),
    ('Leitor 4', 'leitor4@email.com', 'senha14'),
    ('Leitor 5', 'leitor5@email.com', 'senha15'),
    ('Leitor 6', 'leitor6@email.com', 'senha16'),
    ('Leitor 7', 'leitor7@email.com', 'senha17'),
    ('Leitor 8', 'leitor8@email.com', 'senha18'),
    ('Leitor 9', 'leitor9@email.com', 'senha19'),
    ('Leitor 10', 'leitor10@email.com', 'senha20');

INSERT INTO endereco (bairro, rua, numero, complemento, cep)
VALUES
    ('Bairro 1', 'Rua 1', '123', 'Complemento 1', '12345-111'),
    ('Bairro 2', 'Rua 2', '456', 'Complemento 2', '12345-222'),
    ('Bairro 3', 'Rua 3', '789', 'Complemento 3', '12345-333'),
    ('Bairro 4', 'Rua 4', '101', 'Complemento 4', '12345-444'),
    ('Bairro 5', 'Rua 5', '202', 'Complemento 5', '12345-555'),
    ('Bairro 6', 'Rua 6', '303', 'Complemento 6', '12345-666'),
    ('Bairro 7', 'Rua 7', '404', 'Complemento 7', '12345-777'),
    ('Bairro 8', 'Rua 8', '505', 'Complemento 8', '12345-888'),
    ('Bairro 9', 'Rua 9', '606', 'Complemento 9', '12345-999'),
    ('Bairro 10', 'Rua 10', '707', 'Complemento 10', '12345-000');


INSERT INTO postagem (titulo, texto, compartilhado)
VALUES
    ('Título 1', 'Texto 1', true),
    ('Título 2', 'Texto 2', false),
    ('Título 3', 'Texto 3', true),
    ('Título 4', 'Texto 4', false),
    ('Título 5', 'Texto 5', true),
    ('Título 6', 'Texto 6', false),
    ('Título 7', 'Texto 7', true),
    ('Título 8', 'Texto 8', false),
    ('Título 9', 'Texto 9', true),
    ('Título 10', 'Texto 10', false);


-- Inserir registros fictícios na tabela autor_post
INSERT INTO autor_post (autor_id, post_id)
VALUES
    (1, 1),
    (1, 2),
    (2, 3),
    (2, 4),
    (3, 5),
    (3, 6),
    (4, 7),
    (4, 8),
    (5, 9),
    (5, 1),
    (6, 1),
    (6, 2),
    (7, 3),
    (7, 4),
    (8, 5),
    (8, 6),
    (9, 7),
    (9, 8),
    (10, 9),
    (10, 1);


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



