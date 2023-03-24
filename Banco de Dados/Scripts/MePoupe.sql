use MePoupe;

-- 1) a.
insert into cliente 
values	(3,'Lucas Ilussencio da silva','34992929292','M','1997-06-01', '12345678978','lucas@gmail.com'),
		(4,'Fernando Daniel', '34939393939', 'M','1997-03-21', '78945612396', 'fernando@gmail.com'),
		(5,'Patricia Santiago', '34989898989', 'F','1991-02-23', '14725836932', 'patricia@gmail.com'),
		(6,'Eduardo Santiago', '34986398633', 'M','2000-02-01', '95135785296', 'eduardo@gmail.com');
	
-- b)
insert conta_corrente
values	(3,"2023-01-01", 50, "Ativa", 3),
		(4,"2023-02-02", 30, "Ativa", 4),
		(5,"2023-01-03", 10, "Ativa", 5),
		(6,"2023-02-04", 75, "Ativa", 6);
-- duplicidade de conta
insert conta_corrente
values	(7,"2023-01-01", 50, "Ativa", 3),
		(8,"2023-02-02", 30, "Ativa", 4);

-- duplicidade de conta sem movimentação
insert conta_corrente
values	(9,"2023-01-01", 50, "Ativa", 5),
		(10,"2023-02-02", 30, "Ativa", 6);
	
-- c)
insert into registro_saque (cod_conta,dt_saque, valor_saque)
values 	(1,'2023-01-01',10),
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

insert into registro_deposito  (cod_conta,dt_deposito , valor_deposito)
values 	(1,'2023-02-20',100),
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
	
# 2)

SELECT CONCAT(c.nome, ' (Conta: ', CAST(cc.cod_conta AS CHAR), ')') AS Cliente_Conta,
       CONCAT('Depositos: ', CAST(SUM(rd.valor_deposito) AS CHAR)) AS Total_Depositos,
       CONCAT('Saques: ', CAST(SUM(rs.valor_saque) AS CHAR)) AS Total_Saques
FROM Cliente c
INNER JOIN Conta_corrente cc ON c.cod_cliente = cc.cod_cliente
LEFT JOIN Registro_Deposito rd ON cc.cod_conta = rd.cod_conta
LEFT JOIN Registro_Saque rs ON cc.cod_conta = rs.cod_conta
GROUP BY c.nome, cc.cod_conta
UNION
SELECT CONCAT(c.nome, ' (Conta: ', CAST(cc.cod_conta AS CHAR), ')') AS Cliente_Conta,
       CONCAT('Depositos: ', CAST(SUM(rd.valor_deposito) AS CHAR)) AS Total_Depositos,
       CONCAT('Saques: ', CAST(SUM(rs.valor_saque) AS CHAR)) AS Total_Saques
FROM Cliente c
LEFT JOIN Conta_corrente cc ON c.cod_cliente = cc.cod_cliente
LEFT JOIN Registro_Deposito rd ON cc.cod_conta = rd.cod_conta
LEFT JOIN Registro_Saque rs ON cc.cod_conta = rs.cod_conta
WHERE cc.cod_conta IS NULL
GROUP BY c.nome, cc.cod_conta;

# 2 - A)
select c.cod_cliente, c.nome, c.telefone, c.email
from cliente c 
	join conta_corrente cc on c.cod_cliente = cc.cod_cliente
where
	cc.cod_conta not in(select cod_conta from registro_saque where timestampdiff(month,dt_saque, current_date()) <= 6) and
	cc.cod_conta not in(select cod_conta from registro_deposito where timestampdiff(month,dt_deposito, current_date()) <= 6);

# 2 - B)
select cc.cod_conta, year(rd.dt_deposito), month(rd.dt_deposito), if(sum(rd.valor_deposito) is not null, concat('Depositos: ',cast(sum(rd.valor_deposito) as char)), "Sem registro de deposito")
from conta_corrente cc 
	left join registro_deposito rd on rd.cod_conta  = cc.cod_conta 
group by cc.cod_conta, year(rd.dt_deposito), month(rd.dt_deposito)
union
select cc.cod_conta, year(rs.dt_saque), month(rs.dt_saque), if(sum(rs.valor_saque) is not null,concat('Saques: ',cast(sum(rs.valor_saque) as char)), "Sem registro de saque")
from conta_corrente cc 
	left join registro_saque rs on rs.cod_conta = cc.cod_conta
group by cc.cod_conta, year(rs.dt_saque), month(rs.dt_saque);

# 2 - C)

select cc.cod_conta, 
from cliente c;

