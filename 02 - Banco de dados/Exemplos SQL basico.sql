# Criar a base de dados
CREATE DATABASE base;

# selecionar base de dados - no Workbanch pode só clicar duas vezes no base na lateral esquerda. 
USE base;

#Criar tabela de produtos
CREATE TABLE produtos(
codigo INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(30),
marca VARCHAR(20),
valor DOUBLE,
dataCadastro DATE
);

# cadastrar produtos #1      null pois já colocamos o codigo como auto increment
INSERT INTO produtos VALUES (null, "Notebbok Inspiron","Dell", 4599,"2022-10-10");

# Cadastrar produtos #2
INSERT INTO produtos(nome, marca, valor) VALUES("Notebook Dell", "Dell", 2900);

# cadastrar produtos #3
INSERT INTO produtos VALUES
(null, "Iphone 13","Apple", 7000, "2020-08-07"),
(null,"Monitor Predator", "Acer", 1950, "2022-10-07"),
(null,"Notebook Vostro","Dell", 3800,"2021-09-14");

SELECT * FROM produtos;

# Selecionar as colunas nome e valor
SELECT nome, valor FROM produtos;

#Selecionar produtos com valor inferior a 3 mil reais - utilizando operadores matemáticos
SELECT * FROM produtos WHERE valor < 3000;

#Selecionar informações com atributos nulos - o sinal de equals (=) não irá funcionar para o NULL, o contratário é IS NOT NULL
SELECT * FROM produtos WHERE dataCadastro IS NULL;

/* Agrupar informações - comando de agrupamento MAX e MIN (só funciona para numeros DOUBLE, INT...)
*/ # o AS está sendo utilizado para renomear a coluna
SELECT MAX(valor) AS "Maior valor" FROM produtos;
SELECT MIN(valor) AS "Menor valor" FROM produtos;

# Comando de média de valores
SELECT AVG(valor) AS "Média valor" FROM produtos;

# Conta a quantidade de registros nas colunas das tabelas
SELECT COUNT(*) AS "Registros" FROM produtos;

# Condicional
SELECT 
	nome,
	valor,
		# Mesmo conceito do ternário
IF(valor >= 3000, valor*0.9, valor*0.95) AS "Valor com pagamento à vista"
FROM produtos;

# Escolha caso (switch case)
SELECT 
	nome, 
	valor,
CASE
	WHEN valor <= 1000 THEN valor*0.95
	WHEN valor <= 2000 THEN valor*0.90 
	WHEN valor <= 4000 THEN valor*0.85
	ELSE valor*0.80
END AS "Descontos"
FROM produtos;

# Operadores lógicos (AND, OR) 
SELECT * FROM produtos WHERE marca = "Dell" AND valor >= 3000;

# Ordenar dados (ORDER BY) - normalmente ele já faz ASC mas se eu quiser fazer o contrário só acrescentar DESC
SELECT nome FROM produtos ORDER BY nome DESC;

#Agrupar (GROUP BY) - irá agrupar mas marcas repetidas e aparecer só uma vez
SELECT marca FROM produtos GROUP BY marca;

# Contém (LIKE)
# _% Inicia com letra X // %_ finaliza com letra X // %_% possui letra X 
SELECT nome FROM produtos WHERE nome LIKE "N%";
SELECT nome FROM produtos WHERE nome LIKE "%O";
SELECT nome FROM produtos WHERE nome LIKE "%P%";

#Alterar informação (UPDATE)
UPDATE produtos SET valor = 7000 WHERE codigo = 1;
UPDATE produtos SET nome = "Notebook Inspiron" WHERE codigo = 1;

#Sub-query
SELECT * FROM produtos WHERE valor = (SELECT MAX(valor) FROM produtos);

#Remover dados (DELETE)
DELETE FROM produtos WHERE nome LIKE "Notebook%";

#Limpar a tabela e reiniciar o auto incremento
TRUNCATE TABLE produtos;
SELECT * FROM produtos;

# Listar as colunas da tabela (DESCRIBE) - lista os campos, tipos de dados, se pode NULL, a Key, Default e extras.
DESCRIBE produtos;

# Criar colunas 
ALTER TABLE produtos ADD COLUMN estoque INT;

# Excluir colunas
ALTER TABLE produtos DROP COLUMN estoque;

# Alterar carcacterísticas das colunas
ALTER TABLE produtos MODIFY COLUMN nome VARCHAR(50);

# Renomear coluna
ALTER TABLE produtos RENAME COLUMN nome TO produto;

# Excluir tabela
DROP TABLE produtos;

#Excluir a base de dados
DROP DATABASE base;