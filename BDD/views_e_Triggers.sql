USE Aula2
--Criando uma View
CREATE VIEW primeiraView
	(cod_produto, nome_produto)
AS
	SELECT cod_produto, nome_produto FROM Produto

--Usando uma View
SELECT * FROM primeiraView
WHERE cod_produto = 1 --Variações (WHERE, GROUP BY, ORDER BY...)

--Criando uma Trigger
CREATE TRIGGER exemplo1
ON Produto
FOR INSERT, DELETE, UPDATE 
AS
BEGIN
	IF (SELECT COUNT (*) FROM INSERTED) = 1 AND (SELECT COUNT (*) FROM DELETED) = 1
		 PRINT 'O registro foi atualizado!';
	ELSE 
		IF (SELECT COUNT (*) FROM DELETED) = 1
			PRINT 'O registro foi excluído!'; 
		ELSE
			PRINT 'O registro foi inserido!'; 

END

insert into Produto (nome_produto, preco_produto) values ('Arroz', 15)
delete from Produto where nome_produto = 'Arroz'
update Produto
set nome_produto = 'Arroz' where cod_produto = 2

CREATE TRIGGER exemplo2
ON Produto
FOR UPDATE, INSERT, DELETE 
AS
BEGIN
	IF (SELECT COUNT (*) FROM DELETED) <> 0
	BEGIN
		PRINT 'Conteúdo da DELETED';
		SELECT * FROM DELETED;
	END
	IF (SELECT COUNT (*) FROM INSERTED) <> 0
	BEGIN
		PRINT 'Conteúdo da INSERTED';
		SELECT * FROM INSERTED; 
	END
END

insert into Produto (nome_produto, preco_produto) values ('Feijão', 15)
delete from Produto where nome_produto = 'Arroz'
update Produto
set nome_produto = 'Arroz' where cod_produto = 4




--Criando uma Trigger YOUTUBE
Create table tbSaldos(
produto varchar(10),
saldo_inicial numeric(10),
saldo_final numeric(10),
data_ult_mov datetime
);

insert into tbSaldos (produto, saldo_inicial, saldo_final, data_ult_mov) 
values ('Produto A', 0, 100, GETDATE());

create table tbVendas(
id_vendas int,
produto varchar(10),
quantidade int,
data datetime
)

create sequence seq_tbVendas
	as numeric
	start with 1
	increment by 1;

create table tb_histVendas(
produto varchar(10),
quantidade int,
data_venda datetime);

create trigger tg_ajustaSaldo
on tbVendas
for insert
as 
begin
	declare @quantidade int,
			@data datetime,
			@produto varchar(10)

	select @data = DATA, @quantidade = quantidade, @produto = produto from inserted
	update tbSaldos
		set saldo_final = saldo_final - @quantidade,
			data_ult_mov = @data
		where PRODUTO = @produto;

	insert into tb_histVendas (produto, quantidade, data_venda)
	values (@produto, @quantidade, @data);
end

insert into tbVendas (id_vendas, produto, quantidade, data)
values (next value for seq_tbVendas, 'Produto A', 11, GETDATE());
