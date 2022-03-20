use AdventureWorks2017;
--SINTAXE DO SELECT:
/*
SELECT colunaX, colunaY    /// SELECIONA AS COLUNAS
FROM tabela;               /// RELACIONA DE QUAL TEBELA ELE QUER ESSAS COLUNAS
*/


/*DESAFIO 1*/
SELECT FirstName, LastName
FROM Person.Person;

/*DESAFIO 2*/
SELECT DISTINCT FirstName /*DISTINCT apresenta apenas um de cada dado, Ex. Caso existam 2 Ana Maria, ele apresentará apenas uma*/
FROM Person.Person;

/*DESAFIO 3*/
SELECT DISTINCT LastName
FROM Person.Person;

--SINTAXE WHERE:
/*
SELECT colunaX, colunaY     /// SELECIONA AS COLUNAS
FROM tabela                 /// RELACIONA DE QUAL TEBELA ELE QUER ESSAS COLUNAS
WHERE condição;             /// AONDE UMA CERTA CONDIÇÃO ACONTECE

OPERADOR - DESCRIÇÃO
<>         DIFERENTE DE (!=)
AND        OPERADOR LÓGICO E
OR		   OPERADOR LÓGICO OU
*/


/*DESAFIO 4*/
SELECT Name, Weight
FROM Production.Product
WHERE Weight > 500 AND Weight <= 700;

SELECT *
FROM HumanResources.Employee
WHERE MaritalStatus = 'm' AND SalariedFlag = 1;

SELECT EmailAddress
FROM Person.Person person
inner join Person.EmailAddress email on person.BusinessEntityID = email.BusinessEntityID
WHERE FirstName = 'Peter' AND LastName = 'Krebs';

--SINTAXE COUNT
/*
SELECT COUNT(colunaX, colunaY)
FROM tabela
*/

/*DESAFIO 5*/
SELECT COUNT(*)
FROM Production.Product;

SELECT COUNT(Size)
FROM Production.Product;

SELECT COUNT(DISTINCT Weight)
FROM Production.Product;


--SINTAXE TOP
/*
SELECT TOP X(X = 10) *   /// SELECIONA OS TOP X(X = 10) LINHAS DAS COLUNAS SELECIONADAS
FROM TABELA 
*/

--SINTAXE ORDER BY
/*
SELECT colunaX, colunaY    
FROM tabela
ORDER BY colunaX, colunaY asc/desc /// ORDENA AS COLUNAS X, Y EM ORDEM ASC (CRESCENTE) OU DESC (DECRESCENTE)
*/

/*DESAFIO 6*/
SELECT TOP 10 ProductID    /*SELECIONOU OS TOP 10 PRODUTOS ID*/
FROM Production.Product	   /*DA TABELA PRODUTOS*/
ORDER BY ListPrice desc;   /*ORDENANDO POR PREÇO (DECRESCENTE)*/

SELECT TOP 4 Name, ProductNumber
FROM Production.Product
ORDER BY ProductID;

--SINTAXE BETWEEN
/*
valor BETWEEN mínimo AND máximo

é o mesmo que dizer:
valor >= mínimo AND	valor <= máximo

EXEMPLO:
*/	

SELECT *
FROM HumanResources.Employee
WHERE HireDate BETWEEN '2009/01/01' AND '2010/01/01'
ORDER BY HireDate;

-- SINTAXE IN
/*
valor IN (valorX, valorY)
color IN ('BLUE', 'BLACK')

EXEMPLO:
*/

SELECT *
FROM Person.Person
WHERE BusinessEntityID IN (2, 7, 13);

-- SINTAXE LIKE
/*
SELECT colunaX, colunaY    
FROM tabela;  
WHERE FirstName like 'ovi%'
WHERE FirstName like '%los'
WHERE FirstName like '%ani%'
*/

SELECT *
FROM Person.Person
WHERE FirstName like '%to%';

