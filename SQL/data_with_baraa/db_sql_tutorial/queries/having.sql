SELECT
	COUNT(*) AS total_customers,
    country
FROM customers
GROUP BY country
HAVING count(*) > 1