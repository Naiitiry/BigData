# Averiguar cuantos registros / filas de una tabla

USE c23660_escuelas;

SELECT TABLE_NAME, COUNT(COLUMN_NAME) AS 'Cantidad de columnas'
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'c23660_escuelas'
GROUP BY TABLE_NAME;