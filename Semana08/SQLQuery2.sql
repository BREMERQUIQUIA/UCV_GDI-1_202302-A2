-- * => Todas las columnas

select * from EDUCA2..CURSO;
go


select * from EUREKABANK..Cliente;
go


select 
	chr_cliecodigo CODIGO,
	vch_cliepaterno PATERNO,
	vch_cliematerno MATERNO,
	vch_clienombre NOMBRE
from EUREKABANK..Cliente;
go

select
	alu_id ID,
	alu_direccion DIRECCION,
	alu_email EMAIL
from EDUCA2..ALUMNO;
go

select *
from EduTec..Matricula
where promedio < 11.0
and IdCursoProg = 8282;
go 
-- 	
select *
from EduTec..CursoProgramado
order by 1 desc
go
--8282

/*
Los empleados que trabajan en contabilidad.
Base de Datos: RH
*/

select *from RH..departamento;
go

select idempleado, apellido, nombre, iddepartamento
from RH..empleado
where iddepartamento=101
go

-- LAS COLUMNAS

SELECT 
	cur_id, cur_nombre, cur_vacantes, cur_matriculados,
	CAST(cur_matriculados * 100.0 / cur_vacantes as numeric(5,2)) "Avance"
FROM EDUCA2..CURSO;
GO

-- Condicion simple: (Condicion)
-- Operadores relaionalles: =, >, >=, <, <=, <>, !=

select * 
from EUREKABANK..Cuenta
where vch_cuenestado='CANCELADO';
go

select * 
from EUREKABANK..Cuenta
where vch_cuenestado != 'ACTIVO';
go

select * 
from EUREKABANK..Cuenta
where vch_cuenestado <> 'ACTIVO';
go

-- Operadores logico: not and or

select * 
from Northwind..Orders
where ShipCity='Rio de Janeiro' or ShipCity ='Caracas';
go


