#Base de dados
CREATE DATABASE projeto;

#Selecionar base de dados
USE projeto;

#Tabela de marcas
CREATE TABLE marcas(
	codigo_marca INT AUTO_INCREMENT PRIMARY KEY,
	nome_marca VARCHAR(30) NOT NULL
);
 INSERT INTO marcas(nome_marca) VALUES
("Apple"),
("Samsung"),
("Xiaomi");
SELECT * FROM marcas;

#Tabela de produtos
CREATE TABLE produtos(
	codigo_produto INT AUTO_INCREMENT PRIMARY KEY,
	nome_produto VARCHAR(40) NOT NULL,
	codigo_marca INT,
FOREIGN KEY (codigo_marca) REFERENCES marcas(codigo_marca)
);

# Inserir produtos
INSERT INTO produtos (nome_produto, codigo_marca) VALUES
("Iphone 13", 1),
("Samsumg Galaxy s10", 2),
("Iphone 12", 1);
SELECT * FROM produtos;

# INNER JOIN - caracteristicas em duas ou mais tabelas // espeficiar tabela.coluna
# Transformou o codigo da marca no nome da marca perante informações que coincidem nas tabelas
SELECT
	produtos.nome_produto,
	marcas.nome_marca
FROM produtos
INNER JOIN marcas
ON produtos.codigo_marca = marcas.codigo_marca;

# Nesse caso o COUNT vai contar a quantidade de linhas do produto.codigo_marca e o GROUP BY agrupar por cada marca.
# Se ficasse só o COUNT, iria retornar somente a quantidade de linhas (3 para esse caso)
# Com o LEFT JOIN eu listo a tabela inteira independente se está sendo utilizada ou não e na coluna esquerda virá todas essas informações
# Então o count e group by vai fazer as contagens
# A tabela que eu setei no SELECT (nesse caso marcas.) é a ordem que devo seguir no FROM para o LEFT JOIN
SELECT
marcas.nome_marca,
	COUNT(produtos.codigo_marca)
FROM marcas
LEFT JOIN produtos 
ON produtos.codigo_marca = marcas.codigo_marca
GROUP BY produtos.codigo_marca;

# o NOW irá mostrar a data e hora, o DATE_FORMAT irá permitir colocar no padrão que eu queira e o LIMIT irá puxar somente uma linha
SELECT *, DATE_FORMAT(NOW(), "%d / %m / %y"),
DATE_FORMAT(NOW(), "%H:%i")
FROM produtos LIMIT 1;

