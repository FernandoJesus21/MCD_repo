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

--SELECT * FROM covid_tweets;