-- Name: G M Toufiqul Hoque
-- Course: DA651.1001
-- Assignment: Project 3
-- Description: Run query for transactions of Cynthia Young. Return the film title and rental price, ordered by film title.


USE sakila;
SELECT f.title, p.amount
FROM payment p
INNER JOIN customer cu
ON p.customer_id= cu.customer_id
INNER JOIN rental r
ON p.rental_id=r.rental_id
INNER JOIN  inventory i
ON r.inventory_id=i.inventory_id
INNER JOIN film f
ON f.film_id= i.film_id
WHERE cu.first_name= 'Cynthia' AND cu.last_name= 'Young'
ORDER BY f.title;



