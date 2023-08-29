USE c23660_escuelas;
/*
EJERCICIOS SQL
SINTAXIS BÁSICA: SELECT…FROM + USO DE WHERE, AND, OR, BETWEEN
*/
# 1) Seleccionar todos los datos de la tabla alumnos.
# SELECT * FROM alumnos;

# 2) Seleccionar solamente el legajo y el nombre de los alumnos.
# SELECT legajo,nombre FROM alumnos;

# 3) Mostrar todos los datos de aquellos alumnos aprobados (con notas mayores o iguales a 7).
# SELECT * FROM alumnos WHERE nota >= 7;

# 4) Mostrar el id y el nombre de aquellas escuelas cuya capacidad sea inferior a 200 (no mostrar la columna capacidad).
# SELECT id,nombre FROM escuelas WHERE capacidad < 200 

# 5) Mostrar el nombre y la nota de aquellos alumnos cuya nota se encuentre entre 7 y 10 (inclusive).
# SELECT nombre,nota FROM alumnos WHERE nota >= 7;

# 6) Repetir el ejercicio anterior, utilizando BETWEEN.
# SELECT nombre,nota FROM alumnos WHERE nota BETWEEN 7 AND 10;

# 7) Mostrar el nombre, la localidad y la provincia de aquellas escuelas situadas en Buenos Aires o Jujuy.
# SELECT nombre,localidad,provincia FROM escuelas WHERE provincia = 'Buenos Aires' OR provincia = 'Jujuy';

# SINTAXIS BÁSICA: SELECT…FROM + USO DE LIKE, NOT LIKE Y %
# 8) Mostrar todos los datos de los alumnos llamados Minna Klauber.
# SELECT * FROM alumnos WHERE nombre LIKE 'Minna Klauber'

# 9) Repetir el ejercicio anterior, pero con aquellos que no se llamen Minna Klauber.
# SELECT * FROM alumnos WHERE nombre NOT LIKE 'Minna Klauber'

# 10) Mostrar todos los datos de los alumnos cuyo nombre comience con “Ma”. 
# SELECT * FROM alumnos WHERE nombre LIKE 'Ma%'

# 11) Mostrar todos los datos de los alumnos cuyo nombre termine con “er”.
# SELECT * FROM alumnos WHERE nombre LIKE '%er'

# 12) Mostrar todos los datos de los alumnos cuyo nombre contenga “tt”.
# SELECT * FROM alumnos WHERE nombre LIKE '%tt%'

# USOS DE JOIN Y ALIAS PARA TABLAS Y CAMPOS
# 13) Mostrar el legajo, el nombre del alumno y el nombre de la escuela de todos los alumnos.
# SELECT alumnos.legajo, alumnos.nombre, escuelas.nombre FROM alumnos INNER JOIN escuelas on escuelas.id = alumnos.id_escuela; 

# 14) Modificar el ejercicio anterior utilizando alias de tablas y columnas.

#TABLAS 
# SELECT a.legajo, a.nombre, e.nombre FROM alumnos a INNER JOIN escuelas e on e.id = a.id_escuela

# COLUMNAS -------> arregla e bug de arriba que me muestra solo 2 colummnas
# SELECT a.legajo AS "Nro de legajo" , a.nombre AS "Nombre alumnnos", e.nombre AS "Nombre de escuela" FROM alumnos a INNER JOIN escuelas e on e.id = a.id_escuela

# 15) Mostrar todos los alumnos, tengan o no escuela asignada.
# SELECT a.legajo AS "Nro de legajo" , a.nombre AS "Nombre alumnnos", e.nombre AS "Nombre de escuela"
# FROM alumnos a LEFT JOIN escuelas e on e.id = a.id_escuela

# 16) Mostrar todas las escuelas con el nombre de cada alumno (aunque no tengan escuela asignada).
#SELECT a.legajo AS "Nro de legajo" , a.nombre AS "Nombre alumnnos", e.nombre AS "Nombre de escuela" 
# FROM alumnos a RIGHT JOIN escuelas e on e.id = a.id_escuela;

# USO DE IS NULL / IS NOT NULL
# 17) Mostrar todos los datos de los alumnos que tengan notas.
#SELECT * FROM alumnnos WHERE nota IS NOT NULL;---> no funcionan

# 18) Mostrar todos los datos de los alumnos que no tengan notas.
#SELECT * FROM alumnnos WHERE nota IS NULL

# 19) Mostrar legajo, nombre y nota de los alumnos que no tengan escuela.
# SELECT legajo,nombre,nota FROM alumnnos WHERE id_escuela IS NULL

