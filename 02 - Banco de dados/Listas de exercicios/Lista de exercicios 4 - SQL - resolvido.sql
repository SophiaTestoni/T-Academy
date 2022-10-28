CREATE DATABASE Atv04;
CREATE TABLE cargos(
	codigo_cargo INT PRIMARY KEY AUTO_INCREMENT,
	nome_cargo VARCHAR(50),
	salario_cargo INT
);
CREATE TABLE colaboradores(
	codigo_colaborador INT PRIMARY KEY AUTO_INCREMENT,
	nome_colaborador VARCHAR(40),
	nascimento_colaborador DATE,
	estado_trabalho VARCHAR(02),
	cidade_trabalho VARCHAR(20),
	genero_colaborador VARCHAR(10),
	codigo_cargo INT,
	foreign key(codigo_cargo) references cargos(codigo_cargo)
);
INSERT INTO cargos VALUES
(null, "Desenvolvedor", 3000),
(null, "Analista", 4500),
(null, "Arquiteto de Software", 6200),
(null, "Administrador de Banco de Dados", 7700),
(null,"Gerente de Projetos", 9000);

INSERT INTO colaboradores VALUES
(null, "Jefferson", "1973-05-19", "SC","Blumenau", "Masculino", "1"),
(null, "Larissa", "1991-01-22", "SC", "Blumenau", "Feminino", "5"),
(null, "Cleber", "1987-03-18", "PR", "Curitiba", "Masculino", "2"),
(null, "Luciano", "1995-08-09", "SC", "Blumenau", "Masculino", "1"),
(null, "Jessica", "1988-08-22", "SC", "Florianópolis", "Feminino", "4"),
(null,"Guilherme", "1982-11-16", "SC", "Blumenau", "Masculino", "2"),
(null,"Marcelo", "1993-04-15", "PR", "Londrina", "Masculino", "2"),
(null,"Brenda", "1992-02-17", "SC", "Joinville", "Feminino", "1"),
(null,"Rebeca", "1984-06-26", "SC", "Blumenau", "Feminino", "4"),
(null,"Cristiano", "1983-07-02", "SC", "Florianópolis", "Masculino", "1"),
(null,"Eder", "1991-11-10", "SC", "Blumenau", "Masculino", "1"),
(null,"William", "1992-12-17", "PR", "Curitiba", "Masculino", "2"),
(null,"Vanessa", "1996-09-29", "SC", "Blumenau", "Feminino", "1"),
(null,"Robson", "1984-05-30", "PR", "Londrina", "Masculino", "1"),
(null, "Tatiana", "1990-02-03", "PR", "Curitiba", "Feminino", "5"),
(null, "Henrique", "1999-10-07", "SC", "Blumenau", "Masculino", "1"),
(null,"Lorena", "1996-04-20", "SC", "Joinville", "Feminino", "1"),
(null,"Carla", "1988-09-28", "PR", "Curitiba", "Feminino", "4"),
(null, "Alexandre", "1982-07-17", "SC", "Blumenau", "Masculino", "2");
SELECT * FROM colaboradores;

#01 Listar o nome do colaborador, nome do cargo e salário.
SELECT colaboradores.nome_colaborador, cargos.nome_cargo, cargos.salario_cargo
FROM colaboradores JOIN cargos ON colaboradores.codigo_cargo = cargos.codigo_cargo
ORDER BY cargos.salario_cargo;

#02 listar todos os cargos (nome) e a quantidade de colaboradores em cada cargo.
SELECT cargos.nome_cargo, COUNT(colaboradores.nome_colaborador)
FROM cargos LEFT JOIN colaboradores ON cargos.codigo_cargo = colaboradores.codigo_cargo
GROUP BY cargos.nome_cargo;

# 03 Média salarial por gênero.
SELECT colaboradores.genero_colaborador, ROUND(AVG(cargos.salario_cargo),2) AS "média salarial"
FROM colaboradores JOIN cargos ON colaboradores.codigo_cargo = cargos.codigo_cargo
GROUP BY colaboradores.genero_colaborador;

#04 Listar o nome e a data de nascimento de todos que possuem idade entre 20 e 30 anos.
SELECT nome_colaborador, date_format(NOW(), "%Y") - date_format(nascimento_colaborador, "%Y")  
FROM colaboradores WHERE date_format(NOW(), "%Y") - date_format(nascimento_colaborador, "%Y") BETWEEN 20 AND 30;

#05 Quantidade de pessoas que trabalham em cada estado.
SELECT estado_trabalho, COUNT(nome_colaborador) AS "Pessoas em cada estado" FROM colaboradores GROUP BY estado_trabalho;

#06 Quantidade de pessoas que trabalham em cada cidade.
SELECT cidade_trabalho, COUNT(nome_colaborador) AS "Pessoas em cada cidade" FROM colaboradores GROUP BY cidade_trabalho;

#07 Quantidade de mulheres com idade superior a 30 anos e que atuam no estado do Paraná.
SELECT genero_colaborador, COUNT(date_format(NOW(), "%Y") - date_format(nascimento_colaborador, "%Y")) AS "Qtd colaboradoras" FROM colaboradores 
WHERE genero_colaborador = "Feminino" AND date_format(NOW(), "%Y") - date_format(nascimento_colaborador, "%Y") > 30 AND estado_trabalho = "PR";

#08 Média dos salários por cidade
SELECT colaboradores.cidade_trabalho, ROUND(AVG(cargos.salario_cargo),2) AS "Média salarial"
FROM colaboradores JOIN cargos ON colaboradores.codigo_cargo = cargos.codigo_cargo
GROUP BY colaboradores.cidade_trabalho;

#09 Média dos salários de todos os colaboradores cadastrados.
SELECT ROUND(AVG(cargos.salario_cargo),2) AS "Média salários"
FROM colaboradores JOIN cargos ON colaboradores.codigo_cargo = cargos.codigo_cargo;

#10 Exibir todos os dados do colaborador mais velho.
SELECT *, MAX(date_format(NOW(), "%Y") - date_format(nascimento_colaborador, "%Y")) AS "Idade" FROM colaboradores;

#11 Exibir a quantidade de pessoas que nasceram na década de 90
SELECT COUNT(nascimento_colaborador) FROM colaboradores WHERE nascimento_colaborador BETWEEN "1990-01-01" AND "1999-12-31";

#12 Excluir a tabela.
DROP TABLE colaboradores;
DROP TABLE cargos;
