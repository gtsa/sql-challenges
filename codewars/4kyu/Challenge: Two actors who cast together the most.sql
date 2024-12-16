WITH actor_counts AS (
  SELECT DISTINCT
    LEAST(a.actor_id, b.actor_id) AS actor_id,
    GREATEST(a.actor_id, b.actor_id) AS actor_b_id,
    COUNT(*) AS count
  FROM film_actor a
  LEFT JOIN film_actor b
    ON a.film_id = b.film_id
  WHERE a.actor_id != b.actor_id
  GROUP BY a.actor_id, b.actor_id
  ORDER BY count DESC, actor_id
),
res AS (
  SELECT *
  FROM actor_counts
  WHERE count = (SELECT MAX(count) FROM actor_counts)
)
SELECT DISTINCT
  CONCAT(a1.first_name, ' ', a1.last_name) as first_actor,
  CONCAT(a2.first_name, ' ', a2.last_name) as second_actor,
  film.title
FROM film_actor aa
JOIN film_actor bb ON aa.film_id = bb.film_id
JOIN film ON aa.film_id = film.film_id
JOIN res ON aa.actor_id = res.actor_id AND bb.actor_id = res.actor_b_id
JOIN actor a1 ON res.actor_id = a1.actor_id
JOIN actor a2 ON res.actor_b_id = a2.actor_id
ORDER BY film.title;
