-- Name: G M Toufiqul Hoque
-- Course: DA651.1001
-- Assignment: Project 2B
-- Description: Run query for all columns of all (payment) transactions where the total amount paidis between $2.99 and $5.99, starting from (and including) 2005-10-05 23:01:21. Return your results ordered payment ID
USE sakila;
SELECT *
FROM payment
WHERE payment_date >= '2005/10/05 23:01:21' AND amount BETWEEN 2.99 AND 5.99
ORDER BY payment_id;




