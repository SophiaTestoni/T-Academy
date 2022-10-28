CREATE DATABASE AtvAvaliativa;
CREATE TABLE breeds(
codigo_raca INT PRIMARY KEY AUTO_INCREMENT,
nome_raca VARCHAR(40)
);
INSERT INTO breeds VALUES
(null, "Rottweiller"),
(null, "Great Dane"),
(null, "Maltes"),
(null, "Golden Retriever"),
(null, "Fox Paulistinha"),
(null, "Pastor Alemão"),
(null, "Husky Siberiano"),
(null, "Border Collie"),
(null, "Bulldog"),
(null, "Chow Chow");

# Insert de BREEDs - Procedure
DELIMITER $$
CREATE PROCEDURE sp_insertbreed
(IN nome_pet VARCHAR(40))
BEGIN
INSERT INTO breeds values(null,nome_raca);
END $$ 
DELIMITER ;

# UPDATE BREEDs - Procedure
DELIMITER $$
CREATE PROCEDURE sp_updatebreed
(IN ID_breed INT, IN novo_breed VARCHAR(40))
BEGIN
UPDATE breed SET nome_raca = novo_breed WHERE codigo_raca = ID_breed;
END $$ 
DELIMITER ;

# DELETE de BREEDs - Procedure
DELIMITER $$
CREATE PROCEDURE sp_deletebreed
(IN ID_raca INT)
BEGIN
DELETE FROM breeds WHERE nome_raca = ID_raca ;
END $$ 
DELIMITER ;

CREATE TABLE genders(
codigo_gender INT PRIMARY KEY AUTO_INCREMENT,
gender_pet VARCHAR(20)
);
INSERT INTO genders VALUES
(null, "Fêmea"),
(null, "Macho");

CREATE TABLE pets(
codigo_pet INT PRIMARY KEY AUTO_INCREMENT,
nome_pet VARCHAR(40),
nascimento_pet DATE
);
INSERT INTO pets VALUES
(null, "Atena", "2005-01-26"), 
(null, "Richard", "2017-09-15"),
(null, "Adalberto", "2020-04-25"),
(null, "Madame", "2015-01-22"),
(null, "Luna","2020-02-18"),
(null, "Rebecca", "2021-10-14"),
(null, "Pink", "2021-03-19"),
(null, "Galadriel","2007-08-05"),
(null, "Rodolfo", "2008-07-07"),
(null, "Ozzy", "2014-05-09"),
(null, "Boris", "2015-10-27"),
(null, "Cassandra", "2017-11-13"),
(null, "Onyxia", "2020-01-22"),
(null, "Sarinha", "2022-10-02"),
(null, "Rex", "2019-12-25"),
(null, "Scooby", "2016-02-24"),
(null, "Nina", "2021-03-12"),
(null, "Cookie", "2014-05-07"),
(null, "Lili", "2022-06-21"),
(null, "Suri", "2008-04-12");

# Insert de PETs - Procedure
DELIMITER $$
CREATE procedure sp_insertpets
(IN nome_pet VARCHAR(40),
in nascimento_pet DATE)
begin
insert into pets values(null,nome_pet,nascimento,pet);
END $$ 
DELIMITER ;

# UPDATE de nome de PETs - Procedure
DELIMITER $$
CREATE PROCEDURE sp_updatepets
(IN ID_pet INT, IN novo_pet VARCHAR(40))
BEGIN
UPDATE pets SET nome_pet = novo_pet WHERE codigo_pet = ID_pet ;
END $$ 
DELIMITER ;

# DELETE de PETs - Procedure
DELIMITER $$
CREATE PROCEDURE sp_updatepets
(IN ID_pet INT)
BEGIN
DELETE FROM pets WHERE codigo_pet = ID_pet ;
END $$ 
DELIMITER ;

CREATE TABLE doencas(
codigo_doenca INT PRIMARY KEY AUTO_INCREMENT,
nome_doenca VARCHAR(20),
periculosidade_doenca INT DEFAULT 1
);
INSERT INTO doencas VALUES
(null, "Cinomose",3),
(null, "Gripe Canina", 1),
(null, "Raiva",3),
(null, "Envenamento",2),
(null, "Otite",1),
(null, "Dermatite",2),
(null, "Alergia alimentar",2),
(null, "Doença do carrapato",1),
(null, "Insuficiência renal",3),
(null, "Obesidade",2);

