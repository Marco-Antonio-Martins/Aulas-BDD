--1) AP1 COM TRANSACTION

ALTER TRIGGER auditoria
ON FUNCIONARIO
FOR INSERT, UPDATE 
AS
BEGIN
	BEGIN TRANSACTION
	DECLARE @nome VARCHAR(200), 
			@sal�rio_antigo DECIMAL(5,2),
			@sal�rio_novo DECIMAL(5,2)
	SELECT @nome = nome, @sal�rio_novo = sal�rio FROM inserted;
 	IF (SELECT COUNT (*) FROM INSERTED) = 1 AND (SELECT COUNT (*) FROM DELETED) = 1
		BEGIN
		INSERT INTO AUDITORIA_FUNCIONARIO(data_hora, nome, salario_antigo, salario_novo) VALUES (GETDATE(), @nome, (SELECT TOP 1 salario_novo FROM AUDITORIA_FUNCIONARIO WHERE nome = @nome ORDER BY data_hora DESC), @sal�rio_novo)
		PRINT 'O registro foi atualizado!'
		END
	ELSE 
		BEGIN
		INSERT INTO AUDITORIA_FUNCIONARIO(data_hora, nome, salario_antigo, salario_novo) VALUES (GETDATE(), @nome, 0, @sal�rio_novo)
		PRINT 'O registro foi inserido!'
		END	
	IF @@ERROR = 0
		BEGIN
		COMMIT TRANSACTION;
		END
	ELSE
		BEGIN
		ROLLBACK TRANSACTION;
		END
END

