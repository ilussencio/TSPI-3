CREATE DATABASE BDEvento;

USE BDEvento;

CREATE TABLE Organizador (
  id_organizador INT PRIMARY KEY AUTO_INCREMENT,
  nome_organizador VARCHAR(50) NOT NULL,
  telefone VARCHAR(15) NOT NULL,
  email VARCHAR(50) NOT NULL
);


CREATE TABLE Evento (
  id_evento INT PRIMARY KEY AUTO_INCREMENT,
  nome_evento VARCHAR(50) NOT NULL,
  data_inicio DATE NOT NULL,
  data_fim DATE NOT NULL,
  local_evento VARCHAR(50) NOT NULL,
  id_organizador INT NOT NULL,
  FOREIGN KEY (id_organizador) REFERENCES Organizador(id_organizador)
);


CREATE TABLE Participante (
  id_participante INT PRIMARY KEY AUTO_INCREMENT,
  nome_participante VARCHAR(50) NOT NULL,
  telefone VARCHAR(15) NOT NULL,
  email VARCHAR(50) NOT NULL
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
  FOREIGN KEY (id_participante) REFERENCES Participante(id_participante),
  FOREIGN KEY (id_evento) REFERENCES Evento(id_evento),
  FOREIGN KEY (id_tipo_acesso) REFERENCES Tipo_Acesso(id_tipo_acesso)
);

INSERT INTO Organizador (nome_organizador, telefone, email)
VALUES ('Empresa A', '(11) 1111-1111', 'empresaA@email.com'),
       ('Empresa B', '(22) 2222-2222', 'empresaB@email.com'),
       ('Empresa C', '(33) 3333-3333', 'empresaC@email.com'),
       ('Empresa D', '(44) 4444-4444', 'empresaD@email.com'),
       ('Empresa E', '(55) 5555-5555', 'empresaE@email.com'),
       ('Empresa F', '(66) 6666-6666', 'empresaF@email.com');

INSERT INTO Evento (nome_evento, data_inicio, data_fim, local_evento, id_organizador) 
VALUES ('Feira de Tecnologia', '2023-05-01', '2023-05-05', 'Centro de Convenções', 1),
       ('Festival de Música', '2023-06-15', '2023-06-18', 'Parque Municipal', 2),
       ('Conferência de Negócios', '2023-07-10', '2023-07-12', 'Hotel Sheraton', 3),
       ('Conferência de Marketing Digital', '2023-08-01', '2023-08-03', 'Centro de Convenções', 4),
       ('Festival de Cinema', '2023-09-15', '2023-09-18', 'Cine Teatro Municipal', 5),
       ('Feira de Livros', '2023-10-20', '2023-10-22', 'Praça da Cidade', 6);



INSERT INTO Participante (nome_participante, telefone, email)
VALUES ('Marcos Silva', '(11) 9999-9999', 'marcos@email.com'),
       ('Maria Souza', '(22) 8888-8888', 'maria@email.com'),
       ('Pedro Santos', '(33) 7777-7777', 'pedro@email.com'),
       ('João Silva', '(11) 1111-2222', 'joao@email.com'),
       ('Marilia Santos', '(22) 2222-3333', 'marilia@email.com'),
       ('Lucas Oliveira', '(33) 3333-4444', 'lucas@email.com');
      
INSERT INTO Tipo_Acesso (descricao_tipo_acesso)
VALUES ('Ingresso Normal'),
       ('Ingresso VIP'),
       ('Passe de 3 dias'),
       ('Ingresso VIP'),
       ('Ingresso Estudante');

INSERT INTO Registro_Acesso (id_participante, id_evento, data_acesso, hora_acesso)
VALUES (1, 1, '2023-05-01', '10:00:00'),
       (2, 1, '2023-05-03', '14:30:00'),
       (3, 2, '2023-06-15', '18:00:00'),
       (2, 1, '2023-08-01', '10:30:00'),
       (1, 2, '2023-09-16', '18:00:00'),
       (3, 3, '2023-10-22', '14:30:00');



INSERT INTO Acesso (id_participante, id_evento, id_tipo_acesso, data_validade_inicio, data_validade_fim)
VALUES (1, 1, 1, '2023-05-01', '2023-05-01'),
       (2, 1, 2, '2023-05-01', '2023-05-05'),
       (3, 2, 3, '2023-06-15', '2023-06-17'),
       (1, 1, 4, '2023-08-01', '2023-08-03'),
       (2, 2, 5, '2023-09-15', '2023-09-18'),
       (3, 3, 4, '2023-10-20', '2023-10-22');
      
      
-- Relatório com a contagem de participantes por evento:

SELECT e.nome_evento, 
       (SELECT COUNT(*) FROM Acesso a WHERE a.id_evento = e.id_evento) AS qtd_participantes
FROM Evento e;

-- Relatório com a lista de participantes que acessaram um determinado evento:
SELECT
	p.nome_participante,
	r.data_acesso,
	r.hora_acesso
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

-- Relatório com a lista de eventos que um determinado participante acessou:
SELECT e.nome_evento, a.data_validade_inicio, a.data_validade_fim
FROM Evento e
JOIN Acesso a ON a.id_evento = e.id_evento
JOIN Participante p ON p.id_participante = a.id_participante
WHERE p.nome_participante = 'Maria Souza';

-- Relatório com a lista de participantes que acessaram um evento VIP:
SELECT p.nome_participante, e.nome_evento, t.descricao_tipo_acesso
FROM Participante p
JOIN Acesso a ON a.id_participante = p.id_participante
JOIN Evento e ON e.id_evento = a.id_evento
JOIN Tipo_Acesso t ON t.id_tipo_acesso = a.id_tipo_acesso
WHERE t.descricao_tipo_acesso = 'Ingresso VIP';

-- Relatório com a lista de eventos que um determinado organizador está responsável:
SELECT e.nome_evento, o.nome_organizador
FROM Evento e
JOIN Organizador o ON o.id_organizador = e.id_organizador
WHERE o.nome_organizador = 'Empresa B';

-- Relatório com a lista de participantes que acessaram um evento em uma determinada data:
SELECT p.nome_participante, e.nome_evento, r.data_acesso, r.hora_acesso
FROM Participante p
JOIN Registro_Acesso r ON r.id_participante = p.id_participante
JOIN Evento e ON e.id_evento = r.id_evento
WHERE r.data_acesso = '2023-08-01';

-- drop database BDEvento