/*
Desarrollar un SP para consultar el resumen
de ventas por producto de un cliente especifico
*/

CREATE PROCEDURE USP_RESUMEN_POR_CLIENTE
( @COD_CLIE CHAR(5) )
AS
BEGIN -- Inicio del SP

	SELECT 
		P.ProductID, P.ProductName,
		SUM(OD.Quantity) CANTIDAD,
		SUM(OD.Quantity + OD.UnitPrice) IMPORTE
	FROM [Order Details] OD
	JOIN Orders O ON OD.OrderID = O.OrderID
	JOIN Customers C ON O.CustomerID = C.CustomerID
	JOIN Products P ON OD.ProductID = P.ProductID
	WHERE C.CustomerID = @COD_CLIE
	GROUP BY P.ProductID, P.ProductName
	ORDER BY 1;

END; -- Fin del SP
GO


SELECT * FROM Customers;
GO

EXEC USP_RESUMEN_POR_CLIENTE 'ANATR'
GO

/*
Ademas del cliente, se debe filtrar por año.
*/



