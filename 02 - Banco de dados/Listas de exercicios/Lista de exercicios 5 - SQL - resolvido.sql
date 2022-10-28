CREATE DATABASE Atv05;
CREATE TABLE marcas(
codigo_marca INT PRIMARY KEY AUTO_INCREMENT,
nome_marca VARCHAR(20)
);
CREATE TABLE produtos(
codigo_produto INT PRIMARY KEY AUTO_INCREMENT,
nome_produto VARCHAR(50),
valor_produto DOUBLE,
qtd_estoque INT,
codigo_marca INT,
FOREIGN KEY(codigo_marca) REFERENCES marcas(codigo_marca)
);
INSERT INTO marcas VALUES
(null, "Nike"),
(null, "Adidas"),
(null, "Colcci"),
(null, "Tommy Hilfiger"),
(null, "Hering"),
(null, "Vans"),
(null, "Vizzano"),
(null, "Aramis"),
(null, "Reserva");

INSERT INTO produtos VALUES
(null,"Tênis Adidas Performance",345,765,2),
(null,"Tênis Nike Revolution",769,1235,1),
(null,"Blusa feminina rosa",99,754,6),
(null,"Camisa social branca",180.99,235,8),
(null,"Bota Chelsea Lacey",322,98,3),
(null,"Blusa moletom Romance",150.76,324,3),
(null,"Camiseta preta base",79,1235,4),
(null,"Bolsa Colcci Lisa",249,112,3),
(null,"Camisa Adidas Originals", 346,344,2),
(null,"Bota Colcci azul",1540,143,3),
(null,"Scarpin feminino salto",877,673,7),
(null,"Camiseta Nike Dri-FIT",124,228,1),
(null,"Camisa polo azul",233,549,8),
(null,"Camisa Polo Tommy Hilfiger",499,794,4),
(null,"Sandália Vizzano",1540,83,7),
(null,"Tênis Adidas Superstar",769,326,2),
(null,"Camiseta algodão verde",76.99,1214,9),
(null,"Short Nike Nk",298,683,1),
(null,"Camisa Aramis geométrica",355,1033,8),
(null,"Bolsa Nike Unissex", 265.29,596,1),
(null,"Camiseta Aramis vermelha", 199,457,8),
(null,"Boné Tommy Jeans",204.64,68,4),
(null,"Jaqueta Adidas ECO",609.98,116,2);
SELECT * FROM produtos;

#01 Exiba o nome do produto, nome da marca e o valor do produto.
SELECT produtos.nome_produto, marcas.nome_marca, produtos.valor_produto FROM produtos JOIN marcas ON produtos.codigo_marca = marcas.codigo_marca
ORDER BY produtos.nome_produto;

#02 Listar obrigatoriamente todas as marcas e a quantidade de produtos cadastrados por marca.
SELECT marcas.*, produtos.qtd_estoque FROM marcas
JOIN produtos ON marcas.codigo_marca = produtos.codigo_marca
GROUP BY marcas.nome_marca;

#03 Exibir o nome do produto e seu valor em ordem decrescente (do maior valor para o menor).
SELECT nome_produto, valor_produto
FROM produtos ORDER BY valor_produto DESC;

#04 Média dos valores dos produtos por cada marca.
SELECT marcas.nome_marca, ROUND(AVG(produtos.valor_produto),2) AS "Média valor marcas" FROM marcas
JOIN produtos ON produtos.codigo_marca = marcas.codigo_marca
GROUP BY marcas.nome_marca;

#05 Listar nome do produto, valor, nome da marca e quantidade em estoque do produto de maior valor (Haverá dois produtos, os dois terão que ser exibidos).
SELECT produtos.nome_produto, produtos.valor_produto, marcas.nome_marca, produtos.qtd_estoque FROM produtos
JOIN marcas ON produtos.codigo_marca = marcas.codigo_marca
WHERE produtos.valor_produto = (SELECT MAX(produtos.valor_produto) FROM produtos);

#06 Listar todos os produtos (exiba todos os dados e converta o código da marca para o nome), onde o estoque esteja entre 500 e 1000 unidades.
SELECT produtos.nome_produto, marcas.nome_marca, produtos.qtd_estoque FROM produtos
JOIN marcas ON produtos.codigo_marca = marcas.codigo_marca WHERE produtos.qtd_estoque BETWEEN 500 AND 1000;

#07 Listar todos os produtos (nome, valor e estoque) que contenham os termos: Blusa, Camiseta e Camisa. Exiba em ordem decrescente de preço
SELECT nome_produto, valor_produto, qtd_estoque FROM produtos
WHERE nome_produto LIKE "%Blusa%" OR nome_produto LIKE "%Camiseta%" OR nome_produto LIKE "%Camisa%";

#08 Exibir a soma dos valores de cada produto e agrupar por marcas que estejam vinculadas em algum produto.
SELECT marcas.nome_marca, SUM(produtos.valor_produto) FROM marcas INNER JOIN produtos ON marcas.codigo_marca = produtos.codigo_marca
GROUP BY marcas.nome_marca;

#09 Exibir o nome da marca, onde o produto é o mais caro.
SELECT marcas.nome_marca, produtos.valor_produto
FROM marcas INNER JOIN produtos ON marcas.codigo_marca = produtos.codigo_marca
WHERE produtos.valor_produto = (SELECT MAX(produtos.valor_produto) FROM produtos)
GROUP BY produtos.valor_produto;

#10 Listar todos os produtos (nome e estoque), onde a quantidade em estoque seja maior ou igual a média total do estoque contido na tabela de produtos
SELECT AVG(qtd_estoque) FROM produtos;
SELECT nome_produto, qtd_estoque FROM produtos 
WHERE qtd_estoque >= (SELECT AVG(qtd_estoque) FROM produtos);

#11 Excluir todas as tabelas.
DROP TABLE produtos;
DROP TABLE marcas;