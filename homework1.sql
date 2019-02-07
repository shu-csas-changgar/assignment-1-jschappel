/**
Joahua Schappel
Assignment 1
*/

use sakila;

#1) What actors have a first name PENELOPE?
SELECT first_name, last_name FROM actor WHERE first_name = 'PENELOPE';


#2) What actors were in the movie ZOOLANDER FICTION?
SELECT 
a.first_name,
a.last_name
FROM film f
JOIN film_actor s
	ON f.film_id = s.film_id
JOIN actor a
	ON a.actor_id = s.actor_id
WHERE f.title = 'ZOOLANDER FICTION';


#3) What movies were JENNIFER DAVIS in?
SELECT
f.title
FROM film_actor s
JOIN actor a
	ON a.actor_id = s.actor_id
JOIN film f
	ON f.film_id = s.film_id
WHERE a.first_name = 'JENNIFER' AND a.last_name = 'DAVIS';


#4) What movies has LISA ANDERSON (customer id is 11) still not returned?
SELECT
f.title
FROM film f
JOIN inventory i
	ON f.film_id = i.film_id
JOIN rental r
	ON r.inventory_id = i.inventory_id
WHERE r.customer_id = 11 AND r.return_date IS NULL;


# 5) What movies are categorized as Animations?
SELECT
f.title
FROM film f
JOIN film_category c
	ON f.film_id = c.film_id
JOIN category s 
	ON c.category_id = s.category_id
	WHERE s.name ='ANIMATION';
    
    
#6) What did PAULA BRYANT  (customer id 95) pay to rent the movie CLOSER BANG?
SELECT rental_rate FROM film WHERE title = 'CLOSER BANG';


#7) What is the first and last name of the staff who rented the move CHAINSAW UPTOWN to MARIE TURNER?
SELECT
s.first_name,
s.last_name
FROM staff s
JOIN rental r
	ON r.staff_id = s.staff_id
JOIN customer c 
	ON c.customer_id = r.customer_id
JOIN inventory i
	ON r.inventory_id = i.inventory_id
JOIN film f
	ON f.film_id = i.film_id
WHERE f.title = 'CHAINSAW UPTOWN' AND c.first_name = 'MARIE' AND c.last_name ='TURNER';