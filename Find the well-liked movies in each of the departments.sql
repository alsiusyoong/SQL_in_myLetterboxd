# I am interested in seeing which film has the most likes in each film genre. 
# A well-liked movie in a genre is a film which has a like count in the top 3 unique like counts for that genre. 
# Find the well-liked movies in each of the departments.

WITH tmp AS (
SELECT
	g.genre AS 'Genre', f.film_name AS 'Film_Name', COUNT(a.like_status) AS 'Like_Cnt',
	DENSE_RANK() OVER (PARTITION BY f.genre_id ORDER BY a.Like_Count DESC) AS 'Like_Rank'
	FROM film AS f
	JOIN film_genre AS fg ON fg.film_id = f.film_id
	JOIN genre AS g ON g.genre_id = fg.genre_id
	JOIN activity a ON a.film_id = f.film_id
)
SELECT Genre, Film_Name, Like_Count FROM tmp
WHERE Like_Rank < 4
ORDER BY Genre, Film_Name, Like_Count DESC;