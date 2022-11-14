create database spring_security;

#Inserir tipos de usuários
INSERT INTO tb_roles VALUES
(null, "ROLE_ADMIN"),
(null, "ROLE_USER");

#Inserir os usuários
INSERT INTO tb_users VALUES
(null, "Sophia", "$2a$10$LjtqNLOzB.S8muVsNAZL1uhIZESmMKqSuSQm8hwwPFbC5JVK1YBkW"),
(null, "Ronaldo", "$2a$10$LoSrRzADFMab59nZ5DjmvO60.LsN7zILWQm6l1OLFYGFj4sLKxjoa");

#Especificar usuário e o nível
INSERT INTO tb_users_role VALUES
(1,1),
(2,2);

#Selecionar dados
SELECT * FROM tb_roles;
SELECT * FROM tb_users;
SELECT * FROM tb_users_role;


