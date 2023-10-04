-- Name: G M Toufiqul Hoque
-- Course: DA651.1001
-- Assignment: Project 2B
-- Description: Run query for actors with first_name, last_name of all customers whose name (either first or last) contains the letters “RA”. Return your results ordered by last name.

USE sakila;
SELECT first_name, last_name
FROM customer
WHERE first_name REGEXP 'RA' OR last_name REGEXP 'RA'
ORDER BY last_name;
