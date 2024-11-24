SELECT
	*
FROM orders
WHERE customer_id 
IN (SELECT
	customer_id
    FROM customers
    WHERE score > 500);
				