-- Lab | SQL Join (Part I)
-- 1. How many films are there for each of the categories in the category table.
--  Use appropriate join to write this query.

SELECT * from sakila;
select c.category_id as category, count(f.film_id) as 'number of films' from film f
join film_category c 
on c.film_id = f.film_id
GROUP BY category
ORDER BY `number of films` DESC;

-- 2. Display the total amount rung up by each staff member in August of 2005.

-- using table payments take staff_id and from table staff use first_name, 
-- join them using common column staff_id then count amount and group by staff_id
-- filter date august 2005 (filter before group - WHERE)

SELECT s.first_name, s.last_name, SUM(p.amount) as 'total amount' FROM staff s
INNER JOIN payment p
ON s.staff_id = p.staff_id
GROUP BY p.staff_id
ORDER BY last_name;

-- 3. Which actor has appeared in the most films?

SELECT a.first_name, a.last_name, count(*) as films
FROM sakila.actor as a
left JOIN sakila.film_actor as fa 
ON a.actor_id = fa.actor_id 
GROUP BY first_name, last_name
ORDER BY films desc
LIMIT 1;


-- 4. Most active customer (the customer that has rented the most number of films)

SELECT c.customer_id, concat(c.first_name, ' ', c.last_name) as 'Most Active Customer', 
count(*) as Total_Rentals
FROM rental as r
INNER JOIN customer AS c 
on r.customer_id = c.customer_id
GROUP BY c.customer_id, `Most Active Customer`
ORDER BY Total_Rentals DESC 
LIMIT 1;


-- 5. Display the first and last names, as well as the address, of each staff member.

SELECT first_name, last_name, address
FROM staff s
INNER JOIN address a
ON s.address_id = a.address_id;


-- 6. List each film and the number of actors who are listed for that film.

SELECT f.title, COUNT(actor_id) as 'number of actors'
FROM film f
INNER JOIN film_actor fa
ON f.film_id = fa.film_id
GROUP BY title
ORDER BY `number of actors` DESC;

-- 7. Using the tables payment and customer and the JOIN command, 
-- list the total paid by each customer. List the customers alphabetically by last name.

SELECT last_name, first_name, SUM(amount)
FROM payment p
INNER JOIN customer c
ON p.customer_id = c.customer_id
GROUP BY p.customer_id
ORDER BY last_name ASC;


-- 8. List number of films per category.

SELECT fc.category_id, COUNT(fc.film_id) as 'films per category'
FROM film_category fc
INNER JOIN film f
ON fc.film_id = f.film_id
GROUP BY category_id
ORDER BY `films per category`;
