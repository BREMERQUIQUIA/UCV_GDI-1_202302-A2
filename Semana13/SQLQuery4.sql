/*
Programar un SP que reporte lo siguiente:

------------------------------------------------------------------
CODIGO   NOMBRE    ALUMNOS       IMPORTE     IMPORTE    IMPORTE
CURSO    CURSO     MATRICULADOS  PROYECTADO  RECAUDADO  FALTA  
------------------------------------------------------------------
...
...
------------------------------------------------------------------
*/




WITH
V1 AS (
	SELECT CUR_ID, SUM(mat_precio) PROYECTADO
	FROM MATRICULA
	GROUP BY CUR_ID
),
V2 AS (
	SELECT CUR_ID, SUM(pag_importe) RECAUDADO
	FROM PAGO
	GROUP BY CUR_ID
)
SELECT  
	C.cur_id, C.cur_nombre, C.cur_matriculados,
	V1.PROYECTADO, ISNULL(V2.RECAUDADO,0) RECAUDADO,
	V1.PROYECTADO - ISNULL(V2.RECAUDADO,0) FALTA
FROM CURSO C
JOIN V1 ON C.cur_id = V1.cur_id
LEFT JOIN V2 ON V1.cur_id = V2.cur_id;
GO




