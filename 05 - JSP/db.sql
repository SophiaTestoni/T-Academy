#Criar base de dados
CREATE DATABASE jsp;

#Selecionar a base de dados
USE jsp;

#Criar tabela de pessoas
CREATE TABLE pessoas(
codigo INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(30),
idade INT 
);

SELECT * FROM pessoas;
