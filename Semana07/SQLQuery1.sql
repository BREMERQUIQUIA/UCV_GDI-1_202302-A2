create database colegio;
go

SELECT name, database_id, create_date  
FROM sys.databases
where name='colegio';  
GO 