# Insert Doenças - Procedure
DELIMITER $$
CREATE PROCEDURE sp_insertdoenca
(IN nome_doenca VARCHAR(20), IN periculosidade_doenca INT)
BEGIN
INSERT INTO doencas VALUES(null,nome_doenca,periculosidade_doenca);
END $$ 
DELIMITER ;

# UPDATE Doenças - Procedure
DELIMITER $$
CREATE PROCEDURE sp_updatedoenca
(IN ID_doenca INT, IN nova_doenca VARCHAR(20), IN nova_periculosidade_doenca INT)
BEGIN
UPDATE doencas SET nome_doenca = nova_doenca AND periculosidade_doenca = nova_periculosidade_doenca WHERE codigo_doenca = ID_doenca ;
END $$ 
DELIMITER ;

# DELETE de Doenças - Procedure
DELIMITER $$
CREATE PROCEDURE sp_deletedoenca
(IN ID_doenca INT)
BEGIN
DELETE FROM doencas WHERE codigo_doenca = ID_doenca ;
END $$ 
DELIMITER ;

CREATE TABLE pet_doencas(
codigo_doenca INT,
codigo_pet INT,
FOREIGN KEY(codigo_doenca) REFERENCES doencas(codigo_doenca),
FOREIGN KEY(codigo_pet) REFERENCES pets(codigo_pet)
);
INSERT INTO pet_doencas VALUES
(1,7),
(2,8),
(3,9),
(4,3),
(5,9),
(6,4),
(7,11),
(8,15),
(9,18),
(10,17);

#Insert de PET com DOENÇA - Procedure
DELIMITER $$
CREATE PROCEDURE sp_insertpet_doencas
(IN codigo_doenca INT, IN codigo_pet INT)
BEGIN
INSERT INTO pet_doencas VALUES(codigo_doenca,codigo_pet);
END $$ 
DELIMITER ;

# UPDATE Doenças - Procedure
DELIMITER $$
CREATE PROCEDURE sp_updatepet_doencas
(IN ID_pet_doenca INT, IN novo_codigo_pet INT)
BEGIN
UPDATE pet_doencas SET codigo_pet = novo_codigo_pet WHERE codigo_doenca = ID_pet_doenca;
END $$ 
DELIMITER ;

# DELETE de Doenças - Procedure
DELIMITER $$
CREATE PROCEDURE sp_deletepet_doencas
(IN ID_pet_doenca INT)
BEGIN
DELETE FROM pet_doencas WHERE codigo_doenca = ID_pet_doenca;
END $$ 
DELIMITER ;

CREATE TABLE coats( 
codigo_coat INT PRIMARY KEY AUTO_INCREMENT,
tipo_coat VARCHAR(40),
cor_coat VARCHAR(40)
);
INSERT INTO coats VALUES
(null, "Curto", "Escuro"),
(null,"Curto", "Misto"),
(null, "Curto", "Claro"),
(null,"Longo", "Claro"),
(null, "Longo", "Escuro"),
(null, "Longo", "Misto"),
(null, "Médio", "Escuro"),
(null, "Médio", "Claro"),
(null, "Médio", "Misto"),
(null, "Crespo", "Escuro"),
(null, "Crespo", "Claro"),
(null, "Crespo", "Misto");

#INSERT de COAT - Procedure
DELIMITER $$
CREATE PROCEDURE sp_insertcoats
(IN tipo_coat VARCHAR(40), IN cor_coat VARCHAR(40))
BEGIN
INSERT INTO coats VALUES(null, tipo_coat,cor_coat);
END $$ 
DELIMITER ;

# UPDATE COAT - Procedure
DELIMITER $$
CREATE PROCEDURE sp_updatecoats
(IN novo_codigo_coat INT, IN novo_tipo_coat VARCHAR(40), IN nova_cor_coat VARCHAR(40))
BEGIN
UPDATE coats SET tipo_coat = novo_tipo_coat AND cor_coat = nova_cor_coat WHERE codigo_coat = novo_codigo_coat;
END $$ 
DELIMITER ;

