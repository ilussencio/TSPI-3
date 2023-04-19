USE MePoupe;
-- 1)
INSERT INTO Registro_Deposito (cod_conta, dt_deposito, valor_deposito) VALUES
(1, "2022-02-01", 200),
(2, "2022-02-01", 200),
(1, "2022-02-10", 200),
(2, "2022-02-10", 200),
(1, "2022-03-01", 200),
(2, "2022-03-01", 200),
(1, "2022-03-10", 200),
(2, "2022-03-10", 200),
(1, "2022-04-01", 200),
(2, "2022-04-01", 200),
(1, "2022-04-01", 200),
(2, "2022-04-01", 200);


INSERT INTO Registro_Saque  (cod_conta, dt_saque , valor_saque) VALUES
(1, "2022-02-01", 200),
(2, "2022-02-01", 200),
(1, "2022-02-10", 200),
(2, "2022-02-10", 200),
(1, "2022-03-01", 200),
(2, "2022-03-01", 200),
(1, "2022-03-10", 200),
(2, "2022-03-10", 200),
(1, "2022-04-01", 200),
(2, "2022-04-01", 200),
(1, "2022-04-01", 200),
(2, "2022-04-01", 200);

SELECT * FROM conta_corrente cc;
INSERT INTO conta_corrente (dt_hora_abertura, saldo, status, cod_cliente) VALUES (now(), 100, 'Ativa', 3);
-- 2)
CREATE PROCEDURE sp_insere_cli (
	p_nome varchar(50), 
	p_cpf varchar(11), 
	p_sexo char(1), 
	p_dt_nasc date, 
	p_telefone char(15),
	p_email varchar(100)
)
BEGIN
	CASE
	WHEN(p_nome IS NULL) THEN
		SELECT "NOME INVALIDO!" AS ERROR;
	WHEN(p_cpf IS NULL) THEN
		SELECT "CPF INVALIDO!" AS ERROR;
	ELSE
		INSERT INTO cliente( nome, cpf, sexo,dt_nasc, telefone, email) VALUES (p_nome,p_cpf,p_sexo,p_dt_nasc,p_telefone,p_email); 
	END CASE;
END

CALL sp_insere_cli('Lucas I. Silva', '11598145622', 'M', '1992-06-01', '34992317788', 'ilussencio@gmail.com');
SELECT * FROM cliente c ;


-- 3)

CREATE TABLE transferencia(
	id_transferencia INT NOT NULL AUTO_INCREMENT,
	id_conta_origem INT NOT NULL,
	id_conta_destino INT NOT NULL,
	valor DECIMAL(9,2),
	dataHora datetime,
	PRIMARY KEY(id_transferencia),
	FOREIGN KEY (id_conta_origem) REFERENCES conta_corrente(cod_conta),
	FOREIGN KEY (id_conta_destino) REFERENCES conta_corrente(cod_conta)
);



CREATE PROCEDURE sp_transferencia (
	conta_origem int,
	conta_destino int,
	valor DECIMAL(9,2)
)
BEGIN
	DECLARE saldo_conta DECIMAL(9,2) DEFAULT NULL;
	DECLARE saldo_conta_destino DECIMAL(9,2) DEFAULT NULL;
	SELECT saldo INTO saldo_conta FROM conta_corrente cc WHERE COD_CONTA = conta_origem;
	SELECT saldo INTO saldo_conta_destino FROM conta_corrente cc WHERE COD_CONTA = conta_destino;
	
	IF (saldo_conta < valor) THEN 
		SELECT "SALDO INSUFICIENTE!" AS ERROR;
	ELSE
		INSERT INTO transferencia (id_conta_origem,id_conta_destino,valor,dataHora) VALUES (conta_origem, conta_destino, valor, NOW());
		UPDATE conta_corrente SET saldo = (saldo_conta - valor) WHERE cod_conta = conta_origem;
		UPDATE conta_corrente SET saldo = (saldo_conta_destino + valor) WHERE cod_conta = conta_destino;
		SELECT "TRANSFERENCIA REALIZADA COM SUCESSO!" AS SUCESSO;
	END IF;
END

call sp_transferencia(1,2,72);
SELECT * FROM conta_corrente cc;
SELECT * FROM transferencia;
call sp_transferencia(2,1, 70);

SELECT * FROM conta_corrente cc;
SELECT * FROM transferencia;

-- 4)
CREATE PROCEDURE relatorio1 (
	dt1 DATE,
	dt2 DATE
)
BEGIN
	SELECT c.nome, cc.cod_conta, SUM(valor_deposito)
	FROM Registro_Deposito rd
		JOIN conta_corrente cc ON rd.cod_conta = cc.cod_conta
		JOIN cliente c ON c.cod_cliente = cc.cod_cliente 
	WHERE rd.dt_deposito between dt1 AND dt2
	GROUP BY rd.cod_conta
	ORDER BY 3 DESC;
END

CALL relatorio1('2022-01-01', '2022-05-01');


-- 5)
CREATE PROCEDURE relatorio2(
	ano INT,
	cod INT
)
BEGIN 
	CASE
		WHEN (cod = 1) THEN
			SELECT cc.cod_conta, MONTH(rs.dt_saque), SUM(rs.valor_saque)
			FROM Registro_Saque rs
				JOIN conta_corrente cc on rs.cod_conta = cc.cod_conta 
			WHERE YEAR(rs.dt_saque) = ano
			GROUP BY 2;
		WHEN (cod = 2) THEN
			SELECT cc.cod_conta, MONTH(rd.dt_deposito), SUM(rd.valor_deposito)
			FROM Registro_Deposito rd
				JOIN conta_corrente cc on rd.cod_conta = cc.cod_conta 
			WHERE YEAR(rd.dt_deposito) = ano
			GROUP BY 2;
		ELSE
			SELECT "OPÇÃO INVALIDA!" AS ERROR;
	END CASE;
END


CALL relatorio2(2022, 1);
CALL relatorio2(2022, 2);