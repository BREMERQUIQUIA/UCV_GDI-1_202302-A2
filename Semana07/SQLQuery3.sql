USE COLEGIO;
GO

CREATE TABLE COLEGIO..ESTUDIANTE(
IDESTUDIANTE INT IDENTITY(100,1),
NOMBRE VARCHAR(100) NOT NULL,
APELLIDO VARCHAR(100) NOT NULL,
FEC_NAC DATETIME NOT NULL
);
GO

SELECT TYPE, NAME
FROM sys.objects
WHERE TYPE='U';
GO

INSERT INTO COLEGIO..ESTUDIANTE
(APELLIDO,NOMBRE,FEC_NAC)
VALUES('CAMPOS','SANDRA','20000615');
GO

INSERT INTO COLEGIO..ESTUDIANTE
(APELLIDO,NOMBRE,FEC_NAC)
VALUES('RAMOS','CLEBER','20000510');
GO

SELECT * FROM COLEGIO..ESTUDIANTE;
GO





