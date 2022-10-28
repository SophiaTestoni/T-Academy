CREATE DATABASE AtvViews;
CREATE TABLE breeds( #01
codigo_raca INT PRIMARY KEY AUTO_INCREMENT,
nome_raca VARCHAR(40)
);
INSERT INTO breeds VALUES
(null, "Rottweiller"),
(null, "Great Dane"),
(null,"Maltes"),
(null, "Golden Retriever"),
(null, "Fox Paulistinha");

CREATE TABLE genders( #06
codigo_gender INT PRIMARY KEY AUTO_INCREMENT,
gender_pet VARCHAR(20)
);
INSERT INTO genders VALUES
(null, "Fêmea"),
(null, "Macho");

CREATE TABLE pets( #02
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
(null, "Ozzy", "2014-05-09");

CREATE TABLE coats( #03
codigo_coat INT PRIMARY KEY AUTO_INCREMENT,
tipo_coat VARCHAR(40),
cor_coat VARCHAR(40)
);
INSERT INTO coats VALUES
(null, "Curto", "Escuro"),
(null,"Curto", "Misto"),
(null,"Longo", "Claro"),
(null, "Curto", "Claro");

CREATE TABLE sizes( #04
codigo_size INT PRIMARY KEY AUTO_INCREMENT,
porte_pet VARCHAR(20)
);
INSERT INTO sizes VALUES
(null, "Grande"),
(null,"Pequeno"),
(null, "Médio");

CREATE TABLE tempers( #05
codigo_temper INT PRIMARY KEY AUTO_INCREMENT,
behavior_pet VARCHAR(20),
noisy_pet BOOLEAN
);
INSERT INTO tempers VALUES
(null, "Brabo", 0),
(null, "Brabo",1),
(null, "Mansinho",0),
(null, "Mansinho",1);

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
(2,2,2,2,3,1),
(3,3,4,2,2,2),
(4,4,3,1,3,1),
(5,3,4,1,1,3),
(6,5,2,1,4,3),
(7,3,3,1,4,2),
(8,2,1,1,3,1),
(9,4,3,2,3,1),
(10,1,1,2,1,1);

# Duas views para listar dados de duas tabelas.
CREATE VIEW selecionar_pets_genders AS SELECT pets.nome_pet, genders.gender_pet FROM pet_auxs
JOIN pets ON pets.codigo_pet = pet_auxs.codigo_pet
JOIN genders ON genders.codigo_gender = pet_auxs.codigo_gender;
SELECT * FROM selecionar_pets_genders;

CREATE VIEW selecionar_pets_breeds AS SELECT pets.nome_pet, breeds.nome_raca FROM pet_auxs
JOIN pets ON pets.codigo_pet = pet_auxs.codigo_pet
JOIN breeds ON breeds.codigo_raca = pet_auxs.codigo_raca;
SELECT * FROM selecionar_pets_breeds;

#Três views para listar dados de três tabelas.
CREATE VIEW selecionar_pets_breeds_tempers AS SELECT pets.nome_pet, breeds.nome_raca, tempers.behavior_pet, IF(tempers.noisy_pet = "0", "Quietinho", "Barulhento") FROM pet_auxs
JOIN pets ON pets.codigo_pet = pet_auxs.codigo_pet
JOIN breeds ON breeds.codigo_raca = pet_auxs.codigo_raca
JOIN tempers ON tempers.codigo_temper = pet_auxs.codigo_temper;
SELECT * FROM selecionar_pets_breeds_tempers;

CREATE VIEW selecionar_pets_breeds_sizes AS SELECT pets.nome_pet, breeds.nome_raca, sizes.porte_pet FROM pet_auxs
JOIN pets ON pets.codigo_pet = pet_auxs.codigo_pet
JOIN breeds ON breeds.codigo_raca = pet_auxs.codigo_raca
JOIN sizes ON sizes.codigo_size = pet_auxs.codigo_size
ORDER BY pets.nome_pet;
SELECT * FROM selecionar_pets_breeds_sizes;

CREATE VIEW selecionar_coat_genders_breeds AS SELECT COUNT(breeds.nome_raca) AS "Caracteristicas raças", coats.cor_coat, sizes.porte_pet FROM pet_auxs
JOIN breeds ON breeds.codigo_raca = pet_auxs.codigo_raca
JOIN coats ON coats.codigo_coat = pet_auxs.codigo_coat
JOIN sizes ON sizes.codigo_size = pet_auxs.codigo_size
GROUP BY breeds.nome_raca;
SELECT * FROM selecionar_coat_genders_breeds;

# Duas views para listar dados de cinco tabelas.
CREATE VIEW selecionar_pets_breeds_genders_tempers_sizes AS SELECT pets.nascimento_pet, breeds.nome_raca, genders.gender_pet, tempers.behavior_pet, sizes.porte_pet FROM pet_auxs
JOIN pets ON pets.codigo_pet = pet_auxs.codigo_pet
JOIN breeds ON breeds.codigo_raca = pet_auxs.codigo_raca
JOIN tempers ON tempers.codigo_temper = pet_auxs.codigo_temper
JOIN genders ON genders.codigo_gender = pet_auxs.codigo_gender
JOIN sizes ON sizes.codigo_size = pet_auxs.codigo_size
WHERE tempers.behavior_pet = "Mansinho" AND sizes.porte_pet = "Grande";
SELECT * FROM selecionar_pets_breeds_genders_tempers_sizes;

CREATE VIEW selecionar_breeds_tempers_genders_coats_sizes AS SELECT breeds.nome_raca, genders.gender_pet, coats.tipo_coat, sizes.porte_pet, 
IF(tempers.noisy_pet = "0", "Quietinho", "Barulhento") FROM pet_auxs
JOIN breeds ON breeds.codigo_raca = pet_auxs.codigo_raca
JOIN genders ON genders.codigo_gender = pet_auxs.codigo_gender
JOIN coats ON coats.codigo_coat = pet_auxs.codigo_coat
JOIN sizes ON sizes.codigo_size = pet_auxs.codigo_size
JOIN tempers ON tempers.codigo_temper = pet_auxs.codigo_temper;
SELECT * FROM selecionar_breeds_tempers_genders_coats_sizes;

# Três views para listar dados de 7 tabelas.
CREATE VIEW selecionar_tudo AS SELECT pets.nome_pet, breeds.nome_raca, coats.tipo_coat, genders.gender_pet, tempers.behavior_pet, sizes.porte_pet FROM pet_auxs
JOIN pets ON pets.codigo_pet = pet_auxs.codigo_pet
JOIN breeds ON breeds.codigo_raca = pet_auxs.codigo_raca
JOIN coats ON coats.codigo_coat = pet_auxs.codigo_coat
JOIN genders ON genders.codigo_gender = pet_auxs.codigo_gender
JOIN tempers ON tempers.codigo_temper = pet_auxs.codigo_temper
JOIN sizes ON sizes.codigo_size = pet_auxs.codigo_size
ORDER BY pets.nome_pet;
SELECT * FROM selecionar_tudo;

CREATE VIEW selecionar_tudo2 AS SELECT pets.nascimento_pet, breeds.nome_raca, coats.cor_coat, genders.gender_pet, sizes.porte_pet, 
IF(tempers.noisy_pet = "0", "Quietinho", "Barulhento") AS "Comportamento" FROM pet_auxs
JOIN pets ON pets.codigo_pet = pet_auxs.codigo_pet
JOIN breeds ON breeds.codigo_raca = pet_auxs.codigo_raca
JOIN coats ON coats.codigo_coat = pet_auxs.codigo_coat
JOIN genders ON genders.codigo_gender = pet_auxs.codigo_gender
JOIN tempers ON tempers.codigo_temper = pet_auxs.codigo_temper
JOIN sizes ON sizes.codigo_size = pet_auxs.codigo_size;
SELECT * FROM selecionar_tudo2;

CREATE VIEW selecionar_tudo3 AS SELECT pets.nome_pet, nascimento_pet, breeds.nome_raca, coats.tipo_coat, coats.cor_coat, genders.gender_pet, sizes.porte_pet, 
tempers.behavior_pet, IF(tempers.noisy_pet = "0", "Quietinho", "Barulhento") AS "Comportamento" FROM pet_auxs
JOIN pets ON pets.codigo_pet = pet_auxs.codigo_pet
JOIN breeds ON breeds.codigo_raca = pet_auxs.codigo_raca
JOIN coats ON coats.codigo_coat = pet_auxs.codigo_coat
JOIN genders ON genders.codigo_gender = pet_auxs.codigo_gender
JOIN tempers ON tempers.codigo_temper = pet_auxs.codigo_temper
JOIN sizes ON sizes.codigo_size = pet_auxs.codigo_size;
SELECT * FROM selecionar_tudo3;