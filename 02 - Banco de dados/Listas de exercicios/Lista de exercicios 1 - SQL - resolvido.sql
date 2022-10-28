#Criando a DB
CREATE DATABASE Atv01;

#Criando a tabela
CREATE TABLE clientes(
código_cliente INT PRIMARY KEY AUTO_INCREMENT, 
nome_cliente VARCHAR(40),
cidade_cliente VARCHAR(20),
idade_cliente INT
);

INSERT INTO clientes VALUES 
(null, "Erica", "Curitiba", 28),
(null, "Lucas", "Blumenau", 16),
(null, "Larissa", "Florinópolis", 36),
(null, "Murilo", "Joiville", 23),
(null, "Cristiane", "Blumenau", 31),
(null, "Robson", "Joinville", 42),
(null, "Mariana", null, 37),
(null, "Jean", "Blumenau", 43),
(null, "Luana", "Pomerode", 19),
(null, "Cleber", "Brusque", 34),
(null, "Hellen", "Blumenau", 28),
(null, "Paulo", "Joinville", 44),
(null, "Alessandra", "São Paulo", 28),
(null, "Denis", "Blumenau", 37),
(null, "Bianca", "Campinas", 23),
(NULL, "Gabriel", "São Paulo", 26);

# 01: Selecionar todos os registros da tabela:
SELECT * FROM clientes;

# 02: Contar quantos registros possui a tabela
SELECT COUNT(*) FROM clientes;

#03: Retornar a maior idade e o nome da pessoa com essa idade.
SELECT * FROM clientes WHERE idade_cliente = (SELECT MAX(idade_cliente) FROM clientes);

#04: Exiba todas as cidades registradas sem repetição.
SELECT cidade_cliente FROM clientes GROUP BY cidade_cliente;

#05 Exibir todas as cidades registradas e a quantidade de pessoas que moram na respectiva cidade.
SELECT cidade_cliente, COUNT(cidade_cliente) FROM clientes GROUP BY cidade_cliente;

#06 Exibir o nome da pessoa e a idade, onde a cidade seja nula.
SELECT nome_cliente, idade_cliente FROM clientes WHERE cidade_cliente IS NULL;

#07 Exibir a média das idades.
SELECT AVG(idade_cliente) AS "Média idades" FROM clientes;
 
# 08 Informar o nome e a idade da pessoa mais jovem.
SELECT nome_cliente, MIN(idade_cliente) FROM clientes;

# 09 Exibir o nome e a idade de todas as pessoas com idade maior ou igual a média de todas as idades cadastradas.
SELECT nome_cliente, idade_cliente FROM clientes WHERE idade_cliente >= (SELECT AVG(idade_cliente) FROM clientes);

# 10 Listar todas nome, cidade e idade de todas as pessoas com idade entre 20 e 30 anos.
SELECT nome_cliente, cidade_cliente, idade_cliente FROM clientes WHERE idade_cliente BETWEEN 20 AND 30;

# 11 Exibir o nome, cidade e idade de todos os clientes que moram em Blumenau e tem idade maior ou igual a 30 anos.
SELECT nome_cliente, cidade_cliente, idade_cliente FROM clientes WHERE cidade_cliente = "Blumenau" AND idade_cliente >= 30;

#12 Listar o nome e cidade de todos os clientes que moram em Florianópolis ou Curitiba.
SELECT nome_cliente, cidade_cliente FROM clientes WHERE cidade_cliente = "Florinópolis" OR cidade_cliente = "Curitiba";

#13 Listar o nome de todos os clientes que contenham a letra L.
SELECT nome_cliente FROM clientes WHERE nome_cliente LIKE "L%";

#14 Exibir todos os nomes em ordem alfabética.
SELECT nome_cliente FROM clientes ORDER BY nome_cliente;

#15 Alterar para Blumenau todos os registros onde a cidade seja NULL
UPDATE clientes SET cidade_cliente = "Blumenau"
WHERE cidade_cliente IS NULL;
SELECT * FROM clientes;

#16 Excluir todos os clientes onde a cidade seja diferente de Blumenau.
DELETE FROM clientes WHERE cidade_cliente <> "Blumenau";
SELECT * FROM clientes;

#17 Excluir a tabela.
DROP TABLE clientes;

