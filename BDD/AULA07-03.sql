CREATE DATABASE Aula2
USE Aula2
CREATE TABLE Produto(
cod_produto int identity(1,1),
nome_produto varchar(20),
preco_produto float default 0,
PRIMARY KEY (cod_produto));

--STORED PRODUCERS
CREATE PROCEDURE inserir_produto
@nome varchar(20),
@preco float
AS
BEGIN
INSERT INTO Produto(nome_produto, preco_produto) VALUES (@nome, @preco);
END

--EXEC PRODUCER
EXEC inserir_produto 'Nome', 1500
EXEC inserir_produto 'Marco', 1500, 0

--EDIT PROCUDER
ALTER PROCEDURE inserir_produto
@nome varchar(20),
@preco float,
@aux int
AS
BEGIN
--CONDICIONAL
IF @aux > 1
BEGIN
INSERT INTO Produto(nome_produto, preco_produto) VALUES (@nome, @preco);
END
ELSE
select * FROM Produto
END

--VARIÁVEL
DECLARE
@variavel int;
SET @variavel = 10;

--REPETIÇÃO
WHILE condicao
BEGIN
--conteúdo
--alterar a condição de parada: SET @cont = @cont + 1;
END

--ATVDD 1
CREATE PROCEDURE exercicio
@texto varchar(100)
AS
BEGIN
	DECLARE 
	@aux int = 1
	WHILE substring(@texto,@aux,1) != ''
	BEGIN
	PRINT(substring(@texto,@aux,1))
	SET @aux += 1
	END
END

EXEC exercicio "Fabio"

--ATVDD2
CREATE PROCEDURE exercicio2
@txt varchar(100)
AS
BEGIN
	DECLARE 
	@aux2 int = 1
	WHILE substring(@txt,@aux2,1) != ''
	BEGIN
	IF @aux2%2 = 0
	BEGIN
	PRINT(substring(@txt,@aux2,1))
	END
	SET @aux2 += 1
	END
END

EXEC exercicio2 "Fabio"
