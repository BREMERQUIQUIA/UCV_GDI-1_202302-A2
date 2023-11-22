/*
RESUMEN DE VENTAS POR PAIS
----------------------------------------
PAIS     CANT.PRODUCTOS    IMPORTE
----------------------------------------
.......
.......
.......
----------------------------------------
*/

SELECT 
	C.Country, 
	SUM(OD.Quantity) "CANT.PRODUCTOS",
	SUM(OD.Quantity*OD.UnitPrice) IMPORTE
FROM [Order Details] OD
JOIN Orders O ON OD.OrderID=O.OrderID
JOIN Customers C ON O.CustomerID=C.CustomerID
GROUP BY C.Country
ORDER BY 1;
GO

/*
-------------------------------------------------
CAT.PEDIDOS PAIS     CANT.PRODUCTOS    IMPORTE
--------------------------------------------------
.......
.......
.......
--------------------------------------------------
*/

SELECT 
	C.Country, 
	COUNT (distinct O.OrderID) "CANT.PEDIDOS",
	SUM(OD.Quantity) "CANT.PRODUCTOS",
	SUM(OD.Quantity*OD.UnitPrice) IMPORTE
FROM [Order Details] OD
JOIN Orders O ON OD.OrderID=O.OrderID
JOIN Customers C ON O.CustomerID=C.CustomerID
GROUP BY C.Country
ORDER BY 1;
GO

SELECT COUNT (1) FROM Orders;
go

/*
Crear un SP
*/

CREATE PROCEDURE USP_RESUMEN_VENTAS
AS
BEGIN
	SELECT 
		C.Country PAIS, 
		COUNT (distinct O.OrderID) "CANT.PEDIDOS",
		SUM(OD.Quantity) "CANT.PRODUCTOS",
		SUM(OD.Quantity*OD.UnitPrice) IMPORTE
	FROM [Order Details] OD
	JOIN Orders O ON OD.OrderID=O.OrderID
	JOIN Customers C ON O.CustomerID=C.CustomerID
	GROUP BY C.Country
	ORDER BY 1;
END;
GO

EXEC USP_RESUMEN_VENTAS
GO

/*
SE HA SOLICITADO QUE EL REPORTE SEA POR AÑO.
El procedimiento debe aceptar mediante un parametro el año a consultar.
*/


ALTER PROCEDURE USP_RESUMEN_VENTAS
(@ANIO INT)
AS
BEGIN
	SELECT 
		C.Country PAIS, 
		COUNT (distinct O.OrderID) "CANT.PEDIDOS",
		SUM(OD.Quantity) "CANT.PRODUCTOS",
		SUM(OD.Quantity*OD.UnitPrice) IMPORTE
	FROM [Order Details] OD
	JOIN Orders O ON OD.OrderID=O.OrderID
	JOIN Customers C ON O.CustomerID=C.CustomerID
	WHERE YEAR(O.OrderDate) = @ANIO 
	GROUP BY C.Country
	ORDER BY 1;
END;
GO

EXEC USP_RESUMEN_VENTAS 2000
GO