# ALTER TABLE
# 20a) Agregar a través de ALTER TABLE una columna en la tabla escuelas llamada “Partido”, a la derecha de Localidad con una cadena vacía como valor por defecto (armar la sentencia a través de ALTER TABLE).
# ALTER TABLE escuelas ADD COLUMN partido VARCHAR(20) NULL DEFAULT "" AFTER localidad;

# 20b) Ejecutar una consulta donde se vean todos los campos para confirmar que se ha agregado el campo “partido”.
# SELECT * FROM escuelas

# 20c) Eliminar esa columna utilizando ALTER TABLE.
# ALTER TABLE escuelas DROP COLUMN partido;

# 21) Agregar una nueva escuela utilizando INSERT.
# INSERT INTO escuelas VALUE (11,"Normal 33","CABA","Buenos Aires",1250);
# SELECT * FROM escuelas;

# 22) Utilizando CREATE, duplicar la tabla Alumnos. 
# CREATE TABLE alumnos2 AS SELECT id,id_escuela,legajo,nombre,nota,grado,email FROM alumnos;
# SELECT* FROM alumnos2

# LIMIT Y ORDER BY
# 23) Obtener un ranking de las primeras 3 escuelas de mayor capacidad.
# SELECT nombre,capacidad FROM escuelas ORDER BY capacidad desc LIMIT 3;

# FUNCIONES DE AGREGACIÓN Y AGRUPAMIENTO / USO DE IN
# 24) Contar la cantidad de alumnos (filas) de la tabla homónima. Llamar a la columna “Cantidad de alumnos”.
# SELECT COUNT(*) AS 'Cantidad de alumnos' FROM alumnos;

# 25) Repetir la consulta anterior consultando solamente los alumnos cuya nota sea menor a 7.
# SELECT COUNT(*) AS 'Cantidad de alumnos' FROM alumnos WHERE nota < 7;

# 25b) Repetir la consulta anterior consultando solamente los alumnos que no tengan nota.
# SELECT COUNT(*) AS 'Cantidad de alumnos' FROM alumnos WHERE nota IS NULL;

# 25c) Contar los alumnos que tengan vacío ("") el campo email.
# SELECT COUNT(*) AS 'Cantidad de alumnos' FROM alumnos WHERE email LIKE "";---> PUEDE SER =

# 25d) Contar los alumnos que no tengan nota null.
# SELECT COUNT(*) AS 'Cantidad de alumnos' FROM alumnos WHERE nota IS NOT NULL;

# 26) Obtener los nombres de las columnas de la tabla escuelas.
# SHOW COLUMNS FROM escuelas;
# DESCRIBE escuelas;

# 27) Obtener la cantidad de escuelas desde la tabla alumnos. Verificar con un SELECT en la tabla escuelas.
/*SELECT COUNT(DISTINCT id_escuela) AS "Cantidaddeescuelas" FROM alumnos;
SELECT * FROM escuelas;*/

# 28) Obtener la capacidad total de las escuelas de la provincia de Buenos Aires.
# SELECT SUM(capacidad) AS 'Capacidadtotal' FROM escuelas WHERE provincia LIKE 'Buenos Aires';

# 29) Repetir el ejercicio anterior pero solamente con las escuelas de Córdoba y Jujuy.
/*SELECT SUM(capacidad) AS 'Capacidadtotal' 
FROM escuelas WHERE provincia LIKE 'Córdoba' OR provincia LIKE 'Jujuy';*/

/*SELECT SUM(capacidad) AS 'Capacidadtotal' 
FROM escuelas 
WHERE provincia IN('Córdoba', 'Jujuy') ;*/

# 30) Obtener el promedio de notas de los alumnos aprobados con más de 7.
/*SELECT AVG(nota) AS 'TotalAprobados'
FROM alumnos
WHERE nota > 7;*/

# 31) Obtener la capacidad máxima y la capacidad mínima de alumnos.
/*SELECT MAX(capacidad) AS 'CapacidadMAxima', MIN(capacidad) AS 'CapacidadMinima'
FROM escuelas;*/

# 32) Obtener el total de capacidad de las escuelas por provincia.
/*SELECT provincia, MAX(capacidad) AS 'Capacidadtotal'
FROM escuelas
group by provincia;*/----> se puede modificar provincia y poner localidad por ejemplo.

# 33) Obtener la cantidad de alumnos por grado.
/*SELECT grado AS 'Nivel', COUNT(grado) AS 'CantidadDeAlumnos' 
FROM alumnos 
GROUP BY grado;*/

# DIFERENCIAS DE SINTAXIS ENTRE HAVING Y WHERE
# 34) Mostrar las escuelas y la nota máxima para cada una siempre y cuando sean mayores o iguales a 7. Utiliza HAVING y WHERE.


# SUBCONSULTAS
# 35) Mostrar la información de las escuelas cuyos alumnos tengan una nota igual a 10, utilizando una subconsulta.

