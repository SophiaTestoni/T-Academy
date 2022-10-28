CREATE DATABASE gatilhos;
#01 Criar uma tabela alunos com a seguinte estrutura:
CREATE TABLE alunos(
codigo_aluno INT PRIMARY KEY,
nome_aluno VARCHAR(30) NOT NULL,
nota1_aluno DOUBLE NOT NULL,
nota2_aluno DOUBLE NOT NULL,
media_aluno DOUBLE,
situacao_aluno VARCHAR(15)
);
#02 Criar uma trigger para gerar a média do aluno automaticamente.
CREATE TRIGGER gerar_media BEFORE INSERT ON alunos FOR EACH ROW
SET NEW.media_aluno = ((new.nota1_aluno + new.nota2_aluno)/2);

#03 Com base na média do aluno, faça uma trigger para retornar a situação do aluno. Caso a média seja 7 ou superior, estará aprovado(a) e caso contrário reprovado(a).
CREATE TRIGGER gerar_situacao BEFORE INSERT ON alunos FOR EACH ROW
SET NEW.situacao_aluno = (IF (new.media_aluno >=7, "Aprovado", "Reprovado"));

INSERT INTO alunos (codigo_aluno, nome_aluno, nota1_aluno, nota2_aluno) VALUES
(1,"Sophia", 10,8),
(2,"Ralf", 5,3);
SELECT * FROM alunos;

#04 Exclua as triggers e em seguida as tabelas.
DROP TRIGGER gerar_media;
DROP TRIGGER gerar_situacao;
DROP TABLE alunos;

#########################################################################

# 01 Criar uma tabela chamada produtos contendo a seguinte estrutura:
CREATE TABLE produtos(
codigo_produto INT PRIMARY KEY AUTO_INCREMENT,
nome_produto VARCHAR(30) NOT NULL,
valor_produto DOUBLE NOT NULL,
valor_promocional DOUBLE
);

#02 Valor promocional de 10%
CREATE TRIGGER gerar_valor_promocional BEFORE INSERT ON produtos FOR EACH ROW
SET NEW.valor_promocional = (NEW.valor_produto * 0.9);

#03 Realize uma inserção, informando o nome do produto e o valor.
INSERT INTO produtos(nome_produto, valor_produto) VALUES
("Barbie", 200),
("Pelúcia do Umbreon", 100);
SELECT * FROM produtos;

#04 Remova a trigger e a tabela.
DROP TRIGGER gerar_valor_promocional;
DROP TABLE produtos;

#########################################################################

#01 Criar uma tabela chamada produtos com a seguinte estrutura
CREATE TABLE produtos(
codigo_produto INT PRIMARY KEY AUTO_INCREMENT,
nome_produto VARCHAR(30),
segmento_produto VARCHAR(20)
);

#02 Crie uma outra tabela chamada qtd_segmentos com a seguinte estrutura:
CREATE TABLE qtd_segmentos(
nome_segmento VARCHAR(30),
quantidade_segmento INT
);
#03
INSERT INTO qtd_segmentos VALUES
("Brinquedo",0);

INSERT INTO produtos VALUES
(null, "Barbie", "Brinquedo");

#04 
CREATE TRIGGER gerar_cadastro AFTER INSERT ON produtos FOR EACH ROW
UPDATE qtd_segmentos SET quantidade_segmento = quantidade_segmento +1 WHERE nome_segmento = NEW.segmento_produto;
SELECT * FROM produtos;
SELECT * FROM qtd_segmentos;

#05 Remove a trigger e as tabelas.
DROP TRIGGER gerar_cadastro;
DROP TABLE produtos;
DROP TABLE qtd_segmentos;