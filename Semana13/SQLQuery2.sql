-- Procedimiento para sumar 2 numeros

alter procedure usp_suma
(@num1 int, @num2 int)
as
begin
	-- Variables
	declare @suma int;
	-- Proceso
	set @suma = @num1 + @num2;
	-- Reporte
	print concat('Numero 1: ',@num1);
	print concat('Numero 2: ',@num2);
	print concat('Suma : ',@suma);
end;
go

exec usp_suma 45, 34;
go

-- Version 2

create procedure usp_suma_v2
(@num1 int, @num2 int, @suma int out)
as
begin
	-- Proceso
	set @suma = @num1 + @num2;
end;
go


declare @num1 int = 56, @num2 int = 76;
declare @suma int;
exec usp_suma_v2 @num1, @num2, @suma out;
-- Reporte
print concat('Numero 1: ',@num1);
print concat('Numero 2: ',@num2);
print concat('Suma : ',@suma);
go

	