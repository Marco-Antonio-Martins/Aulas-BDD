USE Testes
--1) Crie uma função que receba uma string e que remova os caracteres especiais “#$%” se houver dentro do parâmetro.
CREATE FUNCTION ex(@str varchar(100))
RETURNS varchar(100)
AS 
BEGIN
declare @especiais varchar(3)
declare @i int
declare @posicao int
set @especiais = '#$%'
set @i = 0
WHILE @i <= len(@str)
BEGIN
	set @posicao = CHARINDEX(SUBSTRING(@str, @i, 1), @especiais, 1);

	if @posicao > 0
		set @str = REPLACE(@str, SUBSTRING(@especiais, @posicao, 1), '');

	set @i = @i+1
END
RETURN @str
END

select dbo.ex('#$%ABCDEFGHIJKLMNOPQRSTUVWXYZ#$%')

--2) Explicar:

CREATE TRIGGER questao1_Compras
ON Compra
FOR DELETE 
AS 
BEGIN
	DECLARE
	@codCompra int
	IF (SELECT COUNT(*) FROM DELETED) = 1 
	BEGIN
		SET @codCompra = (SELECT codCompra FROM DELETED)
		DELETE FROM ItensCompra
		WHERE codCompra = @codCompra
	END
END