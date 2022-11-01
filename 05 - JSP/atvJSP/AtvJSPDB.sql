CREATE DATABASE jspblog;
USE jspblog;

CREATE TABLE postagens(
codigo INT PRIMARY KEY AUTO_INCREMENT,
titulo VARCHAR(40),
subtitulo VARCHAR(90),
conteudo TEXT
);

CREATE TABLE comentarios(
codigo_comentario INT PRIMARY KEY AUTO_INCREMENT,
codigo_noticia int not null,
FOREIGN KEY (codigo_noticia) REFERENCES postagens(codigo),
nome VARCHAR(255),
mensagem VARCHAR(255)
);

select * from comentarios