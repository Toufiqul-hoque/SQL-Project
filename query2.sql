-- Assignment: Project 4
-- Description: Run query for  Select the first and last names of all actors/actresses and customers that have starred in or rented a movie with a duration
-- less than 100 (minutes). Order by last name, then first name

USE sakila;

SELECT a.first_name, a.last_name
FROM film_actor fa
INNER JOIN film f
ON f.film_id=fa.film_id
INNER JOIN actor a
ON a.actor_id= fa.actor_id
WHERE f.length <100
UNION 
SELECT c.first_name, c.last_name
FROM customer c
INNER JOIN rental r
ON c.customer_id=r.customer_id
INNER JOIN inventory i
ON i.inventory_id=r.inventory_id
INNER JOIN film f
ON i.film_id=f.film_id
WHERE f.length <100
ORDER BY last_name, first_name;


