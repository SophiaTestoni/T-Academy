CREATE DATABASE Atv06;
CREATE TABLE professores(
codigo_professor INT PRIMARY KEY AUTO_INCREMENT,
nome_professor VARCHAR(20)
);
INSERT INTO professores VALUES
(null,"Renato"),
(null,"Oscar"),
(null,"Catia"),
(null,"Osvaldo"),
(null,"Marilia"),
(null,"Paula"),
(null,"Otavio"),
(null,"Airton");

CREATE TABLE materias(
codigo_materia INT PRIMARY KEY AUTO_INCREMENT,
codigo_professor INT,
FOREIGN KEY(codigo_professor) REFERENCES professores(codigo_professor),
nome_materia VARCHAR(20)
);
INSERT INTO materias VALUES
(null, 1, "Matemática"),
(null, 2, "Geografia"),
(null, 7, "Quimica"),
(null, 6, "Filosofia"),
(null, 1, "Física"),
(null, 3, "Português"),
(null, 3, "Inglês"),
(null, 6, "Sociologia"),
(null, 5, "Português"),
(null, 4, "História"),
(null, 4, "Sociologia"),
(null, 5,"Espanhol"),
(null, 8, "Biologia"),
(null, 8,"Quimica");

CREATE TABLE turmas(
codigo_turma INT PRIMARY KEY AUTO_INCREMENT,
nome_turma VARCHAR(2),
turno_turma VARCHAR(10)
);
INSERT INTO turmas VALUES
(null, "6A", "Matutino"),
(null, "6B", "Vespertino"),
(null, "7A", "Matutino"),
(null, "7A", "Vespertino"),
(null, "8A", "Matutino"),
(null, "8B", "Vespertino");

CREATE TABLE alunos(
codigo_aluno INT PRIMARY KEY AUTO_INCREMENT,
nome_aluno VARCHAR(30)
);
INSERT INTO alunos VALUES
(null, "Alessandra"),
(null, "Emanuela"), 
(null, "Cintia"),
(null, "Diego"),
(null, "Eduardo"),
(null, "Larissa"),
(null, "Jonathan"), 
(null, "Cleber"),
(null, "Jessica"),
(null, "Lucas"),
(null, "Murilo"),
(null, "Marcelo"),
(null, "Rebeca"),
(null, "Tatiana"),
(null, "Tais"),
(null, "Gabriel"),
(null, "Felipe"),
(null, "Eliza"),
(null, "Sarah"),
(null, "Patricia");

CREATE TABLE alunos_turmas(
codigo_aluno INT,
codigo_materia INT,
codigo_turma INT,
FOREIGN KEY(codigo_aluno) REFERENCES alunos(codigo_aluno),
FOREIGN KEY(codigo_materia) REFERENCES materias(codigo_materia),
FOREIGN KEY(codigo_turma) REFERENCES turmas(codigo_turma)
);
INSERT INTO alunos_turmas VALUES
(1,1,1),
(2,5,1),
(3,10,2),
(4,14,1),
(5,1,1),
(6,2,6),
(7,3,2),
(8,6,3),
(9,5,4),
(10,4,4),
(11,1,5),
(12,5,2),
(13,8,3),
(14,13,6),
(15,6,5),
(16,14,3),
(17,9,5),
(18,3,1),
(19,8,4),
(20,5,6),
(4,10,3), 
(15,2,1),
(12,10,1),
(9,8,6);
SELECT * FROM alunos_turmas;

#01 Exibir o nome do aluno, nome da matéria e nome da turma.
SELECT alunos.nome_aluno, materias.nome_materia, turmas.nome_turma FROM alunos_turmas
JOIN turmas ON turmas.codigo_turma = alunos_turmas.codigo_turma
JOIN alunos ON alunos.codigo_aluno = alunos_turmas.codigo_aluno
JOIN materias ON materias.codigo_materia = alunos_turmas.codigo_aluno;

#02 Nome de cada professor e matéria que leciona.
SELECT professores.nome_professor, materias.nome_materia FROM alunos_turmas
JOIN professores ON professores.codigo_professor = alunos_turmas.codigo_aluno
JOIN materias ON materias.codigo_materia = alunos_turmas.codigo_aluno;

#03 Quantidade de alunos em cada turma.
SELECT COUNT(alunos.nome_aluno), turmas.nome_turma FROM alunos_turmas
JOIN alunos ON alunos.codigo_aluno = alunos_turmas.codigo_aluno
JOIN turmas ON turmas.codigo_turma = alunos_turmas.codigo_turma
GROUP BY turmas.nome_turma;

