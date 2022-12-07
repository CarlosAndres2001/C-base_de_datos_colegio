create table persona
(
idpersona int primary key not null,
nombres varchar(50),
apellidos varchar(50),
C_I int,
telefono int,
dirección varchar(60),
sexo char,
fecha_nacimiento datetime
);
create table persona_admin
(
id_admin int primary key not null,
cargo varchar (30),
fk_idpersona int,
foreign key (fk_idpersona) references persona (idpersona)
);
create table profesor
(
id_profesor int primary key not null,
especialidad varchar (30),
fk_idpersona int,
foreign key (fk_idpersona) references persona (idpersona)
);
create table estudiante
(
id_estudiante int primary key not null,
correo varchar (60),
fk_idpersona int,
foreign key (fk_idpersona) references persona (idpersona)
);
create table inscripcion
(
id_inscripcion int primary key not null,
estado_inscripcion varchar(30),
fk_estudiante int,
fk_admin int,
foreign key (fk_estudiante) references estudiante(id_estudiante),
foreign key (fk_admin) references persona_admin (id_admin)
);
create table curso
(
id_curso int primary key not null,
grado varchar(50),
fk_inscripcion int,
foreign key (fk_inscripcion) references inscripcion (id_inscripcion)
);
create table materia
(
id_materia int primary key not null,
nombre_materia varchar(50),
fk_profesor int,
foreign key (fk_profesor) references profesor (id_profesor)
);
create table asistencia
(
id_asistencia int primary key not null,
fecha_asistencia datetime,
estado_asistencia char,
fk_estudiante int,
fk_curso int,
foreign key (fk_estudiante) references estudiante (id_estudiante),
foreign key (fk_curso) references curso (id_curso)
);
create table notas_materia_curso
(
id_calificaciones int primary key not null,
calificaciones double,
fk_curso int,
fk_materia int,
foreign key (fk_curso) references curso(id_curso),
foreign key (fk_materia) references materia(id_materia)
);
create table aula
(
id_aula int primary key not null,
capacidad_aula int
);
create table horario
(
id_horario int,
hora_inicio time,
hora_fin time,
fk_materia int,
fk_aula int,
fk_curso int,
foreign key (fk_materia) references materia(id_materia),
foreign key (fk_aula) references aula(id_aula),
foreign key (fk_curso) references curso(id_curso)
);

