CREATE DATABASE procedimentos;
#01 // #02
CREATE TABLE clientes(
codigo_cliente INT PRIMARY KEY AUTO_INCREMENT,
nome_cliente VARCHAR(30),
email_cliente VARCHAR(50)
);

#03 Criar uma procedure para cadastrar os clientes, os parâmetros obrigatórios serão: nome e e-mail.
DELIMITER $$
CREATE PROCEDURE cadastrar(IN nome VARCHAR(30), IN email VARCHAR(50))
BEGIN
INSERT INTO clientes VALUES (null, nome, email);
END $$
DELIMITER ;

#04 Insira um cliente através da procedure criada.
CALL cadastrar("Sophia", "sophia@testoni");
DROP PROCEDURE cadastrar;

#05 Implemente a procedure de cadastro com as regras de negócio
CREATE PROCEDURE get_rules(nome VARCHAR(30))
BEGIN
DECLARE qtd_nome 