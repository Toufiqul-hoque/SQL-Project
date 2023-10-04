-- Name: G M Toufiqul Hoque
-- Course: DA651.1001
-- Assignment: Project 2B
-- Description: Run query for the first and last names of actors whose first name does not start with “A”. Return your results ordered by last name, then first name

USE sakila;
SELECT first_name, last_name
FROM actor
WHERE first_name NOT LIKE 'A%'
ORDER BY last_name, first_name;

