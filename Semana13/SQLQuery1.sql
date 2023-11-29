

select * from curso;
go

with
v1 as (select sum(cur_matriculados) total from curso)
select 
	c.cur_nombre, c.cur_matriculados,
	cast(c.cur_matriculados*100.0/v1.total as decimal(5,2)) Porcentaje
from curso c cross join v1;
go


