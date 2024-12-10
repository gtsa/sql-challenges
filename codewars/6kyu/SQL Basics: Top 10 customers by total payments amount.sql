-- Replace with your query (in pure SQL)

SELECT customer.customer_id, email, COUNT(*) as payments_count, CAST(SUM(amount) as FLOAT) as total_amount
FROM customer LEFT JOIN payment
ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id
ORDER BY total_amount DESC
LIMIT 10
