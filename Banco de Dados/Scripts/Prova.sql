-- 1)

INSERT INTO Usuario(nome_user, sexo, dt_nasc,email,cpf) 
VALUES 	("Jose Carlos", "M", "1998-01-06", "jose@email.com","12345678900"),
		("Maria Clara", "F", "1999-01-06", "maria.clara@email.com","12345678901"),
		("Bruno Jose", "M", "2000-01-06", "bruno@email.com","12345678902"),
		("Daniel Matos", "M", "2001-01-06", "daniel@email.com","12345678903"),
		("Maria Paula", "F", "2002-01-06", "maria.paula@email.com","12345678904"),
		("Jose Carlos 2", "M", "1998-01-06", "jose@email.com","12345678900"),
		("Maria Clara 2", "F", "1999-01-06", "maria.clara@email.com","12345678901"),
		("Bruno Jose 2", "M", "2000-01-06", "bruno@email.com","12345678902"),
		("Daniel Matos 2", "M", "2001-01-06", "daniel@email.com","12345678903"),
		("Maria Paula 2", "F", "2002-01-06", "maria.paula@email.com","12345678904");
		
INSERT INTO	categoria (nome_categoria) values ("Ensino"),("Pesquisa"),("Extensão");

INSERT INTO atividade (titulo, carga_horaria, tipo_atividade, dt_inicio_inscricao, dt_fim_inscricao, dt_realizacao, valor_ingresso, cod_categoria)
VALUES ("Banco de dados - Cricia", 4, "Palestra", "2023-04-01", "2023-05-01", "2023-05-10",150.00, 1),
		("Java Script - Wilton", 8, "Roda de Conversa", "2023-04-01", "2023-05-01", "2023-05-10",250.00, 3),
		("Teste automatizados - Bruno", 4, "Mesa Redonda", "2023-05-01", "2023-06-01", "2023-06-10",100.00, 2),
		("POO - Cibele", 4, "Palestra", "2023-05-01", "2023-06-01", "2023-06-10",300.00, 2),
		("Projeto Backend - Camilo", 12, "Palestra", "2023-05-01", "2023-06-01", "2023-06-10",500.00, 2),
		("Aula de extensão", 40, "Roda de Conversa", "2023-04-01", "2023-05-01", "2023-05-10",250.00, 3);

INSERT INTO inscricao (dt_inscricao, cod_user, cod_atividade)
VALUES ("2023-04-02 12:00:00",1,1),
		("2023-04-02 12:00:00",2,1),
		("2023-04-02 12:00:00",3,2),
		("2023-04-02 12:00:00",4,2),
		("2023-05-02 12:00:00",1,3),
		("2023-05-02 12:00:00",2,3),
		("2023-05-02 12:00:00",3,4),
		("2023-05-02 12:00:00",4,4),
		("2023-05-03 12:00:00",1,5),
		("2023-05-03 12:00:00",2,5),
		("2023-04-02 12:00:00",3,1),
		("2023-04-02 12:00:00",3,1),
		("2023-04-02 12:00:00",3,2),
		("2023-04-02 12:00:00",3,3),
		("2023-04-02 12:00:00",3,4),
		("2023-04-02 12:00:00",3,5),
		("2023-04-02 12:00:00",3,1),
		("2023-04-02 12:00:00",3,2),
		("2023-04-02 12:00:00",3,3),
		("2023-04-02 12:00:00",3,4),
		("2023-04-02 12:00:00",3,5),
		("2023-04-02 12:00:00",3,1),
		("2023-04-02 12:00:00",4,3);

SELECT * FROM usuario u;
SELECT * FROM atividade a;
SELECT * FROM inscricao WHERE cod_atividade = 3;
	
	
	

	
-- 1-A
SELECT a.titulo, a.tipo_atividade, c.nome_categoria, count(*)
FROM atividade a
	JOIN categoria c ON c.cod_categoria = a.cod_categoria
	JOIN inscricao i ON i.cod_atividade  = a.cod_atividade
WHERE YEAR(a.dt_realizacao) = 2023
GROUP BY 1, 2, 3
LIMIT 10;

-- 1-B
SELECT u.nome_user, SUM((a.carga_horaria / 40) * 4)
FROM usuario u
     JOIN inscricao i ON u.cod_user = i.cod_user
     JOIN atividade a ON i.cod_atividade = a.cod_atividade
     JOIN categoria c ON a.cod_categoria = c.cod_categoria
