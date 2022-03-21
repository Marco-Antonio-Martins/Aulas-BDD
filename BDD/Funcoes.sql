CREATE FUNCTION ex1(@num1 int, @num2 int)
RETURNS int
AS
BEGIN
declare @retorno int
		
set @retorno = @num1 + @num2

RETURN @retorno
END

select dbo.ex1(1,3)

----

CREATE TABLE nota_fiscal(
numero int unique,
codProduto int identity(1,1),
quantidade int,
preco float,
PRIMARY KEY(codProduto)
)

CREATE FUNCTION ex2(@codProduto int)
RETURNS float
AS
BEGIN
declare @retorno float
		
set @retorno = (select SUM(quantidade*preco) from nota_fiscal where codProduto = @codProduto)

RETURN @retorno
END

select dbo.ex2(3)
