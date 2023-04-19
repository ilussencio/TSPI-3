-- Relatório 1 - Lista de eventos e seus organizadores:
SELECT Evento.nome_evento, Organizador.nome_organizador
FROM Evento
INNER JOIN Organizador ON Evento.id_organizador = Organizador.id_organizador;

-- Relatório 2 - Lista de participantes que acessaram um determinado evento
SELECT Participante.nome_participante, Registro_Acesso.data_acesso, Registro_Acesso.hora_acesso
FROM Participante
INNER JOIN Registro_Acesso ON Participante.id_participante = Registro_Acesso.id_participante
WHERE Registro_Acesso.id_evento = 3;

-- Relatório 3 - Lista de eventos e seus tipos de acesso disponíveis:
SELECT Evento.nome_evento, Tipo_Acesso.descricao_tipo_acesso
FROM Evento
LEFT JOIN Acesso ON Evento.id_evento = Acesso.id_evento
LEFT JOIN Tipo_Acesso ON Acesso.id_tipo_acesso = Tipo_Acesso.id_tipo_acesso;

-- Relatório 4 - Lista de participantes que possuem acesso a um determinado evento:
SELECT Participante.nome_participante, Acesso.data_validade_inicio, Acesso.data_validade_fim
FROM Participante
INNER JOIN Acesso ON Participante.id_participante = Acesso.id_participante
WHERE Acesso.id_evento = <id_do_evento>;
-- Relatório 5 - Lista de eventos que ainda não tiveram nenhum acesso registrado:
SELECT Evento.nome_evento
FROM Evento
LEFT JOIN Registro_Acesso ON Evento.id_evento = Registro_Acesso.id_evento
WHERE Registro_Acesso.id_evento IS NULL;

-- Relatório 6 - Lista de participantes e seus eventos de acesso:
SELECT Participante.nome_participante, Evento.nome_evento
FROM Participante
INNER JOIN Acesso ON Participante.id_participante = Acesso.id_participante
INNER JOIN Evento ON Acesso.id_evento = Evento.id_evento;

-- QUESTÃO 05
-- Lista de todos os participantes e organizadores cadastrados:
SELECT nome_participante AS nome, 'participante' AS tipo
FROM Participante
UNION
SELECT nome_organizador AS nome, 'organizador' AS tipo
FROM Organizador;

-- Lista de eventos e participantes cadastrados, agrupados por evento:
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

-- QUESTÃO 06
-- Participantes com acesso válido em um evento:
CREATE VIEW vw_participantes_acesso_valido AS
SELECT Participante.nome_participante, Evento.nome_evento, Acesso.data_validade_inicio, Acesso.data_validade_fim
FROM Participante
INNER JOIN Acesso ON Participante.id_participante = Acesso.id_participante
INNER JOIN Evento ON Acesso.id_evento = Evento.id_evento
WHERE Acesso.data_validade_inicio <= NOW() AND Acesso.data_validade_fim >= NOW();

-- Quantidade de acessos por tipo em um evento:
CREATE VIEW vw_quantidade_acessos_por_tipo AS
SELECT Tipo_Acesso.descricao_tipo_acesso, COUNT(Acesso.id_acesso) AS quantidade_acessos, Evento.nome_evento
FROM Acesso
INNER JOIN Tipo_Acesso ON Acesso.id_tipo_acesso = Tipo_Acesso.id_tipo_acesso
INNER JOIN Evento ON Acesso.id_evento = Evento.id_evento
GROUP BY Tipo_Acesso.id_tipo_acesso, Evento.nome_evento;
SELECT * FROM vw_quantidade_eventos_por_organizador ;

-- Quantidade de eventos por organizador:
CREATE VIEW vw_quantidade_eventos_por_organizador AS
SELECT Organizador.nome_organizador, COUNT(Evento.id_evento) AS quantidade_eventos
FROM Organizador
LEFT JOIN Evento ON Organizador.id_organizador = Evento.id_organizador
GROUP BY Organizador.id_organizador;

SELECT * FROM vw_quantidade_eventos_por_organizador ;

