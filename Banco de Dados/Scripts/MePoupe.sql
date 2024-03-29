USE MEPOUPE;
-- 1) A.
INSERT INTO	CLIENTE
VALUES (3,'LUCAS ILUSSENCIO DA SILVA','34992929292','M','1997-06-01','12345678978','LUCAS@GMAIL.COM'),		
		(4,'FERNANDO DANIEL','34939393939','M','1997-03-21','78945612396','FERNANDO@GMAIL.COM'),
		(5,'PATRICIA SANTIAGO','34989898989','F','1991-02-23','14725836932','PATRICIA@GMAIL.COM'),
		(6,'EDUARDO SANTIAGO','34986398633','M','2000-02-01','95135785296','EDUARDO@GMAIL.COM');
-- B)
INSERT INTO	CONTA_CORRENTE
VALUES (3,"2023-01-01",50,"ATIVA",3),
		(4,"2023-02-02",30,"ATIVA",4),
		(5,"2023-01-03",10,"ATIVA",5),
		(6,"2023-02-04",75,"ATIVA",6);
-- DUPLICIDADE DE CONTA
INSERT INTO	CONTA_CORRENTE
VALUES (7,"2023-01-01",50,"ATIVA",3),
		(8,"2023-02-02",30,"ATIVA",4);
-- DUPLICIDADE DE CONTA SEM MOVIMENTAÇÃO
INSERT INTO	CONTA_CORRENTE
VALUES (9,"2023-01-01",50,"ATIVA",5),
		(10,"2023-02-02",30,"ATIVA",6);
-- C)
INSERT	INTO
	REGISTRO_SAQUE (COD_CONTA,
	DT_SAQUE,
	VALOR_SAQUE)
VALUES (1,'2023-01-01',10),
		(1,'2023-01-01',20),
		(2,'2023-01-01',30),
		(2,'2023-01-01',40),
		(3,'2023-01-01',10),
		(3,'2023-01-01',20),
		(4,'2023-01-01',30),
		(4,'2023-02-01',40),
		(5,'2023-02-01',10),
		(6,'2023-02-01',20),
		(7,'2023-02-01',30),
		(8,'2023-02-01',40),
		(8,'2023-02-01',10),
		(7,'2023-02-01',20),		
		(8,'2023-01-01',30),
		(7,'2023-02-01',40),
		(8,'2023-01-01',50);

INSERT	INTO REGISTRO_DEPOSITO (COD_CONTA, DT_DEPOSITO, VALOR_DEPOSITO)
VALUES (1,'2023-02-20',100),
		(1,'2023-01-20',200),
		(2,'2023-01-20',300),
		(2,'2023-02-15',400),
		(3,'2023-02-11',100),
		(3,'2023-01-03',200),
		(4,'2023-01-03',300),
		(4,'2023-02-01',400),
		(5,'2023-02-03',100),
		(6,'2023-02-03',200),
		(7,'2023-02-03',300),
		(8,'2023-02-03',400),
		(8,'2023-02-03',100),
		(7,'2023-02-01',200),
		(8,'2023-01-01',300),
		(7,'2023-02-01',400),
		(8,'2023-01-01',500);
	
-- 2)

SELECT
	CONCAT(C.NOME, ' (CONTA: ', CAST(CC.COD_CONTA AS CHAR), ')') AS CLIENTE_CONTA,
	CONCAT('DEPOSITOS: ', CAST(SUM(RD.VALOR_DEPOSITO) AS CHAR)) AS TOTAL_DEPOSITOS,
	CONCAT('SAQUES: ', CAST(SUM(RS.VALOR_SAQUE) AS CHAR)) AS TOTAL_SAQUES
FROM
	CLIENTE C
INNER JOIN CONTA_CORRENTE CC ON
	C.COD_CLIENTE = CC.COD_CLIENTE
LEFT JOIN REGISTRO_DEPOSITO RD ON
	CC.COD_CONTA = RD.COD_CONTA
LEFT JOIN REGISTRO_SAQUE RS ON
	CC.COD_CONTA = RS.COD_CONTA
GROUP BY
	C.NOME,
	CC.COD_CONTA
UNION
SELECT
	CONCAT(C.NOME, ' (CONTA: ', CAST(CC.COD_CONTA AS CHAR), ')') AS CLIENTE_CONTA,
	CONCAT('DEPOSITOS: ', CAST(SUM(RD.VALOR_DEPOSITO) AS CHAR)) AS TOTAL_DEPOSITOS,
	CONCAT('SAQUES: ', CAST(SUM(RS.VALOR_SAQUE) AS CHAR)) AS TOTAL_SAQUES
FROM
	CLIENTE C
LEFT JOIN CONTA_CORRENTE CC ON
	C.COD_CLIENTE = CC.COD_CLIENTE
LEFT JOIN REGISTRO_DEPOSITO RD ON
	CC.COD_CONTA = RD.COD_CONTA
LEFT JOIN REGISTRO_SAQUE RS ON
	CC.COD_CONTA = RS.COD_CONTA
WHERE
	CC.COD_CONTA IS NULL
GROUP BY
	C.NOME,
	CC.COD_CONTA;
-- 3 - A)
SELECT
	C.COD_CLIENTE,
	C.NOME,
	C.TELEFONE,
	C.EMAIL
FROM
	CLIENTE C
JOIN CONTA_CORRENTE CC ON
	C.COD_CLIENTE = CC.COD_CLIENTE
