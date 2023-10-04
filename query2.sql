-- Name: G M Toufiqul Hoque
-- Course: DA651.1001
-- Assignment: Project 3
-- Description: Run query for all the films that star actors with a first name starting with “A”. Return the first and last names of the actor, the title of the film, and the description of the film, ordered by film title.

USE sakila;
SELECT a.first_name, a.last_name, f.title, f.description
FROM actor a
JOIN film_actor fa
ON a.actor_id= fa.actor_id
JOIN film f
ON fa.film_id= f.film_id
WHERE first_name LIKE 'A%'
ORDER BY f.title;