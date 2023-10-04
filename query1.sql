-- Name: G M Toufiqul Hoque
-- Course: DA651.1001
-- Assignment: Project 3
-- Description: Run query for all the actors whose first and last name is the same as a customer’s. Return the first names and last names.
USE sakila;
SELECT a.first_name, a.last_name
FROM actor a
intersect
SELECT c.first_name, c.last_name
FROM customer c;