WHERE
	CC.COD_CONTA NOT IN(
	SELECT
		COD_CONTA
	FROM
		REGISTRO_SAQUE
	WHERE
		TIMESTAMPDIFF(MONTH,
		DT_SAQUE,
		CURRENT_DATE()) <= 6)
	AND
	CC.COD_CONTA NOT IN(
	SELECT
		COD_CONTA
	FROM
		REGISTRO_DEPOSITO
	WHERE
		TIMESTAMPDIFF(MONTH,
		DT_DEPOSITO,
		CURRENT_DATE()) <= 6);
-- 3 - B)
SELECT
	CC.COD_CONTA,
	YEAR(RD.DT_DEPOSITO),
	MONTH(RD.DT_DEPOSITO),
	IF (SUM(RD.VALOR_DEPOSITO) IS NOT NULL,
	CONCAT('DEPOSITOS: ', CAST(SUM(RD.VALOR_DEPOSITO) AS CHAR)),
	"SEM REGISTRO DE DEPOSITO")
FROM
	CONTA_CORRENTE CC
LEFT JOIN REGISTRO_DEPOSITO RD ON
	RD.COD_CONTA = CC.COD_CONTA
GROUP BY
	CC.COD_CONTA,
	YEAR(RD.DT_DEPOSITO),
	MONTH(RD.DT_DEPOSITO)
UNION 
SELECT
	CC.COD_CONTA,
	YEAR(RS.DT_SAQUE),
	MONTH(RS.DT_SAQUE),
	IF(SUM(RS.VALOR_SAQUE) IS NOT NULL,
	CONCAT('SAQUES: ', CAST(SUM(RS.VALOR_SAQUE) AS CHAR)),
	"SEM REGISTRO DE SAQUE")
FROM
	CONTA_CORRENTE CC
LEFT JOIN REGISTRO_SAQUE RS ON
	RS.COD_CONTA = CC.COD_CONTA
GROUP BY
	CC.COD_CONTA,
	YEAR(RS.DT_SAQUE),
	MONTH(RS.DT_SAQUE);
-- 3 - C)

SELECT
	CC.COD_CONTA,
	C.NOME,
	COUNT(RS.COD_SAQUE) AS NUM_SAQUES
FROM
	CONTA_CORRENTE CC
JOIN REGISTRO_SAQUE RS ON
	CC.COD_CONTA = RS.COD_CONTA
JOIN CLIENTE C ON
	CC.COD_CLIENTE = C.COD_CLIENTE
WHERE
	MONTH(RS.DT_SAQUE) = MONTH(CURRENT_DATE())
	AND YEAR(RS.DT_SAQUE) = YEAR(CURRENT_DATE())
GROUP BY
	CC.COD_CONTA,
	C.NOME;
-- 3 - D)
SELECT
	C.NOME,
	C.CPF,
	CC.COD_CONTA
FROM
	CLIENTE C
JOIN CONTA_CORRENTE CC ON
	C.COD_CLIENTE = CC.COD_CLIENTE
WHERE
	CC.SALDO > 100000.00;
-- 4 - A)
SELECT
	DISTINCT C.*
FROM
	CLIENTE C
JOIN CONTA_CORRENTE CC ON
	C.COD_CLIENTE = CC.COD_CLIENTE
JOIN REGISTRO_DEPOSITO RD ON
	CC.COD_CONTA = RD.COD_CONTA
WHERE
	RD.VALOR_DEPOSITO = (
	SELECT
		MAX(VALOR_DEPOSITO)
	FROM
		REGISTRO_DEPOSITO
	WHERE
		MONTH(DT_DEPOSITO) = MONTH(CURRENT_DATE())
			AND YEAR(DT_DEPOSITO) = YEAR(CURRENT_DATE()));
-- 4 - B)
SELECT
	C.CPF,
	C.NOME,
	C.TELEFONE,
	C.EMAIL,
	CC.COD_CONTA
FROM
	CLIENTE C
JOIN CONTA_CORRENTE CC ON
	C.COD_CLIENTE = CC.COD_CLIENTE
JOIN REGISTRO_SAQUE RS ON
	CC.COD_CONTA = RS.COD_CONTA
WHERE
	RS.VALOR_SAQUE > (
	SELECT
		AVG(VALOR_SAQUE)
	FROM
		REGISTRO_SAQUE
	WHERE
		YEAR(DT_SAQUE) = 2023)
	AND YEAR(RS.DT_SAQUE) = 2023;
-- 4 - C)
SELECT
	C.*,
	CC.*
FROM
	CLIENTE C
JOIN CONTA_CORRENTE CC ON
	C.COD_CLIENTE = CC.COD_CLIENTE
WHERE
	CC.DT_HORA_ABERTURA BETWEEN (
	SELECT
		DATE('2023-01-01')) AND (
	SELECT
		DATE('2023-02-28'));
-- 4 - D)
SELECT
	CC.COD_CONTA,
	CC.SALDO,
	CC.DT_HORA_ABERTURA
FROM
	CONTA_CORRENTE CC
WHERE
	CC.DT_HORA_ABERTURA BETWEEN (
	SELECT
		DATE('2023-01-01')) AND (
	SELECT
		DATE('2023-12-31'))
	AND CC.COD_CLIENTE IN (
	SELECT
		COD_CLIENTE
	FROM
		CLIENTE
	WHERE
		SEXO = 'F');
