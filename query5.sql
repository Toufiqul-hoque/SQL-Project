-- Assignment: Project 4
-- Description: Run query for the titles of films that feature Penelope Guiness, Alec Wayne, Tom
-- Miranda, and/or Kevin Bloom EXCEPT the films that are R-rated. Order by title.

USE sakila;
SELECT f.title
FROM film_actor fa
INNER JOIN film f
ON f.film_id=fa.film_id
INNER JOIN actor a
ON a.actor_id= fa.actor_id
WHERE a.first_name IN ('Penelope', 'Alec', 'Tom' , 'Kevin') AND a.last_name IN ('Guiness', 'Wayne', 'Miranda', 'Bloom')
EXCEPT
SELECT f.title
FROM film_actor fa
INNER JOIN film f
ON f.film_id=fa.film_id
INNER JOIN actor a
ON a.actor_id= fa.actor_id
WHERE f.rating= 'R'
ORDER BY title;
