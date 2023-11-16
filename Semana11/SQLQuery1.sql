/*
Cual es el producto mas caro
*/

select max(UnitPrice) from Northwind..Products;
go

select * from Northwind..Products
where UnitPrice 
= (select max(UnitPrice) from Northwind..Products);
go

/*
Desafio, encontrar el producto mas barato.
*/

/*
Productos que estan por encima del precio promedio
*/

select avg(UnitPrice) from Northwind..Products


/*
Cual es el stock total de la categoria 3.
*/

select sum(UnitsInStock) "Stock Total"
from Northwind..Products
where CategoryID=3;
go

/*
Cuanto es el importe total que se tiene 
en mercaderia.
*/

select  sum(UnitPrice * UnitsInStock) "Importe"
From Northwind..Products

/*
Se necesita saber cual es el importe
que se ha pago por reparto a brazil.
*/

select sum(Freight) [Importe Reparto] 
from Northwind..Orders
where ShipCountry='Brazil'
go

/*
Se necesita saber la cantidad de pedidos
que se han repartido a America del Sur.
*/


/*
Cual es el pais al que se han realizado
la mayor cantidad de pedidos.
*/

with
v1 as (
select ShipCountry, count(1) Pedidos
from Northwind..Orders
group by ShipCountry ),
v2 as ( select max(pedidos) max_pedidos from v1 )
select v1.ShipCountry, v1.Pedidos
from v1 join v2
on v1.Pedidos = v2.max_pedidos;
go










 
