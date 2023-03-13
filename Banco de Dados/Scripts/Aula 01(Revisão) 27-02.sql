#Aluno: Lucas Ilussencio da Silva - 3° Periodo - Sistemas para Internet
use theGame;
#ATIVIDADE 1
#1)
#a)
select j.nickname, j.sexo, j.pontuacao, j.moedas, p.habilidade, a.dt_hora_aquisicao
from Jogador j 
	join adquire_poder a on a.cod_jogador = j.cod_jogador
	join poder p on a.cod_poder = p.cod_poder
order by a.dt_hora_aquisicao desc;

#b)
select p.cod_partida, p.data_hora_inicio, p.data_hora_termino, p.pontos_obtidos, c.caracteristicas
from partida p
	join cenario c on p.cod_cenario = c.cod_cenario
    join jogador j on p.cod_jogador = j.cod_jogador
where
	j.nome = 'Roberto Carlos';
    
#c)
select j.nome, j.nickname, j.sexo, j.email, j.dt_nasc, j.pontuacao, j.moedas
from jogador j
	join partida p on p.cod_jogador = j.cod_jogador
    join cenario c on p.cod_cenario = c.cod_cenario
where
	c.caracteristicas != 'Terrestre';
    
#d)
select j.nome, j.sexo, j.dt_nasc, p.data_hora_inicio
from jogador j
	join partida p on p.cod_jogador = j.cod_jogador
where
	hour(p.data_hora_inicio) <= 18 and month(p.data_hora_inicio) = 6;
    
#f)
select p.habilidade
from jogador j
	join adquire_poder a on j.cod_jogador = a.cod_jogador
    join poder p on p.cod_poder = a.cod_poder
where
	j.nome = 'Maria Clara' and month(a.dt_hora_aquisicao) = '06' and year(a.dt_hora_aquisicao) = '2021';
    
#2
#a)
select j.nome, count(*)
from jogador j
	join partida p on j.cod_jogador = p.cod_jogador
group by p.cod_jogador;

#b)
select month(p.data_hora_inicio), day(p.data_hora_inicio), count(*)
from partida p
where
	year(p.data_hora_inicio) = '2021'
group by 1,2;

#c)
select j.nome, sum(p.pontos_obtidos)
from jogador j
	join partida p on j.cod_jogador = p.cod_jogador
group by p.cod_jogador
having
	sum(p.pontos_obtidos) >= 200;
    
#d)
select c.caracteristicas, count(*)
from partida p
	join cenario c on p.cod_cenario = c.cod_cenario
group by c.cod_cenario;

#e)
select j.nome, count(*)
from jogador j
	join adquire_poder a on j.cod_jogador = a.cod_jogador
group by a.cod_poder
order by 2 desc;
