create database theGame;
use theGame;

create table Jogador(
cod_jogador int primary key,
nome varchar(50),
nickname varchar(20),
sexo char(1),
email varchar(100),
dt_nasc date,
pontuacao int,
moedas int);

insert into Jogador
values(1,"Roberto Carlos","robcar","M","robcar@gmail.com","2000-08-07",1000,3000),
(2,"Maria Clara","marcla","F","marcla@gmail.com","1999-05-07",5000,500),
(3,"João Marcos","jomar","M","jomar@gmail.com","1998-01-15",1000,5000),
(4,"Karina Jones","kjones","F","kjones@yahoo.com","1999-03-05",1000,8000);

create table poder(
cod_poder int primary key,
habilidade varchar(40));
insert into poder values 
(1,"Choque do trovão"),
(2,"Bola elétrica"),
(3,"Ataque rápido"),
(4,"Cauda de ferro"),
(5,"Teia Elétrica"),
(6,"Jato de Bolhas"),
(7,"Redomoinho");

create table Adquire_poder(
cod_aquisicao int primary key,
cod_jogador int,
cod_poder int,
dt_hora_aquisicao datetime,
foreign key(cod_jogador) references Jogador(cod_jogador),
foreign key(cod_poder) references Poder(cod_poder));

insert into Adquire_poder values
(1,1,1,"2021-06-20 19:00:00"),
(2,1,2,"2021-06-21 10:00:00"),
(3,2,1,"2021-06-21 11:00:00"),
(4,2,3,"2021-06-23 13:00:00"),
(5,2,4,"2021-06-24 15:00:00"),
(6,3,4,"2021-06-25 12:00:00"),
(7,3,5,"2021-06-26 08:00:00"),
(8,4,6,"2021-06-26 12:00:00");

create table Cenario(
cod_cenario int primary key,
caracteristicas varchar(30),
qtde_min_pontos int);

insert into Cenario values
(1,"Terrestre",1000),
(2,"Aquatico",2500),
(3,"Espacial",5000);

create table Partida(
cod_partida int primary key,
data_hora_inicio datetime,
data_hora_termino datetime,
pontos_obtidos int,
cod_jogador int,
cod_cenario int,
foreign key(cod_jogador) references jogador(cod_jogador),
foreign key(cod_cenario)  references cenario(cod_cenario));

insert into Partida values
(1,"2021-06-27 19:00:00","2021-06-27 20:00:00",300,1,1),
(2,"2021-06-27 19:30:00","2021-06-27 21:00:00",500,2,1),
(3,"2021-06-28 08:00:00","2021-06-28 12:00:00",200,3,1),
(4,"2021-06-28 08:30:00","2021-06-28 11:30:00",200,1,2);