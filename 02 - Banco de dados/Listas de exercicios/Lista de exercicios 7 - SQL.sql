CREATE DATABASE Atv07;
CREATE TABLE professores(
codigo_professor INT PRIMARY KEY AUTO_INCREMENT,
nome_professor VARCHAR(20)
);
INSERT INTO professores VALUES
(null, "Larissa"),
(null,"Daniel"),
(null,"Gustavo"),
(null,"Carla"),
(null, "Guilherme"),
(null, "Carina"),
(null, "Lucio"),
(null, "Bianca");

CREATE TABLE cursos(
codigo_curso INT PRIMARY KEY AUTO_INCREMENT,
nome_curso VARCHAR(20),
valor_curso DOUBLE,
codigo_professor INT,
FOREIGN KEY (codigo_professor) REFERENCES professores(codigo_professor)
);
INSERT INTO cursos VALUES
(null, "Java - Básico", 1000,2),
(null, "Java - Avançado", 1250,2),
(null,"Spring Boot",1800,2),
(null, "C#", 1140,7),
(null, "ASP.NET Core",1800,7),
(null, "Python",900,4),
(null, "Flask", 1020,4),
(null, "Django",1400,4),
(null, "PHP", 950,4),
(null, "Laravel", 1600,4),
(null,"Angular",2300,1),
(null, "React",2100,1),
(null,"HTML", 500,8),
(null, "CSS",700,8),
(null, "JavaScript",900,4),
(null, "Banco de dados", 600,3),
(null, "Design Patterns", 2700,8);

CREATE TABLE alunos(
codigo_aluno INT PRIMARY KEY AUTO_INCREMENT,
nome_aluno VARCHAR(20),
nascimento_aluno DATE,
estado_aluno VARCHAR(20),
cidade_aluno VARCHAR(40)
);
CREATE TABLE alunos_cursos(
codigo_aluno INT,
codigo_curso INT,
status_curso VARCHAR(20),
FOREIGN KEY (codigo_aluno) REFERENCES alunos(codigo_aluno),
FOREIGN KEY (codigo_curso) REFERENCES cursos(codigo_curso)
);
