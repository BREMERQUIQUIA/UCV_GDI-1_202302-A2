create database ventas;
go

create table ventas..producto(
idproducto int identity,
nombre varchar(150) not null,
precio numeric(10,2) not null,
stock int not null
);
go

alter table ventas..producto
drop constraint pk_producto;
go

delete from ventas..producto;
go

truncate table ventas..producto;
go

alter table ventas..producto
add constraint pk_producto primary key(idproducto);
go

insert into ventas..producto(nombre,precio,stock) 
values('laptop',5789.0,45);
go

select * from ventas..producto;
go

SET IDENTITY_INSERT ventas..producto  ON;
go

insert into ventas..producto(idproducto,nombre,precio,stock) 
values(10,'laptop',5789.0,45);
go

select * from ventas..producto;
go

insert into ventas..producto(idproducto,nombre,precio,stock) 
values(20,'impresora',879.0,135);
go







