-- Name: G M Toufiqul Hoque
-- Course: DA651.1001
-- Assignment: Project 3
-- Description: Run query for address of customer Audrey Ray. Return the customer first and last names, the address, the city, the district, and the postal code.



USE sakila;
SELECT cu.first_name,cu.last_name,ad.address,ct.city, ad.district, ad.postal_code
FROM address ad
JOIN customer cu
ON ad.address_id= cu.address_id
JOIN city ct
ON ct.city_id= ad.city_id
WHERE first_name ='Audrey' AND last_name='Ray';