/*DESAFIO 7*/
SELECT COUNT(ProductID)
FROM Production.Product
WHERE ListPrice > 1500;

SELECT COUNT(LastName)
FROM Person.Person
WHERE LastName like 'P%';

SELECT COUNT(DISTINCT(City))
FROM Person.Address;

SELECT DISTINCT(City)
FROM Person.Address;

SELECT COUNT(*) 
FROM Production.Product
WHERE Color = 'Red' 
AND ListPrice BETWEEN 500 AND 1000;	

SELECT COUNT(*)
FROM Production.Product
WHERE Name LIKE '%ROAD%';

-- FUÇÕES DE AGREGAÇÃO (SUM MIN MAX AVG)
/*
SUM(SOMA OS VALORES ENCONTRADOS NESSA TABELA) 
MIN(MOSTRA O VALOR MINIMO ENCONTRADO NESSA TABELA) 
MAX(MOSTRA O VALOR MAXIMO ENCONTRADO NESSA TABELA) 
AVG(FAZ A MEDIA DOS VALORES ENCONTRADOS NESSA TABELA) 
*/

SELECT TOP 10 SUM(LineTotal) AS 'SOMA TOTAL'
FROM Sales.SalesOrderDetail;
SELECT TOP 10 MIN(LineTotal) AS 'VALOR MINIMO'
FROM Sales.SalesOrderDetail;
SELECT TOP 10 MAX(LineTotal) AS 'VALOR MINIMO'
FROM Sales.SalesOrderDetail;
SELECT TOP 10 AVG(LineTotal) AS 'MEDIA DOS VALORES'
FROM Sales.SalesOrderDetail;

-- GROUP BY
SELECT SpecialOfferID, SUM(UnitPrice) AS 'SOMA'
FROM Sales.SalesOrderDetail
GROUP BY SpecialOfferID

SELECT ProductID, COUNT(ProductID) AS 'CONTAGEM'
FROM Sales.SalesOrderDetail
GROUP BY ProductID

SELECT ProductID, MAX(OrderQty) AS 'QUANTIDADE MAXIMA VENDIDA EM UMA ORDEM'
FROM Sales.SalesOrderDetail
GROUP BY ProductID

SELECT FirstName, COUNT(FirstName) AS 'CONTAGEM'
FROM Person.Person
GROUP BY FirstName

SELECT COLOR, AVG(ListPrice) AS 'MEDIA DE PREÇO DE PRODUTOS PRATAS'
FROM Production.Product
WHERE Color = 'SILVER'
GROUP BY Color

SELECT MiddleName, COUNT(FirstName) AS 'QUANTIDADE'
FROM Person.Person
GROUP BY MiddleName
M Sales.SalesOrderDetail
SELECT ProductID, AVG(OrderQty) AS 'MEDIA'
FRO
GROUP BY ProductID

SELECT TOP 10 ProductID, SUM(LineTotal) AS 'MAXIMA VENDIDA EM UMA ORDEM'
FROM Sales.SalesOrderDetail
GROUP BY ProductID	
ORDER BY SUM(LineTotal) DESC;

--SINTAXE HAVING
/*
SELECT colunaX, FUNÇÃODEAGRAGAÇÃO(colunaY)	
FROM tabela                 
GROUP BY colunaX
HAVING condição // TIPO UM WHERE, MAS PRA GROUP BY
*/
--EX:

SELECT FirstName, COUNT(FirstName) AS 'QUANTIDADE DE VEZES QUE O NOME APARECE'
FROM Person.Person
GROUP BY FirstName
HAVING COUNT(FirstName) > 10

--INNER JOIN
/*
SELECT 
*/
SELECT P.BusinessEntityID, P.FirstName, P.LastName, PE.EmailAddress
FROM Person.Person AS P 
INNER JOIN Person.EmailAddress PE ON P.BusinessEntityID = PE.BusinessEntityID