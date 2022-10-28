CREATE DATABASE Atv03;
CREATE TABLE alunos(
nome VARCHAR(40),
turma VARCHAR(10),
nota1 DOUBLE,
nota2 DOUBLE,
nota3 DOUBLE,
turno VARCHAR(10)
);

INSERT INTO alunos VALUES
("Ana Paula", "7A", 5, 8, 7, "Vespertino"),
("Caio Neves","8B", 3,4,2, "Matutino"),
("Isabella Fontana", "7C", 9,8.5,9,"Vespertino"),
("Daniel Luz", "8A", 2,5,4, "Vespertino"),
("Gabriela Braga", "8A", 10,10,10,"Vespertino"),
("Ellen Souza", "7A",5,8,7,"Matutino"),
("Luciana Biltz", "8B",9.5,10,10,"Vespertino"),
("Paulo Almeida","8A", 10,10,10,"Matutino"),
("Carla Malta", "7B",3,7,9,"Matutino"),
("Diogo Andrade", "8C", 10,9,10, "Vespertino"),
("Mônica Mota", "8A", 7,7,8,"Vespertino"),
("Juliana Lima","8C", 9,8,2,"Vespertino"),
("Marcelo Matos", "7A", 9,10,5, "Matutino");
SELECT * FROM alunos;

# 01 Utilizando condicional IF, retorne o nome do aluno, média e a situação (média 7 ou superior aprovado, caso contrário reprovado)
SELECT nome,
IF((nota1 + nota2 + nota3)/3 >= 7, "Aprovado", "Reprovado") AS "Nota média"
FROM alunos;

#02 Exibir a quantidade de alunos por turno, exiba o nome do turno e a quantidade
SELECT turno, COUNT(nome) FROM alunos GROUP BY turno;

#03 Exibir a quantidade de alunos por turma, exiba o nome da turma e a quantidade.
SELECT turma, COUNT(nome) FROM alunos GROUP BY turma;

#04 Nome e média de todos os alunos com média maior ou igual a 7.
SELECT nome, ROUND((nota1 + nota2 + nota3)/3,2) FROM alunos WHERE (nota1 + nota2 + nota3)/3 >= 7;

#05 Quantidade de alunos do turno vespertino reprovados.
SELECT turno, ROUND((nota1 + nota2 + nota3)/3,2) AS "Reprovados Vespertinos" 
FROM alunos WHERE (nota1 + nota2 + nota3)/3 < 7 AND turno = "Vespertino";

#06 Nome de todos os alunos com a maior média.
SELECT nome, ROUND((nota1 + nota2 + nota3)/3,2) 
FROM alunos 
WHERE (nota1 + nota2 + nota3)/3 = (SELECT (nota1 + nota2 + nota3)/3 
FROM alunos 
ORDER BY (nota1 + nota2 + nota3)/3 DESC LIMIT 1);

#07 Exibir a média de cada turma
SELECT turma, ROUND((nota1 + nota2 + nota3)/3,2) AS 'Média' FROM alunos GROUP BY(turma);

#08 Migrar os alunos da 8B para a 8A.
UPDATE alunos SET turma = "8A" WHERE turma = "8B";
SELECT * FROM alunos;

#09 Remover tabela.
DROP TABLE alunos;