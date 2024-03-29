DROP DATABASE IF EXISTS BDEvento;

CREATE DATABASE BDEvento;

USE BDEvento;

CREATE TABLE Organizador (
  id_organizador INT PRIMARY KEY AUTO_INCREMENT,
  nome_organizador VARCHAR(50) NOT NULL,
  cnpj VARCHAR(19) NOT NULL,
  telefone VARCHAR(15) NOT NULL,
  email VARCHAR(50) NOT NULL
);

CREATE TABLE Tipo_Evento(
	id_tipo_evento INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(100) NOT NULL
);

CREATE TABLE Evento (
  id_evento INT PRIMARY KEY AUTO_INCREMENT,
  nome_evento VARCHAR(50) NOT NULL,
  data_inicio DATE NOT NULL,
  data_fim DATE NOT NULL,
  local_evento VARCHAR(50) NOT NULL,
  id_organizador INT NOT NULL,
  id_tipo_evento INT NOT NULL,
  idade_minima int NOT NULL,
  FOREIGN KEY (id_tipo_evento) REFERENCES Tipo_Evento(id_tipo_evento),
  FOREIGN KEY (id_organizador) REFERENCES Organizador(id_organizador)
);

CREATE TABLE Participante (
  id_participante INT PRIMARY KEY AUTO_INCREMENT,
  nome_participante VARCHAR(50) NOT NULL,
  telefone VARCHAR(15) NOT NULL,
  email VARCHAR(50) NOT NULL,
  sexo CHAR(50) NOT NULL,
  data_nascimento DATE NOT NULL,
  cpf VARCHAR(50) NOT NULL
);

CREATE TABLE Registro_Acesso (
  id_registro_acesso INT PRIMARY KEY AUTO_INCREMENT,
  id_participante INT NOT NULL,
  id_evento INT NOT NULL,
  data_acesso DATE NOT NULL,
  hora_acesso TIME NOT NULL,
  FOREIGN KEY (id_participante) REFERENCES Participante(id_participante),
  FOREIGN KEY (id_evento) REFERENCES Evento(id_evento)
);

CREATE TABLE Tipo_Acesso (
  id_tipo_acesso INT PRIMARY KEY AUTO_INCREMENT,
  descricao_tipo_acesso VARCHAR(50) NOT NULL
);

CREATE TABLE Acesso (
  id_acesso INT PRIMARY KEY AUTO_INCREMENT,
  id_participante INT NOT NULL,
  id_evento INT NOT NULL,
  id_tipo_acesso INT NOT NULL,
  data_validade_inicio DATE NOT NULL,
  data_validade_fim DATE NOT NULL,
  valor DOUBLE NOT NULL,
  FOREIGN KEY (id_participante) REFERENCES Participante(id_participante),
  FOREIGN KEY (id_evento) REFERENCES Evento(id_evento),
  FOREIGN KEY (id_tipo_acesso) REFERENCES Tipo_Acesso(id_tipo_acesso)
);

INSERT INTO Organizador (nome_organizador, telefone, email, cnpj)
VALUES ('Empresa A', '(11) 1111-1111', 'empresaA@email.com','12.509.554/0001-06'),
       ('Empresa B', '(22) 2222-2222', 'empresaB@email.com','41.621.469/0001-25'),
       ('Empresa C', '(33) 3333-3333', 'empresaC@email.com','12.268.543/0001-73'),
       ('Empresa D', '(44) 4444-4444', 'empresaD@email.com','35.384.982/0001-47'),
       ('Empresa E', '(55) 5555-5555', 'empresaE@email.com','85.044.138/0001-45'),
       ('Empresa F', '(66) 6666-6666', 'empresaF@email.com','86.104.813/0001-47');
      
INSERT INTO	Tipo_Evento (nome) 
VALUES	('Feira'),
		('Festival'),
		('Conferência'),
		('Encontros de Networking'),
		('Reunião'),
		('Treinamento');
	
INSERT INTO Evento (nome_evento, data_inicio, data_fim, local_evento,idade_minima, id_organizador, id_tipo_evento) 
VALUES ('Feira de Tecnologia', '2023-05-01', '2023-05-05', 'Centro de Convenções', 18, 1, 1),
       ('Festival de Música', '2023-06-15', '2023-06-18', 'Parque Municipal', 18, 2, 2),
       ('Conferência de Negócios', '2023-07-10', '2023-07-12', 'Hotel Sheraton', 18, 3, 3),
       ('Conferência de Marketing Digital', '2023-08-01', '2023-08-03', 'Centro de Convenções',18, 4, 3),
       ('Festival de Cinema', '2023-09-15', '2023-09-18', 'Cine Teatro Municipal',10, 5, 2),
       ('Feira de Livros', '2023-10-20', '2023-10-22', 'Praça da Cidade',8, 6, 1),
       ('Treinamento de Java', '2023-01-01', '2023-03-01', 'Sala de reunião IFTM', 18, 6, 1);

