create table ventas..grupo(
mensaje varchar(500) null,
constraint u_grupo_mensaje unique( mensaje)
);
go

insert into ventas..grupo 
values('En esta clase todo es chevere!!!');
go

insert into ventas..grupo values(null);
go

select * from ventas..grupo;
go


