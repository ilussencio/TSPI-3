-- AULA DE PROCEDIMENTOS
Create database aula_proc;
use aula_proc;
CREATE TABLE curso(
Cod_curso int auto_increment primary key,
Sigla_curso Varchar(7) not null,
Nome_curso Varchar(50) not null);

DELIMITER $
CREATE PROCEDURE sp_curso_inserir (var_cod int, var_sigla varchar(7), var_nome varchar(50))
BEGIN
	INSERT INTO curso(cod_curso,sigla_curso,nome_curso) VALUES (var_cod,var_sigla,var_nome);
END $
DELIMITER ;

CALL sp_curso_inserir(1,'ADMIN','Administração');
CALL sp_curso_inserir(2,'LCOMP','Licenciatura em computação');
CALL sp_curso_inserir(3, 'TPSI', 'Tecniconologo sistemas para internet');

SELECT * FROM CURSO;

REPLACE INTO CURSO VALUES	(4, 'ADMIN', 'Administração');


DELIMITER $
CREATE PROCEDURE sp_curso_inserir_atualizar (var_cod int,var_Sigla varchar(7),var_nome varchar(50))
BEGIN
	Replace INTO curso VALUES (var_cod,var_sigla,var_nome);
END $
Delimiter ;

CALL sp_curso_inserir_atualizar(1,'ADM','Administração');
Select * from curso;
call sp_curso_inserir_atualizar(2,'IF','Informatica');
Select * from curso;
call sp_curso_inserir_atualizar(2,'INF','Informatica');
Select * from curso;



DELIMITER $$
CREATE PROCEDURE sp_cursos_listar( var_cod Int) BEGIN
IF(var_cod IS NULL) THEN
SELECT * FROM curso;
ELSE
SELECT * FROM curso
where cod_curso=var_cod;
END IF;
END $$
DELIMITER ;

CALL sp_cursos_listar(3);




Use clinica;

delimiter $
create procedure listar_futuras_consultas ()
begin
Declare var_data_atual date;
set var_data_atual =current_date();
select * from consulta where dt_consulta>var_data_atual;
end $
Delimiter ;