INSERT INTO Participante (nome_participante, telefone, email,sexo,data_nascimento, cpf)
VALUES ('Marcos Silva', '(11) 9999-9999', 'marcos@email.com','M','1997-01-01','102.111.736-65'),
       ('Maria Souza', '(22) 8888-8888', 'maria@email.com','F','1991-03-23','121.140.576-15'),
       ('Pedro Santos', '(33) 7777-7777', 'pedro@email.com','M','1990-02-06','113.341.156-80'),
       ('João Silva', '(11) 1111-2222', 'joao@email.com','M','2000-12-25','121.142.126-02'),
       ('Marilia Santos', '(22) 2222-3333', 'marilia@email.com','F','2003-06-05','023.213.016-78'),
       ('Lucas Oliveira', '(33) 3333-4444', 'lucas@email.com','M','1967-08-21','112.221.176-73');
      
INSERT INTO Tipo_Acesso (descricao_tipo_acesso)
VALUES ('Ingresso Normal'),
       ('Ingresso VIP'),
       ('Passe de 3 dias'),
       ('Ingresso Estudante');

INSERT INTO Registro_Acesso (id_participante, id_evento, data_acesso, hora_acesso)
VALUES (1, 1, '2023-05-01', '10:00:00'),
       (2, 1, '2023-05-03', '14:30:00'),
       (3, 2, '2023-06-15', '18:00:00'),
       (2, 1, '2023-08-01', '10:30:00'),
       (1, 2, '2023-09-16', '18:00:00'),
       (3, 3, '2023-10-22', '14:30:00');

INSERT INTO Acesso (id_participante, id_evento, id_tipo_acesso, data_validade_inicio, data_validade_fim, valor)
VALUES (1, 1, 1, '2023-05-01', '2023-05-01', 50.0),
       (2, 1, 2, '2023-05-01', '2023-05-05', 100.0),
       (3, 2, 3, '2023-06-15', '2023-06-17',150.0),
       (1, 1, 4, '2023-08-01', '2023-08-03',25.0),
       (2, 2, 4, '2023-09-15', '2023-09-18',25.0),
       (3, 3, 4, '2023-10-20', '2023-10-22',25.0);

      
-- QUESTÃO 04
-- Relatório com a contagem de participantes por evento
SELECT e.nome_evento, 
       (SELECT COUNT(*) FROM Acesso a WHERE a.id_evento = e.id_evento) AS qtd_participantes
FROM Evento e;

-- Relatório com a lista de participantes que acessaram um determinado evento
SELECT
	p.nome_participante,
	r.data_acesso,
	r.hora_acesso,
	e.nome_evento
FROM
	Participante p
JOIN Registro_Acesso r ON
	r.id_participante = p.id_participante
JOIN Evento e ON
	e.id_evento = r.id_evento
JOIN Acesso a ON
	a.id_participante = p.id_participante
	AND a.id_evento = e.id_evento
WHERE
	e.nome_evento = 'Feira de Tecnologia';

-- Relatório com a lista de eventos que um determinado participante acessou
SELECT e.nome_evento, a.data_validade_inicio, a.data_validade_fim
FROM Evento e
JOIN Acesso a ON a.id_evento = e.id_evento
JOIN Participante p ON p.id_participante = a.id_participante
WHERE p.nome_participante = 'Maria Souza';

-- Relatório com a lista de participantes que acessaram um evento VIP
SELECT p.nome_participante, p.email, e.nome_evento, t.descricao_tipo_acesso
FROM Participante p
JOIN Acesso a ON a.id_participante = p.id_participante
JOIN Evento e ON e.id_evento = a.id_evento
JOIN Tipo_Acesso t ON t.id_tipo_acesso = a.id_tipo_acesso
WHERE t.descricao_tipo_acesso = 'Ingresso VIP';

-- Relatório com a lista de eventos que um determinado organizador está responsável
SELECT e.nome_evento, o.nome_organizador
FROM Evento e
JOIN Organizador o ON o.id_organizador = e.id_organizador
WHERE o.nome_organizador = 'Empresa B';

-- Relatório com a lista de participantes que acessaram um evento em uma determinada data
SELECT p.nome_participante, e.nome_evento, r.data_acesso, r.hora_acesso
FROM Participante p
JOIN Registro_Acesso r ON r.id_participante = p.id_participante
JOIN Evento e ON e.id_evento = r.id_evento
WHERE r.data_acesso = '2023-08-01';


