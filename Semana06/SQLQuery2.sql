
create table ventas..mensajes(
	de varchar(20) not null,
	para varchar(20) not null,
	mensaje varchar(1000) null,
	constraint u_mensajes_mensaje unique( mensaje )
);
go

insert into ventas..mensajes
values('profe','todos','Esta clase es chevere!!!');
go

select * from ventas..mensajes;
go


insert into ventas..mensajes
values('alguien','todos',null);
go



