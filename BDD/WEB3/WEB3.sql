CREATE DATABASE WEB3;

USE WEB3;

CREATE TABLE CATEGORIA(
CODCATEG int IDENTITY(1,1),
NOME varchar(40),
DESCRICAO varchar(150),
PRIMARY KEY (CODCATEG));

CREATE TABLE PRODUTO(
CODBARRAS int,
CODCATEG int,
NOME varchar(40),
DESCRICAO varchar(150),
PRECO_UNITARIO money,
FOREIGN KEY (CODCATEG) REFERENCES CATEGORIA(CODCATEG),
PRIMARY KEY (CODBARRAS));

/*--------------------------------SELECTS---------------------------------*/

SELECT * FROM CATEGORIA;
SELECT * FROM PRODUTO;

/*--------------------------------INSERTS---------------------------------*/

INSERT INTO CATEGORIA (NOME, DESCRICAO) VALUES ('CARNES', 'APENAS CARNES');
INSERT INTO CATEGORIA (NOME, DESCRICAO) VALUES ('FRUTAS', 'APENAS FRUTAS');
INSERT INTO CATEGORIA (NOME, DESCRICAO) VALUES ('CHOCOLATES', 'APENAS CHOCOLATES');
INSERT INTO CATEGORIA (NOME, DESCRICAO) VALUES ('REFRIGERANTE', 'APENAS REFRIGERANTES');
INSERT INTO CATEGORIA (NOME, DESCRICAO) VALUES ('CERVEJA', 'APENAS CERVEJAS');

INSERT INTO PRODUTO VALUES (-1, 1, 'Filé de Frango', '1 Kg de filé de frango congelado', 25.50)
INSERT INTO PRODUTO VALUES (0, 1, 'Costela bovina', '1 Kg de costela bovina congelada', 34.00)
INSERT INTO PRODUTO VALUES (1, 2, 'Banana prata', 'Valor Kg da banana prata', 2.00)
INSERT INTO PRODUTO VALUES (2, 3, 'Kit Kat dark', 'Unidade de Kit Kat dark', 2.50)
INSERT INTO PRODUTO VALUES (3, 4, 'Guaraná 1,5L', 'Guaraná Antarctica 1,5L', 3.99)
INSERT INTO PRODUTO VALUES (4, 5, 'Heineken long neck 330ml', 'Unidade Heineken long neck 330ml', 5.69)

/*---------------------------------BACKUP---------------------------------*/

BACKUP DATABASE WEB3
TO DISK = 'C:\Users\marco\OneDrive\Área de Trabalho\primeiro_backup.bak';

/*-----------------------------RESTORE DATABASE---------------------------*/

RESTORE DATABASE WEB3 
FROM DISK = N'C:\Users\marco\OneDrive\Área de Trabalho\primeiro_backup.bak'
WITH  FILE = 1, NOUNLOAD, STATS = 5;
GO