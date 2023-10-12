create table ventas..curso(
idcurso int not null,
nombre varchar(100) not null,
constraint u_curso_idcurso unique(idcurso)
);
go

create table ventas..matricula(
idmatricula int identity,
idcurso int not null,
estudiante varchar(100) not null,
constraint pk_matricula primary key (idmatricula),
constraint fk_matricula_curso
foreign key(idcurso) references ventas..curso(idcurso)
);
go


insert into ventas..curso(idcurso,nombre)
values(1,'GDI-1');
go

insert into ventas..curso(idcurso,nombre)
values(2,'GDI-2');
go

select * from ventas..curso;
go

insert into ventas..matricula(idcurso,estudiante)
values(1,'El Chavo');
go


select * from ventas..matricula;
go