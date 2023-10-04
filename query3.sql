-- Assignment: Project 4
-- Description: Run query for Using INTERSECT, select the first and last names of customers who live in Argentina intersected with customers who have 
-- rented films less than 50 (minutes) in length. Order by last name, then first name.

USE sakila;

SELECT c.first_name, c.last_name
FROM customer c
INNER JOIN address a
ON a.address_id= c.address_id
INNER JOIN city ct
ON ct.city_id = a.city_id
INNER JOIN country con
ON ct.country_id= con.country_id
WHERE country= 'Argentina'
intersect 
SELECT c1.first_name, c1.last_name
FROM customer c1
INNER JOIN rental r
ON c1.customer_id=r.customer_id
INNER JOIN inventory i
ON i.inventory_id=r.inventory_id
INNER JOIN film f
ON i.film_id=f.film_id
WHERE f.length <50
ORDER BY last_name, first_name;

