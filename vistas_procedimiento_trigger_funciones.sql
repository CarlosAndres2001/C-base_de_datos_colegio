-- procedimientos 

delimiter $$
create procedure toma_de_datos (varid int, varnombre varchar(50), varapelli varchar(50),varCI int,vartel int,
vardirec varchar(60),varsexo char, varfNac date)
begin 
insert into persona values (varid,varnombre,varapelli,varCI,vartel,vardirec,varsexo,varfNac);
end $$

delimiter $$
create procedure incribir_estudiante (varid int,varcorreo varchar(60),varpersona int)
begin
insert into estudiante values (varid,varcorreo,varpersona);
end$$

delimiter $$
create procedure definir_estado_inscripcion (varid int, varestado varchar(30),varestud int,varadmin int)
begin 
insert into inscripcion values (varid,varestado,varestud,varadmin);
end$$

-- funciones

delimiter $$
create function cantidad_estudiantes_curso (idcurso int)returns int
begin 
	declare cant int;
    select count(*) into cant from curso where fk_inscripcion like (idcurso);
    return cant;
end$$
select cantidad_estudiantes_curso (1);


-- vistas
create view estudiantes_inscritos as
select estudiante.id_estudiante, persona.nombres, persona.apellidos,curso.grado, inscripcion.fecha_inscripcion, inscripcion.estado_inscripcion
from estudiante,persona,curso,inscripcion
where id_estudiante = id_estudiante;

select * from estudiantes_inscritos;

create view horario_curso as
select curso.grado, materia.nombre_materia, horario.hora_inicio, horario.hora_fin
from curso, materia, horario;
where id_curso = id_curso;
select * from horario_curso;

-- trigger
-- Creamos una tabla Bitacora
create table bitacora
(
accion varchar(50),
hostName varchar(50),
fecha timestamp
);

insert into bitacora values('accion',@@HOSTNAME, null);

select * from bitacora;
select @@HOSTNAME;
 
 /* Creamos el Trigger con el nombre insertProduc cuando se realice 
 registro en la tabla producto nuestra disparador registrara 
 la accion en la tabla bitacora */
delimiter $$
CREATE TRIGGER insertar_datos_persona
BEFORE INSERT ON persona
FOR EACH ROW 
BEGIN       
insert into bitacora values(concat(new.nombres ,'insertado'),@@HOSTNAME, null);
END $$

insert into persona values(1,'carlos Andres','antelo', 14053607,68847591,'B/El mundo C/lujan','M','2001-09-07');
select * from bitacora;