WHERE c.nome_categoria = 'Extensão'
GROUP BY 1;


-- 1-C
SELECT YEAR(a.dt_realizacao), MONTH(a.dt_realizacao), sum(valor_ingresso)
FROM atividade a
	JOIN categoria c ON c.cod_categoria = a.cod_categoria 
	JOIN inscricao i ON i.cod_atividade = a.cod_atividade
WHERE nome_categoria = "Ensino" OR nome_categoria = "Pesquisa"
GROUP BY 1, 2, nome_categoria;


-- 1-D
SELECT DISTINCT u.nome_user, TIMESTAMPDIFF(year, dt_nasc ,now()) AS idade, u.sexo 
FROM usuario u 
	JOIN inscricao i ON u.cod_user = i.cod_user  
	JOIN atividade a ON i.cod_atividade = a.cod_atividade
WHERE a.tipo_atividade = "Mesa Redonda";

-- 2 - A
SELECT a.titulo, c.nome_categoria
FROM atividade a
	JOIN categoria c ON a.cod_categoria = c.cod_categoria
WHERE a.cod_atividade = (SELECT  a.cod_atividade  
							FROM atividade a
								JOIN categoria c ON c.cod_categoria = a.cod_categoria 
								JOIN inscricao i ON i.cod_atividade = a.cod_atividade
							WHERE year(a.dt_realizacao) = 2023
							GROUP BY 1
							ORDER BY SUM(valor_ingresso) DESC
							LIMIT 1);

-- 2 - B
SELECT u.nome_user, u.email
FROM usuario u
WHERE u.cod_user NOT IN (SELECT i.cod_user
                        	FROM inscricao i
                         		INNER JOIN atividade a ON i.cod_atividade = a.cod_atividade
                         	WHERE a.dt_realizacao >= DATE_SUB(NOW(), INTERVAL 3 MONTH));
-- 2 - C
SELECT a.titulo, DATEDIFF(a.dt_fim_inscricao, a.dt_inicio_inscricao), a.valor_ingresso
FROM atividade a
WHERE a.cod_atividade IN (SELECT a.cod_atividade  
							FROM atividade a
								JOIN categoria c ON a.cod_categoria = c.cod_categoria
							WHERE a.dt_realizacao > NOW() AND c.nome_categoria IN ('Extensão', 'Pesquisa'));

-- 2 - D
SELECT u.nome_user, u.sexo, TIMESTAMPDIFF(YEAR, u.dt_nasc, now())
FROM usuario u
    JOIN inscricao i ON u.cod_user = i.cod_user
	JOIN atividade a ON i.cod_atividade = a.cod_atividade
WHERE a.valor_ingresso > (SELECT AVG(valor_ingresso) FROM atividade);


-- 3
SELECT u.nome_user AS "Nome do Usuário", concat(sum(a.carga_horaria), " horas") AS "Carga Horária Total", "Carga Horária Suficiente" AS "Situação"
FROM usuario u 
	JOIN inscricao i ON u.cod_user = i.cod_user 
	JOIN atividade a ON i.cod_atividade = a.cod_atividade
GROUP BY u.cod_user
HAVING sum(a.carga_horaria) > 200
UNION
SELECT u.nome_user AS "Nome do Usuário", concat(IF(sum(a.carga_horaria)IS NULL, 0, sum(a.carga_horaria)), " horas") AS "Carga Horária Total", "Carga Horária Insuficiente" AS "Situação"
FROM usuario u
	LEFT JOIN inscricao i ON u.cod_user = i.cod_user
	LEFT JOIN atividade a ON a.cod_atividade = i.cod_atividade
GROUP BY 1
HAVING sum(a.carga_horaria) <= 200 OR sum(a.carga_horaria) IS NULL
ORDER BY 2 DESC;


-- 4)
-- a) F - as visões são como tabelas virtuais, ela e criada apartir um uma ou varias tabelas fisicas;
-- b) F - Uma visão não pode fazer atualizações em tabelas que possuem função agregada ou agrupamento;
-- c) F - as visões compostas por agregações não pode permitem o Update, Insert, Delete, pois para conseguir realizar tais operações os campos da visão devem referenciar diretamente as tableas fisicas.
-- d) F - O comando correto e o drop view nome_visao;






  



	
	