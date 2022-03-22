CREATE TABLE nota_fiscal(
numero int unique,
codProduto int identity(1,1),
quantidade int,
preco float,
PRIMARY KEY(codProduto)
)
INSERT INTO nota_fiscal (numero, preco, quantidade) values (1,10,500)
INSERT INTO nota_fiscal (numero, preco, quantidade) values (2,15,50)
INSERT INTO nota_fiscal (numero, preco, quantidade) values (3,25,50)
INSERT INTO nota_fiscal (numero, preco, quantidade) values (4,100,50)
--FUNÇÃO NÃO ALTERA TABELA(-INSERT-DELETE...)
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
CREATE FUNCTION ex2(@codProduto int)
RETURNS float
AS
BEGIN
declare @retorno float
		
set @retorno = (select SUM(quantidade*preco) from nota_fiscal where codProduto = @codProduto)

RETURN @retorno
END

----
CREATE FUNCTION deleta()
RETURNS varchar
AS
BEGIN
delete from nota_fiscal
declare @retorno varchar = 'Excluido com sucesso'
RETURN @retorno
END
select 3, dbo.ex2(3) as faturamento
from nota_fiscal

----
CREATE FUNCTION listaNotas(@codigo as int)
RETURNS table
AS
RETURN SELECT * FROM nota_fiscal 
WHERE codProduto = @codigo

select * from dbo.listaNotas(4)