-- Name: G M Toufiqul Hoque
-- Course: DA651.1001
-- Assignment: Project 2A
-- Description: Run query for customer email of BARBARA JONES

USE sakila;
SELECT email
FROM customer
WHERE first_name= 'BARBARA' AND last_name='JONES';