#04 Quantidade de alunos por turno.
SELECT COUNT(alunos.nome_aluno), turmas.turno_turma FROM alunos_turmas
JOIN alunos ON alunos.codigo_aluno = alunos_turmas.codigo_aluno
JOIN turmas ON turmas.codigo_turma = alunos_turmas.codigo_turma
GROUP BY turmas.turno_turma;

#05 Listar todos os alunos (nome do aluno), turma e matéria, onde o professor Renato leciona
SELECT alunos.nome_aluno, turmas.nome_turma, materias.nome_materia, professores.nome_professor FROM alunos_turmas
JOIN alunos ON alunos.codigo_aluno = alunos_turmas.codigo_aluno
JOIN turmas ON turmas.codigo_turma = alunos_turmas.codigo_turma
JOIN materias ON materias.codigo_materia = alunos_turmas.codigo_materia
JOIN professores ON professores.codigo_professor = materias.codigo_professor
WHERE professores.nome_professor = "Renato" GROUP BY alunos.nome_aluno;

#06 Listar o nome de todos os professores que lecionam química.
SELECT professores.nome_professor, materias.nome_materia FROM materias
JOIN professores ON professores.codigo_professor = materias.codigo_professor
WHERE materias.nome_materia = "Quimica" GROUP BY professores.nome_professor;

#07 Quais alunos estão cadastrados na matéria de história?
SELECT alunos.nome_aluno, materias.nome_materia FROM alunos_turmas
JOIN alunos ON alunos.codigo_aluno = alunos_turmas.codigo_aluno
JOIN materias ON materias.codigo_materia = alunos_turmas.codigo_materia
WHERE materias.nome_materia = "História";

#08 Nome do professor que leciona as matérias de português e inglês.
SELECT professores.nome_professor FROM professores
JOIN materias ON professores.codigo_professor = materias.codigo_professor
WHERE materias.nome_materia = "Português" OR materias.nome_materia = "Inglês" HAVING COUNT(professores.codigo_professor) > 1;

#09 Quantidade de alunos matriculados por matéria
SELECT COUNT(alunos.nome_aluno), materias.nome_materia FROM alunos_turmas
JOIN alunos ON alunos.codigo_aluno = alunos_turmas.codigo_aluno
JOIN materias ON materias.codigo_materia = alunos_turmas.codigo_materia
GROUP BY alunos.nome_aluno;

#10 Quais são os alunos que têm aula com a professor Cátia da matéria de inglês?
SELECT COUNT(alunos.nome_aluno) FROM alunos_turmas
JOIN alunos ON alunos.codigo_aluno = alunos_turmas.codigo_aluno
JOIN materias ON materias.codigo_materia = alunos_turmas.codigo_materia
JOIN professores ON professores.codigo_professor = materias.codigo_professor
WHERE professores.nome_professor = "Catia" AND materias.nome_materia = "Inglês";

#11 Quantidade de alunos da turma 6A que tem aula de matemática com o professor Renato?
SELECT COUNT(alunos.nome_aluno) AS "alunos 6A com prof Renato" FROM alunos_turmas
JOIN alunos ON alunos.codigo_aluno = alunos_turmas.codigo_aluno
JOIN turmas ON turmas.codigo_turma = alunos_turmas.codigo_turma
JOIN materias ON materias.codigo_materia = alunos_turmas.codigo_materia
JOIN professores ON professores.codigo_professor = materias.codigo_professor
WHERE turmas.nome_turma = "6A" AND professores.nome_professor = "Renato";

#12 Exiba quais matérias o professor Airton leciona.
SELECT materias.nome_materia AS "Materias prof. Airton" FROM materias
JOIN professores ON materias.codigo_professor = professores.codigo_professor
WHERE professores.nome_professor = "Airton";

#13 Quantidade de alunos no período vespertino que estão tendo aula de biologia.
SELECT COUNT(alunos.nome_aluno) AS "Aluno(s) vespertino aula Biologia" FROM alunos_turmas
JOIN alunos ON alunos.codigo_aluno = alunos_turmas.codigo_aluno
JOIN materias ON materias.codigo_materia = alunos_turmas.codigo_materia
JOIN turmas ON turmas.codigo_turma = alunos_turmas.codigo_turma
WHERE turmas.turno_turma = "Vespertino" AND materias.nome_materia = "Biologia";

#14 Remover todas as tabelas.
DROP TABLE professores;
DROP TABLE materias;
DROP TABLE turmas;
DROP TABLE alunos;
DROP TABLE alunos_turmas;