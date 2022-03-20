CREATE TABLE Cliente (
codCliente int IDENTITY(1,1), 
nomeCliente varchar(20)
PRIMARY KEY (codCliente));

CREATE TABLE Vendedor (
codVendedor int IDENTITY(1,1), 
nomeVendedor varchar(20)
PRIMARY KEY (codVendedor));

CREATE TABLE Venda (
codVenda int IDENTITY(1,1), 
codCliente int, 
codVendedor int, 
dataVenda date DEFAULT getdate(), 
totalVenda money,
FOREIGN KEY (codCliente) REFERENCES Cliente(codCliente),
FOREIGN KEY (codVendedor) REFERENCES Vendedor(codVendedor),
PRIMARY KEY (codVenda));

CREATE TABLE Comissao (
codComissao int IDENTITY(1,1), 
codVendedor int, 
dataVenda date, 
valorComissao money,
FOREIGN KEY (codVendedor) REFERENCES Vendedor(codVendedor),
PRIMARY KEY (codComissao));

INSERT INTO Cliente (nomeCliente) VALUES ('Marco Antônio')
INSERT INTO Vendedor (nomeVendedor) VALUES ('Vendedor 1')

SELECT * FROM Cliente 
SELECT * FROM Vendedor
SELECT * FROM Venda
SELECT * FROM Comissao

CREATE PROCEDURE consultaComissao
@codVendedor int
AS
BEGIN
	IF (select SUM(valorComissao) from Comissao WHERE codVendedor = 1 and MONTH(dataVenda) = MONTH(getdate())) > (select SUM(valorComissao) from Comissao WHERE codVendedor = 1 and MONTH(dataVenda) = MONTH(getdate()) - 1)
	BEGIN
	 PRINT('A soma de suas comissões do mês atual é maior que a do mês passado!!!')
	END
	ELSE
	BEGIN
	 PRINT('A soma de suas comissões do mês atual é menor que a do mês passado!!!')
	END
END

exec consultaComissao 1

CREATE TRIGGER addcomissao
ON Venda
FOR INSERT
AS
BEGIN
	DECLARE @codVendedor int,
			@dataVenda date,
			@totalcomissao money

	select @codVendedor = codVendedor, @dataVenda = dataVenda, @totalcomissao = totalVenda * 0.1 from inserted
	INSERT INTO Comissao (codVendedor, dataVenda, valorComissao) VALUES (@codVendedor, @dataVenda, @totalcomissao);
END


select SUM(valorComissao) from Comissao WHERE codVendedor = 1 and MONTH(dataVenda) = MONTH(getdate()) - 1
INSERT INTO Comissao(codVendedor, dataVenda, valorComissao) VALUES (1, '2022-02-20', 1500)