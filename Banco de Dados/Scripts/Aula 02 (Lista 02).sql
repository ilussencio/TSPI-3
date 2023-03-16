use brasil;
show tables;
-- a. Listar em ordem decrescente os 10 estados com maior PIB (Top 10) em 2010.
select e.nome
from estado e
	join pib_estado p on p.id_estado = e.id
where p.ano_pib = 2010
order by valor_pib desc
limit 10;

-- b. Para todos os estados, listar o nome do estado e sua média de PIB.
select e.nome, format(avg(p.valor_pib), 2)
from estado e
	join pib_estado p on p.id_estado = e.id
group by e.uf;

-- c. Listar o ano e o PIB total do país para cada ano.
select p.ano_pib, sum(p.valor_pib)
from estado e
	join pib_estado p on e.id = p.id_estado
group by 1;

-- d. O nome do estado e o percentual de aumento (ou decréscimo) observado no PIB de 2015 em relação a 2010.
select e.nome,
	format(((p2015.valor_pib * 100) / p2010.valor_pib) - 100,2)
from estado e
	join pib_estado p2010 on p2010.id_estado = e.id
	join pib_estado p2015 on p2015 .id_estado = e.id 
where 
	p2015.ano_pib = 2015 and p2010.ano_pib = 2010
group by e.uf;

-- e. O nome do estado, quantidade de cidades, e o PIB por cidade (considerar a divisão igualitária entre as cidades do estado).

select e.nome, count(c.id),  p.valor_pib / count(c.id)
from estado e
	join cidade c on c.id_estado = e.id
	join pib_estado p on p.id_estado = e.id 
where p.ano_pib = 2017
group by e.id;


-- f. Listar o ano, a região, o valor do PIB correspondente a ela, bem como o menor e o maior valor do PIB para cada ano.
select p.ano_pib, e.regiao, sum(p.valor_pib), min(p.valor_pib), max(p.valor_pib)
from estado e
	join pib_estado p on e.id = p.id_estado 
group by e.uf, p.ano_pib;

-- g. Considerando o PIB do ano de 2017, listar a região e o percentual de participação da região em relação ao PIB total do país.
select e.regiao, format(((p2017.valor_pib * 100) / pbr.valor_pib) - 100 ,2)
from estado e
	join pib_estado p2017 on e.id = p2017.id_estado
	join pib_estado pbr on pbr.id_estado = e.id
where p2017.ano_pib = 2017
group by e.regiao;


-- h. Listar as informações de todos os estados que tiveram PIB superior ao PIB de Goiás no ano de 2015.
select e.*
from pib_estado pe 
	join estado e on e.id = pe.id_estado
where
	pe.ano_pib = '2015'
	and pe.valor_pib > (select pe.valor_pib
						from estado e 
							join pib_estado pe on e.id = pe.id_estado 
						where e.nome = 'Goias' and pe.ano_pib = '2015');

-- i. Listar os estados que tiveram PIB abaixo da média no ano de 2017.
select e.*
from pib_estado pe
	join estado e on pe.id_estado = e.id
where 
	pe.ano_pib = '2017'
group by e.id
having AVG(pe.valor_pib) < (select avg(valor_pib) from pib_estado pe2 where ano_pib = '2017');



