# DELETE COAT - Procedure
DELIMITER $$
CREATE PROCEDURE sp_deletecoats
(IN ID_codigo_coat INT)
BEGIN
DELETE FROM coats WHERE codigo_coat = ID_codigo_coat;
END $$ 
DELIMITER ;

CREATE TABLE sizes( 
codigo_size INT PRIMARY KEY AUTO_INCREMENT,
porte_pet VARCHAR(20)
);
INSERT INTO sizes VALUES
(null, "Grande"),
(null,"Pequeno"),
(null, "Médio"),
(null, "Extragrande"),
(null, "Mini"),
(null, "Bulk");

#INSERT de SIZE - Procedure
DELIMITER $$
CREATE PROCEDURE sp_insertsize
(IN porte_pet VARCHAR(20))
BEGIN
INSERT INTO sizes VALUES(null, porte_pet);
END $$ 
DELIMITER ;

# UPDATE SIZE - Procedure
DELIMITER $$
CREATE PROCEDURE sp_updatesize
(IN novo_size INT, IN novo_porte_pet VARCHAR(20))
BEGIN
UPDATE sizes SET porte_pet = novo_porte_pet WHERE codigo_size = novo_size;
END $$ 
DELIMITER ;

# DELETE SIZE - Procedure
DELIMITER $$
CREATE PROCEDURE sp_deletesize
(IN ID_codigo_size INT)
BEGIN
DELETE FROM sizes WHERE codigo_size = ID_codigo_size;
END $$ 
DELIMITER ;

CREATE TABLE tempers( 
codigo_temper INT PRIMARY KEY AUTO_INCREMENT,
behavior_pet VARCHAR(20),
noisy_pet BOOLEAN
);
INSERT INTO tempers VALUES
(null, "Brabo", 0),
(null, "Brabo",1),
(null, "Mansinho",0),
(null, "Mansinho",1),
(null, "Dorminhoco",0),
(null, "Dorminhoco",1),
(null, "Agitado",0),
(null, "Agitado",1),
(null, "Carente",0),
(null, "Carente",1);

#INSERT de tempers - Procedure
DELIMITER $$
CREATE PROCEDURE sp_inserttemper
(IN behavior_pet VARCHAR(20), IN noisy_pet BOOLEAN)
BEGIN
INSERT INTO tempers VALUES(null, behavior_pet,noisy_pet);
END $$ 
DELIMITER ;

# UPDATE SIZE - Procedure
DELIMITER $$
CREATE PROCEDURE sp_updatetemper
(IN novo_temper INT, IN novo_behavior_pet VARCHAR(20), IN novo_noisy_pet BOOLEAN)
BEGIN
UPDATE tempers SET behavior_pet = novo_behavior_pet AND noisy_pet = novo_noisy_pet WHERE codigo_temper = novo_temper;
END $$ 
DELIMITER ;

# DELETE SIZE - Procedure
DELIMITER $$
CREATE PROCEDURE sp_deletetemper
(IN ID_codigo_temper INT)
BEGIN
DELETE FROM tempers WHERE codigo_size = ID_codigo_temper;
END $$ 
DELIMITER ;

CREATE TABLE pet_auxs( #07
codigo_pet INT,
codigo_raca INT,
codigo_coat INT,
codigo_gender INT,
codigo_temper INT,
codigo_size INT,
FOREIGN KEY(codigo_pet) REFERENCES pets(codigo_pet),
FOREIGN KEY(codigo_raca) REFERENCES breeds(codigo_raca),
FOREIGN KEY(codigo_gender) REFERENCES genders(codigo_gender),
FOREIGN KEY(codigo_coat) REFERENCES coats(codigo_coat),
FOREIGN KEY(codigo_temper) REFERENCES tempers(codigo_temper),
FOREIGN KEY(codigo_size) REFERENCES sizes(codigo_size)
);
INSERT INTO pet_auxs VALUES
(1,1,1,1,2,1),
(2,2,1,2,3,4),
(3,3,4,2,2,2),
(4,4,3,1,3,1),
(5,3,4,1,1,3),
(6,5,2,1,4,3),
(7,3,3,1,4,2),
(8,2,1,1,3,1),
(9,4,3,2,3,1),
(10,1,1,2,1,1),
(11,8,9,2,4,3),
(12,7,3,1,7,6),
(13,4,4,1,7,4),
(14,9,11,1,6,6),
(15,6,2,2,10,3),
(16,2,3,2,5,4),
(17,3,11,1,6,5),
(18,10,8,2,2,3),
(19,7,6,1,8,3),
(20,1,9,1,7,1);

