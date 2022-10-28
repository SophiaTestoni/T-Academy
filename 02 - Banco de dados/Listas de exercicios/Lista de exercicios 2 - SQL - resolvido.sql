CREATE DATABASE atv02;
CREATE TABLE produtos(
codigo INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50),
marca VARCHAR(25),
valor DOUBLE, 
estoque INT
);

INSERT INTO produtos VALUES
(null, "Teclado", "Microsoft", 222, 60),
(null, "Monitor", "Samsung", 3700, 20),
(null, "Mouse", "Logitec", 129.90, 45),
(null, "Impressora", "Epson", 430, 15),
(null,"Mouse", "Microsoft", 199.90, 50),
(null,"Monitor 27", "LG", 1990.80, 30),
(null,"Cadeira Gamer", "Multilaser", 1170, 20),
(null,"Teclado", "Dell", 110.00, 50),
(null,"Mouse", "HP", 80, 70),
(null,"Placa de vídeo - GeForce GTX 1660", "ASUS", 2800, 10),
(null,"SSD de 256GB","Kingston", 400, 15),
(null,"Processador Core i5 - 10º geração", "Intel", 1800, 10),
(null,"Mouse", "Multilaser", 44.90, 70),
(null, "Monitor 23", "Dell", 1080, 40),
(null,"Teclado", "HP", 119.90, 25);
SELECT * FROM produtos;

# 01 Listar o nome das marcas (sem repetição) e a quantidade de produtos das respectivas marcas.
SELECT marca, COUNT(nome) FROM produtos GROUP BY marca;

# 02 Média dos valores de todos os produtos.
SELECT AVG(valor) AS "Média valores" FROM produtos;

#3 Exibir o nome da marca (sem repetição) e a soma dos produtos que fazem parte da respectiva marca.
SELECT marca, SUM(valor) FROM produtos GROUP BY marca;

#04 Exibir o nome do produto e o valor em ordem decrescente (do mais caro para o mais barato).
SELECT nome, valor FROM produtos ORDER BY valor DESC;

#05 Nome e valor do produto mais caro.
SELECT nome, valor, MAX(valor) FROM produtos;

#06 Exibir todos os produtos, onde seu valor seja maior ou igual a média de todos os valores cadastrados.
SELECT * FROM produtos WHERE valor >= (SELECT AVG(valor) FROM produtos);

#07 Informar o nome do produto, marca, valor e quantidade em estoque, do produto que possui maior estoque.
SELECT nome, marca, valor, estoque, MAX(estoque) FROM produtos;

#8 Exibir o nome do produto, marca e valor, onde os valores dos produtos estejam entre R$100,00 e R$500,00.
SELECT nome, marca, valor FROM produtos WHERE valor BETWEEN 100 AND 500;

#09 Listar o nome, marca e valor de todos os produtos que sejam mouses, exiba em ordem crescente de preço (do menor para o maior).
SELECT nome, marca, valor FROM produtos WHERE nome = "mouse" ORDER BY valor;

#10 Exiba o nome do produto e a quantidade de letras.
SELECT nome, LENGTH(nome) AS "Quantidade letras" FROM produtos;

#11 Troque a marca Dell para Alienware
UPDATE produtos SET marca = "Alienware" WHERE marca = "Dell";
SELECT * FROM produtos;

#12 Excluir a tabela.
DROP TABLE produtos;