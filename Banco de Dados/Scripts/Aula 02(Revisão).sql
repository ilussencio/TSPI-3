#Aluno: Lucas Ilussencio da Silva - 3° Periodo - Sistemas para Internet
use theGame;

-- Selecione o nome do jogador e a quantidade de dias decorridos desde a sua última partida.
select nome, max(p.data_hora_termino), timestampdiff(day, p.data_hora_termino, now())
from jogador j
	join partida p on j.cod_jogador = p.cod_jogador
group by nome;

-- Selecione o nome do jogador, data da partida e o tempo gasto em na partida em horas
select j.nome, date(p.data_hora_inicio), timestampdiff(hour, p.data_hora_inicio, p.data_hora_termino) 
from jogador j
	join partida p on j.cod_jogador = p.cod_jogador
group by j.nome;

-- Para cada um dos jogadores, listar o nickname e a média de minutos gastos em partidas.
select j.nickname, avg(timestampdiff(minute , p.data_hora_inicio, p.data_hora_termino) )
from jogador j
	join partida p on j.cod_jogador = p.cod_jogador
group by nome;

-- Listar o nome do jogador, sua idade e a classificação de menor de idade oumaior de idade.
select nome, 
	timestampdiff(year, dt_nasc, now()), 
	if(timestampdiff(year, dt_nasc, now()) >= 18, "MAIOR DE IDADE", "MENOR DE IDADE" )
from jogador;

-- Listar o nome do jogador junto com seu nickname (ex.: Roberto Carlos - robcar), tempo gasto em partidas em minutos e um alerta de risco de vício
-- caso o jogador tenha tempo superior a 90 minutos.
select concat_ws(' - ',j.nome,j.nickname),
		avg(timestampdiff(minute , p.data_hora_inicio, p.data_hora_termino)),
		if(avg(timestampdiff(minute , p.data_hora_inicio, p.data_hora_termino)) >= 80, "RISCO DE VICIO", "NÃO POSSUI RISCO DE VICIO")
from jogador j
	join partida p on j.cod_jogador = p.cod_jogador
group by j.nome;
	

