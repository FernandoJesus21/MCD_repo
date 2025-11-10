DROP TABLE IF EXISTS covid_c;

CREATE TABLE covid_c(
	periodo VARCHAR(6),
	residencia_provincia_nombre VARCHAR(50),
	sexo VARCHAR(3),
	cant_casos integer
);

DROP TABLE IF EXISTS covid_cf;

CREATE TABLE covid_cf(
	periodo VARCHAR(6),
	residencia_provincia_nombre VARCHAR(50),
	sexo VARCHAR(3),
	cant_casos integer
);

DROP TABLE IF EXISTS covid_tbl;

CREATE TABLE covid_tbl(
	periodo VARCHAR(6),
	residencia_provincia_nombre VARCHAR(50),
	sexo VARCHAR(3),
	fallecido VARCHAR(50),
	clasificacion_resumen VARCHAR(50),
	asistencia_respiratoria_mecanica VARCHAR(50),
	cant_casos integer
);

DROP TABLE IF EXISTS covid_kpi;

CREATE TABLE covid_kpi(
	periodo VARCHAR(6),
	residencia_provincia_nombre VARCHAR(50),
	confirmado integer,
	sospechoso integer,
	descartado integer
);


DROP TABLE IF EXISTS covid_tweets;

CREATE TABLE covid_tweets(
	periodo VARCHAR(6),
	nombre VARCHAR(50),
	user_id VARCHAR(50),
	tweet_id VARCHAR(50),
	retweets VARCHAR(50),
	favorites VARCHAR(50),
	fecha VARCHAR(50),
	followers VARCHAR(50),
	is_user_verified VARCHAR(50),
	primary_location VARCHAR(150)
);

--COPY indicadores FROM 'D:/dataset.csv' DELIMITER ',' CSV HEADER ENCODING 'UTF-8';

SELECT * FROM public.covid_tbl;

--cant fallecidos en Buenos Aires por periodo
SELECT periodo, sum(cant_casos) as casos
FROM public.covid_tbl
WHERE residencia_provincia_nombre = 'Buenos Aires'
AND clasificacion_resumen = 'Confirmado'
AND fallecido = 'SI'
GROUP BY periodo
ORDER BY periodo

--cant descartados en Buenos Aires por periodo
SELECT periodo, sum(cant_casos) as casos
FROM public.covid_tbl
WHERE residencia_provincia_nombre = 'Buenos Aires'
AND clasificacion_resumen = 'Descartado'
GROUP BY periodo
ORDER BY periodo

--cant fallecidos en Buenos Aires
SELECT sum(cant_casos) as casos
FROM public.covid_tbl
WHERE clasificacion_resumen = 'Confirmado'
AND residencia_provincia_nombre = 'Buenos Aires'
AND fallecido = 'SI'

--cant descartados en Buenos Aires
SELECT sum(cant_casos) as casos
FROM public.covid_tbl
WHERE clasificacion_resumen = 'Descartado'
AND residencia_provincia_nombre = 'Buenos Aires'

--cant confirmados en Buenos Aires
SELECT sum(cant_casos) as casos
FROM public.covid_tbl
WHERE clasificacion_resumen = 'Confirmado'
AND residencia_provincia_nombre = 'Buenos Aires'

SELECT * FROM public.covid_tbl


SELECT periodo, residencia_provincia_nombre, clasificacion_resumen, sum(cant_casos) as casos
FROM public.covid_tbl
GROUP BY periodo, residencia_provincia_nombre, clasificacion_resumen

--tabla pivot
SELECT periodo, residencia_provincia_nombre,
       COALESCE(round(sum((CASE WHEN clasificacion_resumen = 'Confirmado' THEN cant_casos END)), 2), 0) AS "Confirmado",
       COALESCE(round(sum((CASE WHEN clasificacion_resumen = 'Sospechoso' THEN cant_casos END)), 2), 0) AS "Sospechoso",
       COALESCE(round(sum((CASE WHEN clasificacion_resumen = 'Descartado' THEN cant_casos END)), 2), 0) AS "Descartado"
FROM public.covid_tbl
GROUP BY periodo, residencia_provincia_nombre
ORDER BY periodo, residencia_provincia_nombre





--cant descartados en Buenos Aires por periodo
SELECT periodo, sum(cant_casos) as casos
FROM public.covid_tbl
WHERE residencia_provincia_nombre = 'Buenos Aires'
AND clasificacion_resumen = 'Descartado'
GROUP BY periodo
ORDER BY periodo













