USE netflix;
# Conectar, al menos, una de las BBDD que se les han compartido netflix.db o netflix.sql. (esta decisión la tomarás de acuerdo al entorno de trabajo por el que hayas optado).

# Construir y completar una tabla como el siguiente modelo. Los textos en azul debes sustuirlos por los que correspondan, según la BBDD que seleccionaste:

# Realizar las siguientes consultas sobre una sola tabla. 
# Los nombres de las columnas deben mostrarse en español:

# A.  Listar todos los registros de la tabla, visualizando las columnas 
# type, title_content, country, rating, duration, listed_in.
/*SELECT type AS "Tipo",title_content AS "Titulo", country AS "Pais", rating AS "Rating", duration AS "Duración", listed_in AS "Tags"
FROM content;*/

# B.  Mostrar todas las filas de la tabla, presentando las columnas 
# id_content, title_production, genre, runtime, imdb_Score.
/* SELECT id_content AS "Contenido", title_production AS "Titulo_de_produccion", genre AS "Genero",
runtime AS "algo_runtime", imdb_Score AS "pagina_chanta" FROM production;*/

# C.  Generar un listado de todas las películas en las que participe Argentina, mostrando las columnas 
# id_content, type, title_content, director, cast, rating, duration, listed_in.
/*SELECT id_content AS "Contenido", type AS "Tipo", title_content AS "Titulo_de_contenido",
director AS "director", cast AS "Cast", rating AS "Rating", duration AS "Duracion",
listed_in AS "Listado_en"
FROM content WHERE country LIKE '%Argentina%'*/

# D.  Presentar un listado con las columnas id_production, title_production, genre, language, imdb_score 
# de los registros de la tabla en las que el imdb_score sea superior a 7.5.
/*SELECT id_production AS "Produccion", title_production AS "Titulo_de_produccion", genre AS "Genero",
language AS "Lenguaje", imdb_score AS "resultado_chanta" FROM production WHERE imdb_score > 7.5;*/

# E.  Mostrar las columnas id_content, type, title_content, listed_in de los registros en los que el rating público general o 
# admitido para todas las edades.
/*SELECT id_content AS "ID_Contenido", type AS "Tipo", title_content AS "Titulo_de_contenido", listed_in AS "Listado_en", rating
FROM content WHERE rating LIKE "TV-Y" OR rating LIKE "TV-G" OR rating LIKE "G";*/

# F.  Obtener una lista con las columnas id_production, title_production, genre de los registros en 
# que duration sea menor o igual a 105 minutos pero que además tenga una duración de al menos 60 minutos.
/*SELECT id_production AS "ID_Produccion", title_production AS "Titulo_de_produccion", genre AS "Genero", runtime
FROM production WHERE runtime BETWEEN 60 AND 105 ORDER by runtime desc;*/

# G.  Obtener la cantidad de registros discriminando por type y rating, ordenados alfabéticamente por rating y por type.
/*SELECT rating,type, COUNT(*) AS "Cantidad_de_registros" FROM content GROUP BY type,rating ORDER BY rating,type ASC;*/

# H.  Mostrar la cantidad  de películas en los idiomas portugués, francés, alemán, italiano y español, ordenados por cantidad, de mayor a menor.
/* SELECT language, COUNT(id_production) AS "Peliculas_total" FROM production
where language IN ("English","Italian","French","Dutch","Portuguese") 
group by language order by COUNT(id_production) desc;*/

# Documentar todo lo anterior en DEEPNOTE:
# Crea las tablas para los puntos 2 y 3.
# Pega los códigos de las queries del punto 4 y agrega una captura de pantalla de la ejecución en el Administrador de BBDD, que incluya la barra de tareas de tu sistema operativo.