# GROUP BY / ORDER BY / Necessário pelo menos DOIS inner joins contemplando duas tabelas;
CREATE VIEW selecionar_pets_genders AS SELECT pets.nome_pet, genders.gender_pet FROM pet_auxs
INNER JOIN pets ON pets.codigo_pet = pet_auxs.codigo_pet
INNER JOIN genders ON genders.codigo_gender = pet_auxs.codigo_gender;
SELECT * FROM selecionar_pets_genders;

CREATE VIEW selecionar_pets_breeds AS SELECT pets.nome_pet, breeds.nome_raca FROM pet_auxs
INNER JOIN pets ON pets.codigo_pet = pet_auxs.codigo_pet
INNER JOIN breeds ON breeds.codigo_raca = pet_auxs.codigo_raca
ORDER BY pets.nome_pet;
SELECT * FROM selecionar_pets_breeds;

# Necessário pelo menos mais DOIS inner joins contemplando três tabelas;
CREATE VIEW selecionar_pets_breeds_tempers AS SELECT pets.nome_pet, breeds.nome_raca, tempers.behavior_pet, IF(tempers.noisy_pet = "0", "Quietinho", "Barulhento") FROM pet_auxs
INNER JOIN pets ON pets.codigo_pet = pet_auxs.codigo_pet
INNER JOIN breeds ON breeds.codigo_raca = pet_auxs.codigo_raca
INNER JOIN tempers ON tempers.codigo_temper = pet_auxs.codigo_temper;
SELECT * FROM selecionar_pets_breeds_tempers;

CREATE VIEW selecionar_coat_genders_breeds AS SELECT COUNT(breeds.nome_raca) AS "Caracteristicas raças", coats.cor_coat, sizes.porte_pet FROM pet_auxs
INNER JOIN breeds ON breeds.codigo_raca = pet_auxs.codigo_raca
INNER JOIN coats ON coats.codigo_coat = pet_auxs.codigo_coat
INNER JOIN sizes ON sizes.codigo_size = pet_auxs.codigo_size
GROUP BY breeds.nome_raca;
SELECT * FROM selecionar_coat_genders_breeds;

# Necessário pelo menos UM inner join contemplando cinco tabelas ou mais.
CREATE VIEW selecionar_pets_breeds_genders_tempers_sizes AS SELECT pets.nascimento_pet, breeds.nome_raca, genders.gender_pet,
tempers.behavior_pet, sizes.porte_pet FROM pet_auxs
JOIN pets ON pets.codigo_pet = pet_auxs.codigo_pet
JOIN breeds ON breeds.codigo_raca = pet_auxs.codigo_raca
JOIN tempers ON tempers.codigo_temper = pet_auxs.codigo_temper
JOIN genders ON genders.codigo_gender = pet_auxs.codigo_gender
JOIN sizes ON sizes.codigo_size = pet_auxs.codigo_size
WHERE tempers.behavior_pet = "Mansinho" AND sizes.porte_pet = "Grande";
SELECT * FROM selecionar_pets_breeds_genders_tempers_sizes;

# Criar uma view com Left Join;
CREATE VIEW selecionar_pets_breeds_sizes AS SELECT pets.nome_pet, breeds.nome_raca, sizes.porte_pet FROM pet_auxs
LEFT JOIN pets ON pets.codigo_pet = pet_auxs.codigo_pet
LEFT JOIN breeds ON breeds.codigo_raca = pet_auxs.codigo_raca
LEFT JOIN sizes ON sizes.codigo_size = pet_auxs.codigo_size
ORDER BY pets.nome_pet;
SELECT * FROM selecionar_pets_breeds_sizes;

