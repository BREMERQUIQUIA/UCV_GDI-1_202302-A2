-- Desafio 3

select * 
from Northwind..Orders
where CustomerID = 'HANAR' or CustomerID = 'ERNSH';
go

select * 
from Northwind..Orders
where CustomerID in ('HANAR','ERNSH');
go


select * 
from Northwind..Orders
where CustomerID like 'HANAR' or CustomerID like 'ERNSH';
go

-- Desafio 4

select * 
from Northwind..Orders
where MONTH(OrderDate) = 3 and YEAR(OrderDate) = 1997;
go

select * 
from Northwind..Orders
where CONVERT(varchar(7),OrderDate,120) = '1997-03';
go

-- Desafio 5

select * 
from Northwind..Products
where CategoryID in (3,4) and UnitsInStock < 10;
go

select * 
from Northwind..Products
where (CategoryID = 3 or CategoryID = 4)
and (UnitsInStock < 10);
go


-- Desafio 1

create table producto(
prod_id int identity not null,
nombre varchar(100) not null,
pre_costo numeric(10,2) not null,
pre_venta numeric(10,2) not null,
stock int not null
);
go

alter table producto
add constraint pk_producto primary key(prod_id);
go

alter table producto
add constraint u_producto_nombre unique(nombre);
go

alter table producto
add constraint chk_producto_pre_costo 
check ( pre_costo > 0);
go

alter table producto
add constraint chk_producto_pre_venta 
check ( pre_venta > pre_costo);
go

alter table producto
add constraint chk_producto_stock 
check ( stock >= 0);
go


-- Desafio 2

create table venta(
venta_id int identity not null,
cliente varchar(100) not null,
prod_id int not null,
precio numeric(10,2) not null,
cantidad int not null,
importe numeric(10,2) not null
);
go

alter table venta 
add constraint pk_venta primary key (venta_id);
go

alter table venta
add constraint fk_venta_producto
foreign key (prod_id) references producto;
go

alter table venta
add constraint chk_venta_precio
check( precio > 0 );
go

alter table venta
add constraint chk_venta_cantidad
check( cantidad > 0 );
go

alter table venta
add constraint chk_venta_importe
check( importe = precio * cantidad );
go














