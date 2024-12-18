-- ================================================
-- SQL QUESTIONS: DATA EXPLORATION
-- ================================================

-- To make the queries clearer, I first created a CTE (Common Table Expression) for the following table:
-- orders:


-- The CTE "cte_orders" can be accessed like a table. Since it is cached after the first execution,
-- retrieval is very fast.


-- 1. How many customers do we have in the data?

SELECT DISTINCT customer_id
FROM customers

-- 2. What was the city with the most profit for the company in 2015?

SELECT
		o.shipping_city,
    MAX(od.order_profits) AS max_profit
FROM orders AS o
JOIN order_details AS od ON o.order_id = od.order_id
GROUP BY o.shipping_city
ORDER BY max_profit DESC
LIMIT 1;

-- 3. In 2015, what was the most profitable city’s profit?

WITH cte_orders AS
(
SELECT
    SPLIT_PART(order_id, '-', 1) AS country_code, -- Splits the order_id and extracts the country_code in this case
    SPLIT_PART(order_id, '-', 2) AS order_year,   -- Splits the order_id and extracts the order_year in this case
    LEFT(CAST(order_date AS TEXT), 10)::DATE AS order_date, -- Extracts the first 10 characters as text and formats it as a date
    LEFT(CAST(shipping_date AS TEXT), 10)::DATE AS shipping_date -- Extracts the first 10 characters as text and formats it as a date
FROM orders
)

SELECT
		o.shipping_city,
    MAX(od.order_profits) AS max_profit
FROM orders AS o
JOIN order_details AS od ON o.order_id = od.order_id
AND o.order_date::TEXT LIKE '2015%'
GROUP BY o.shipping_city
ORDER BY max_profit DESC
LIMIT 1;


-- 4. How many different cities do we have in the data?

SELECT
		COUNT(DISTINCT shipping_city) AS number_different_cities
FROM orders;



-- 5. Show the total spent by customers from low to high.

SELECT
		o.customer_id AS customers,
		SUM(order_sales) AS total_spend
FROM orders AS o
JOIN order_details AS od ON o.order_id = od.order_id
GROUP BY o.customer_id
ORDER BY total_spend DESC;

-- 6. What is the most profitable city in the State of Tennessee?

SELECT 
		o.shipping_city,
		SUM(order_profits) AS total_profits
FROM order_details AS od
JOIN orders AS o 
ON od.order_id = o.order_id
WHERE shipping_state = 'Tennessee'
GROUP BY o.shipping_city
ORDER BY total_profits DESC
LIMIT 1

-- 7. What’s the average annual profit for that city across all years?

WITH cte_orders AS 
(
    SELECT
        o.order_id,
        SPLIT_PART(o.order_id, '-', 2) AS order_year,
        o.shipping_city
    FROM orders AS o
),

most_profitable_city AS 
(
    SELECT 
        o.shipping_city,
        SUM(od.order_profits) AS total_profits
    FROM order_details AS od
    JOIN orders AS o ON od.order_id = o.order_id
    WHERE o.shipping_state = 'Tennessee'
    GROUP BY o.shipping_city
    ORDER BY total_profits DESC
    LIMIT 1
)

SELECT 
    cte.shipping_city,
    cte.order_year,
    ROUND(AVG(od.order_profits)::INT, 2) AS avg_annual_profit
FROM order_details AS od
JOIN orders AS o 
		ON od.order_id = o.order_id
JOIN cte_orders AS cte 
		ON cte.order_id = o.order_id
JOIN most_profitable_city AS mpc 
		ON cte.shipping_city = mpc.shipping_city
GROUP BY cte.order_year, cte.shipping_city
ORDER BY cte.order_year;

-- 8. What is the distribution of customer types in the data?

SELECT 
    customer_segment,
    COUNT(DISTINCT customer_id) AS num_customers
FROM customers
GROUP BY customer_segment
ORDER BY num_customers DESC;

-- 9. What’s the most profitable product category on average in Iowa across all years?

-- 10. What is the most popular product in that category across all states in 2016?

-- 11. Which customer got the most discount in the data (in total amount)?

-- 12. How widely did monthly profits vary in 2018?

-- 13. Which was the biggest order regarding sales in 2015?

-- 14. What was the rank of each city in the East region in 2015 in quantity?

-- 15. Display customer names for customers who are in the segment ‘Consumer’ or ‘Corporate.’
--     How many customers are there in total?

-- 16. Calculate the difference between the largest and smallest order quantities for product ID ‘100.’

-- 17. Calculate the percent of products that are within the category ‘Furniture.’

-- 18. Display the number of product manufacturers with more than 1 product in the product table.

--
