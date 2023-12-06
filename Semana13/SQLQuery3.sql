create procedure usp_matricula
(
	@curso int,
	@alumno int,
	@empleado int,
	@tipo varchar(15),
	@cuotas int,
	@estado int out,
	@mensaje varchar(500) out
)
as
begin
	-- Variables
	declare @precio money;
	-- Validacion

	-- Proceso
	select @precio = cur_precio from CURSO
	where cur_id = @curso;
	update curso 
	set cur_matriculados = cur_matriculados + 1
	where cur_id = @curso;
	insert into MATRICULA(cur_id,alu_id,emp_id,mat_tipo,
	mat_fecha,mat_precio,mat_cuotas) 
	values(@curso,@alumno,@empleado,@tipo,
	getdate(),@precio,@cuotas);
	set @estado = 1;
	set @mensaje = 'Proceso ok';
end;
go

DECLARE @estado int, @mensaje varchar(500);
exec usp_matricula 4,5,3,'NORMAL',2,@estado out, @mensaje out;
print concat('estado: ', @estado);
print concat('Mensaje: ', @mensaje);
go

select * from CURSO where cur_id=4;
select * from MATRICULA where cur_id = 4;
go



