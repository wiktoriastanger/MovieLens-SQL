--creating tables

CREATE TABLE ratings (
	user_id INT,
	movie_id INT,
	rating INT
);

CREATE TABLE users (
	user_id INT PRIMARY KEY,
	age INT,
	gender CHAR(1),
	occupation TEXT,
	zip_code VARCHAR(10)
);

CREATE TABLE movies (
	movie_id INT PRIMARY KEY,
	title TEXT,
	release_date DATE,
	video_release_date DATE,
	imdb_url TEXT,
	unknown INT, 
	Action INT, 
	Adventure INT, 
	Animation INT,
	Childrens INT,
	Comedy INT,
	Crime INT,
	Documentary INT,
	Drama INT, 
	Fantasy INT, 
	FilmNoir INT,
	Horror INT,
	Musical INT,
	Mystery INT, 
	Romance INT,
	SciFi INT,
	Thriller INT, 
	War INT, 
	Western INT
);

CREATE TABLE genres (
	genre TEXT,
	genre_id INT PRIMARY KEY
);

CREATE TABLE occupations (
	occupation TEXT PRIMARY KEY
);


