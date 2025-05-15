

-- ------------------------------------------------------------------------
-- CHALLENGE SECTION: ANSWER KEY
-- ------------------------------------------------------------------------

-- 11. Find all customers who do NOT have an email address.
SELECT customer_id, first_name, last_name
FROM customer
WHERE email IS NULL;

-- 12. Fix the query intended to return customers in Canada.
SELECT c.customer_id, c.first_name, c.last_name, co.country
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id
WHERE co.country = 'Canada';

-- 13. Rewrite using IN.
SELECT * FROM actor
WHERE last_name IN ('SMITH', 'JONES', 'LEE');

-- 14. Why does this query return no results?
-- Because NULL cannot be compared using =.
-- It must use IS NULL or IS NOT NULL to work properly.

-- 15. List of PG or PG-13 films with rental duration > 5.
SELECT film_id, title, rating, rental_duration
FROM film
WHERE rating IN ('PG', 'PG-13')
AND rental_duration > 5;