-- QUESTÃO 05
-- Lista de eventos e seus organizadores
SELECT Evento.nome_evento, Organizador.nome_organizador
FROM Evento
INNER JOIN Organizador ON Evento.id_organizador = Organizador.id_organizador;

-- Lista de participantes que acessaram um determinado evento
SELECT Participante.nome_participante, Registro_Acesso.data_acesso, Registro_Acesso.hora_acesso
FROM Participante
INNER JOIN Registro_Acesso ON Participante.id_participante = Registro_Acesso.id_participante
WHERE Registro_Acesso.id_evento = 3;

-- Lista de eventos e seus tipos de acesso disponíveis
SELECT Evento.nome_evento, Tipo_Acesso.descricao_tipo_acesso
FROM Evento
LEFT JOIN Acesso ON Evento.id_evento = Acesso.id_evento
LEFT JOIN Tipo_Acesso ON Acesso.id_tipo_acesso = Tipo_Acesso.id_tipo_acesso;

-- Lista de participantes que possuem acesso a um determinado evento
SELECT Participante.nome_participante, Acesso.data_validade_inicio, Acesso.data_validade_fim
FROM Participante
INNER JOIN Acesso ON Participante.id_participante = Acesso.id_participante
WHERE Acesso.id_evento = 1;
-- Lista de eventos que ainda não tiveram nenhum acesso registrado
SELECT Evento.nome_evento
FROM Evento
LEFT JOIN Registro_Acesso ON Evento.id_evento = Registro_Acesso.id_evento
WHERE Registro_Acesso.id_evento IS NULL;

-- Lista de participantes e seus eventos de acesso
SELECT Participante.nome_participante, Evento.nome_evento
FROM Participante
INNER JOIN Acesso ON Participante.id_participante = Acesso.id_participante
INNER JOIN Evento ON Acesso.id_evento = Evento.id_evento;

-- QUESTÃO 06
-- Lista de todos os participantes e organizadores cadastrados
SELECT nome_participante AS nome, 'participante' AS tipo
FROM Participante
UNION
SELECT nome_organizador AS nome, 'organizador' AS tipo
FROM Organizador;

-- Lista de eventos e participantes cadastrados, agrupados por evento
SELECT Evento.nome_evento, Participante.nome_participante
FROM Evento
INNER JOIN Acesso ON Evento.id_evento = Acesso.id_evento
INNER JOIN Participante ON Acesso.id_participante = Participante.id_participante
UNION ALL
SELECT Evento.nome_evento, 'Nenhum participante cadastrado' AS nome_participante
FROM Evento
LEFT JOIN Acesso ON Evento.id_evento = Acesso.id_evento
WHERE Acesso.id_participante IS NULL
ORDER BY nome_evento, nome_participante;

-- QUESTÃO 07
-- Participantes com acesso válido em um evento
CREATE VIEW vw_participantes_acesso_valido AS
SELECT Participante.nome_participante, Evento.nome_evento, Acesso.data_validade_inicio, Acesso.data_validade_fim
FROM Participante
INNER JOIN Acesso ON Participante.id_participante = Acesso.id_participante
INNER JOIN Evento ON Acesso.id_evento = Evento.id_evento
WHERE Acesso.data_validade_inicio <= NOW() AND Acesso.data_validade_fim >= NOW();

SELECT * FROM vw_participantes_acesso_valido;

-- Quantidade de acessos por tipo em um evento
CREATE VIEW vw_quantidade_acessos_por_tipo AS
SELECT Tipo_Acesso.descricao_tipo_acesso, COUNT(Acesso.id_acesso) AS quantidade_acessos, Evento.nome_evento
FROM Acesso
INNER JOIN Tipo_Acesso ON Acesso.id_tipo_acesso = Tipo_Acesso.id_tipo_acesso
INNER JOIN Evento ON Acesso.id_evento = Evento.id_evento
GROUP BY Tipo_Acesso.id_tipo_acesso, Evento.nome_evento;

SELECT * FROM vw_quantidade_acessos_por_tipo ;

-- Quantidade de eventos por organizador
CREATE VIEW vw_quantidade_eventos_por_organizador AS
SELECT Organizador.nome_organizador, COUNT(Evento.id_evento) AS quantidade_eventos
FROM Organizador
LEFT JOIN Evento ON Organizador.id_organizador = Evento.id_organizador
GROUP BY Organizador.id_organizador;

SELECT * FROM vw_quantidade_eventos_por_organizador;