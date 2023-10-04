-- Name: G M Toufiqul Hoque
-- Course: DA651.1001
-- Assignment: Project 2B
-- Description: Run query for all columns of all (rental) transactions where the rental date is between (and including) 2005-05-26 00:47:47 and 2005-05-27 23:00:25. Return your results ordered by rental ID


USE sakila;
SELECT *
FROM rental
WHERE rental_date BETWEEN '2005-05-26 00:47:47' AND '2005-05-27 23:00:25'
ORDER BY rental_id;



