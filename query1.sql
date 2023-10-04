-- Name: G M Toufiqul Hoque
-- Course: DA651.1001
-- Assignment: Project 2B
-- Description: Run query for actors with first_name, last_name of all actors whose last_name starts with the letter “G”. Return your results ordered by last name.

USE sakila;
SELECT first_name, last_name
FROM actor
WHERE last_name LIKE 'G%'
ORDER BY last_name;
