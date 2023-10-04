-- Assignment: Project 4
-- Description: Run query for Select the first and last names of customers who live in Brazil EXCEPT those that live in 
-- Boa Vista or Anpolis. Order by last name, then first name.

USE sakila;
SELECT c.first_name, c.last_name
FROM customer c
INNER JOIN address a
ON a.address_id= c.address_id
INNER JOIN city ct
ON ct.city_id = a.city_id
INNER JOIN country con
ON ct.country_id= con.country_id
WHERE country= 'Brazil'
EXCEPT 
SELECT c.first_name, c.last_name
FROM customer c
INNER JOIN address a
ON a.address_id= c.address_id
INNER JOIN city ct
ON ct.city_id = a.city_id
WHERE ct.city= 'Boa Vista' OR ct.city= 'Anpolis'
ORDER  BY last_name, first_name;










