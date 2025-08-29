
--TOP 10 best rated movies 

SELECT movies.title, ROUND(AVG(ratings.rating),2) AS avg_rating
FROM movies 
JOIN ratings ON movies.movie_id = ratings.movie_id
GROUP BY movies.movie_id, movies.title
HAVING COUNT(ratings.rating) >50
ORDER BY avg_rating DESC
LIMIT 10;

--TOP 10 worst rated movies

SELECT movies.title, ROUND(AVG(ratings.rating),2) AS avg_rating
FROM movies
JOIN ratings ON movies.movie_id = ratings.movie_id
GROUP BY movies.movie_id, movies.title
HAVING COUNT(ratings.rating) >50
ORDER BY avg_rating asc
LIMIT 10;

-- TOP 10 most frequently rated movies

SELECT m.title, COUNT(r.rating) AS rating_count
FROM movies m
JOIN ratings r ON m.movie_id = r.movie_id
GROUP BY m.movie_id, m.title
ORDER BY rating_count DESC
LIMIT 10;

-- AVERAGE RATING for SPECIFIC GENRES

SELECT 'Unknown' AS genre, ROUND(AVG(r.rating), 2) AS avg_rating
FROM ratings r
JOIN movies m ON r.movie_id = m.movie_id
WHERE m.unknown = 1

UNION ALL
SELECT 'Action', ROUND(AVG(r.rating), 2)
FROM ratings r
JOIN movies m ON r.movie_id = m.movie_id
WHERE m.action = 1

UNION ALL
SELECT 'Adventure', ROUND(AVG(r.rating), 2)
FROM ratings r
JOIN movies m ON r.movie_id = m.movie_id
WHERE m.adventure = 1

UNION ALL
SELECT 'Animation', ROUND(AVG(r.rating), 2)
FROM ratings r
JOIN movies m ON r.movie_id = m.movie_id
WHERE m.animation = 1

UNION ALL
SELECT 'Children''s', ROUND(AVG(r.rating), 2)
FROM ratings r
JOIN movies m ON r.movie_id = m.movie_id
WHERE m.childrens = 1

UNION ALL
SELECT 'Comedy', ROUND(AVG(r.rating), 2)
FROM ratings r
JOIN movies m ON r.movie_id = m.movie_id
WHERE m.comedy = 1

UNION ALL
SELECT 'Crime', ROUND(AVG(r.rating), 2)
FROM ratings r
JOIN movies m ON r.movie_id = m.movie_id
WHERE m.crime = 1

UNION ALL
SELECT 'Documentary', ROUND(AVG(r.rating), 2)
FROM ratings r
JOIN movies m ON r.movie_id = m.movie_id
WHERE m.documentary = 1

UNION ALL
SELECT 'Drama', ROUND(AVG(r.rating), 2)
FROM ratings r
JOIN movies m ON r.movie_id = m.movie_id
WHERE m.drama = 1

UNION ALL
SELECT 'Fantasy', ROUND(AVG(r.rating), 2)
FROM ratings r
JOIN movies m ON r.movie_id = m.movie_id
WHERE m.fantasy = 1

UNION ALL
SELECT 'Film-Noir', ROUND(AVG(r.rating), 2)
FROM ratings r
JOIN movies m ON r.movie_id = m.movie_id
WHERE m.filmnoir = 1

UNION ALL
SELECT 'Horror', ROUND(AVG(r.rating), 2)
FROM ratings r
JOIN movies m ON r.movie_id = m.movie_id
WHERE m.horror = 1

UNION ALL
SELECT 'Musical', ROUND(AVG(r.rating), 2)
FROM ratings r
JOIN movies m ON r.movie_id = m.movie_id
WHERE m.musical = 1

UNION ALL
SELECT 'Mystery', ROUND(AVG(r.rating), 2)
FROM ratings r
JOIN movies m ON r.movie_id = m.movie_id
WHERE m.mystery = 1

UNION ALL
SELECT 'Romance', ROUND(AVG(r.rating), 2)
FROM ratings r
JOIN movies m ON r.movie_id = m.movie_id
WHERE m.romance = 1

UNION ALL
SELECT 'Sci-Fi', ROUND(AVG(r.rating), 2)
FROM ratings r
JOIN movies m ON r.movie_id = m.movie_id
WHERE m.scifi = 1

UNION ALL
SELECT 'Thriller', ROUND(AVG(r.rating), 2)
FROM ratings r
JOIN movies m ON r.movie_id = m.movie_id
WHERE m.thriller = 1

UNION ALL
SELECT 'War', ROUND(AVG(r.rating), 2)
FROM ratings r
JOIN movies m ON r.movie_id = m.movie_id
WHERE m.war = 1

UNION ALL
SELECT 'Western', ROUND(AVG(r.rating), 2)
FROM ratings r
JOIN movies m ON r.movie_id = m.movie_id
WHERE m.western = 1

ORDER BY avg_rating DESC;

-- WHICH 10 USERs RATED THE biggest amount of MOVIES and what is their occupation and age and gender?

SELECT r.user_id, 
	COUNT(r.user_id) AS times_rated,
	u.age, u.gender, u.occupation
FROM ratings r
JOIN users u ON u.user_id = r.user_id
GROUP BY r.user_id, u.age, u.gender, u.occupation
ORDER BY times_rated DESC
LIMIT 10;

-- WHICH TITLES HAVE AVERAGE RATING ABOVE 4,0 (only those with at least 50 ratings)?

SELECT m.movie_id, m.title, ROUND(AVG(r.rating),2) AS avg_rating, COUNT(r.rating) AS r_amount
FROM movies m
JOIN ratings r ON m.movie_id = r.movie_id
GROUP BY m.movie_id, m.title
HAVING ROUND(AVG(r.rating),2) > 4
	AND COUNT(r.rating) >= 50
ORDER BY avg_rating DESC;

-- WHICH AGE GROUP OF USERS ARE THE MOST CRITICAL ABOUT MOVIES?

SELECT ROUND(AVG(r.rating),2) AS avg_rating,
	CASE
		WHEN u.age < 18 THEN '<18'
		WHEN u.age BETWEEN 18 AND 24 THEN '18-24'
		WHEN u.age BETWEEN 25 AND 34 THEN '25-34'
		WHEN u.age BETWEEN 35 AND 44 THEN '35-44'
		WHEN u.age BETWEEN 45 AND 54 THEN '45-54'
		WHEN u.age BETWEEN 55 AND 64 THEN '55-64'
		ELSE '65+'
	END AS age_group
FROM users u
JOIN ratings r ON u.user_id = r.user_id
GROUP BY age_group
ORDER BY avg_rating;

-- Most underrated movies (average above or eq 4.2 and amount of ratings below OR eq 25)

SELECT m.movie_id, 
	m.title, 
	ROUND(AVG(r.rating),2) AS avg_rating, 
	COUNT(r.rating) AS amount_of_ratings
FROM movies m
JOIN ratings r ON m.movie_id = r.movie_id
GROUP BY m.movie_id, m.title
HAVING ROUND(AVG(r.rating),2) >= 4.2
	AND COUNT(r.rating) <= 25
ORDER BY avg_rating DESC, m.title;