# Criar uma view com Right Join;
CREATE VIEW selecionar_varios AS SELECT pets.nascimento_pet, breeds.nome_raca, coats.cor_coat, genders.gender_pet, sizes.porte_pet, 
IF(tempers.noisy_pet = "0", "Quietinho", "Barulhento") AS "Comportamento" FROM pet_auxs
RIGHT JOIN pets ON pets.codigo_pet = pet_auxs.codigo_pet
RIGHT JOIN breeds ON breeds.codigo_raca = pet_auxs.codigo_raca
RIGHT JOIN coats ON coats.codigo_coat = pet_auxs.codigo_coat
RIGHT JOIN genders ON genders.codigo_gender = pet_auxs.codigo_gender
RIGHT JOIN tempers ON tempers.codigo_temper = pet_auxs.codigo_temper
RIGHT JOIN sizes ON sizes.codigo_size = pet_auxs.codigo_size;
SELECT * FROM selecionar_varios;

#CASE / OR - Verificar o que é ideal para adoção
SELECT p.nome_pet, s.porte_pet,
CASE WHEN s.porte_pet = "Grande" OR "Extragrande" THEN "Casa sem crianças pequenas"
WHEN s.porte_pet  = "Médio" THEN 'Casa ou apartamento'
ELSE "Apartamento, idosos e crianças"
END AS IndicacaoAdocao
FROM pets p INNER JOIN pet_auxs pa ON p.codigo_pet = pa.codigo_pet
			INNER JOIN sizes s ON s.codigo_size = pa.codigo_size;
            
# DATE_FORMAT / NOW / BETWEEN - Idade de cachorros entre 5 e 15 anos.
SELECT nome_pet, date_format(NOW(), "%Y") - date_format(nascimento_pet, "%Y") AS "Idade do doguinho"
FROM pets WHERE date_format(NOW(), "%Y") - date_format(nascimento_pet, "%Y") BETWEEN 5 AND 15;

# SUB-QUERY MAX / MIN / ORDER BY - Nome do cachorro mais velho e do cachorro mais novo
SELECT nome_pet, date_format(NOW(), "%Y") - date_format(nascimento_pet, "%Y") AS "Idade cachorrinho idoso" FROM pets WHERE date_format(NOW(), "%Y") - date_format(nascimento_pet, "%Y") = (SELECT MAX(date_format(NOW(), "%Y") - date_format(nascimento_pet, "%Y")) 
FROM pets);

SELECT nome_pet, date_format(NOW(), "%Y") - date_format(nascimento_pet, "%Y") AS "Idade cachorrinho nenem" FROM pets WHERE date_format(NOW(), "%Y") - date_format(nascimento_pet, "%Y") = (SELECT MIN(date_format(NOW(), "%Y") - date_format(nascimento_pet, "%Y")) 
FROM pets) ORDER BY nome_pet;

# LIKE - Nome de cachorros iniciados com A
SELECT nome_pet FROM pets WHERE nome_pet LIKE "A%";

# Implementar o uso de pelo menos duas triggers:
CREATE TRIGGER gerar_pet AFTER INSERT ON pets FOR EACH ROW
UPDATE nome_raca SET nome_pet = nome_pet +1 WHERE nome_raca = NEW.nome_pet; 
SELECT * FROM pets;
SELECT * FROM breeds;

CREATE TRIGGER gerar_doenca AFTER INSERT ON pet_doencas FOR EACH ROW
UPDATE nome_doenca SET codigo_doenca = codigo_doenca +1 WHERE nome_doenca = NEW.codigo_doenca; 
SELECT * FROM pet_doencas;
SELECT * FROM doencas;

# OR / HAVING - Qual o nome do cachorro que é um Rottweiller e nasceu em 2005-01-26
SELECT pets.nome_pet FROM pet_auxs
JOIN breeds ON breeds.codigo_raca = pet_auxs.codigo_raca
JOIN pets ON pets.codigo_pet = pet_auxs.codigo_pet
WHERE breeds.nome_raca = "Rottweiller" OR pets.nascimento_pet = "2005-01-26" HAVING COUNT(breeds.codigo_raca) > 1;

