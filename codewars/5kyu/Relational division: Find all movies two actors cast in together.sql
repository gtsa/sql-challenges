-- Replace with your SQL Query
SELECT title
FROM film_actor LEFT JOIN film
ON film_actor.film_id = film.film_id
WHERE film_actor.film_id IN
  (SELECT film_actor.film_id
  FROM  film_actor
  WHERE film_actor.actor_id = 105)
  AND film_actor.actor_id = 122
