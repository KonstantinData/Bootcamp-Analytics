-- ================================================
-- SQL QUESTIONS: DATA EXPLORATION
-- ================================================

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

SELECT
		pr.product_category,
    ROUND(AVG(od.order_profits)::DECIMAL,2) AS avg_profit
FROM product AS pr
JOIN order_details AS od 
		ON od.product_id = pr.product_id
JOIN orders AS o
    ON od.order_id = o.order_id
WHERE o.shipping_state = 'Iowa'
GROUP BY pr.product_category
ORDER BY avg_profit DESC
LIMIT 1;

-- 10. What is the most popular product in that category across all states in 2016?

WITH top_product_category AS
(
SELECT
		pr.product_category,
    ROUND(AVG(od.order_profits)::DECIMAL,2) AS avg_profit
FROM product AS pr
JOIN order_details AS od 
		ON od.product_id = pr.product_id
JOIN orders AS o
    ON od.order_id = o.order_id
WHERE o.shipping_state = 'Iowa'
GROUP BY pr.product_category
ORDER BY avg_profit DESC
LIMIT 1
)


SELECT
		pr.product_subcategory,
    COUNT(od.order_id) AS count_order_id
FROM product AS pr
		JOIN order_details AS od 
    		ON pr.product_id = od.product_id
    JOIN orders AS o 
    		ON od.order_id = o.order_id
    JOIN top_product_category AS tpc 
    		ON pr.product_category = tpc.product_category
WHERE LEFT(CAST(o.order_date AS TEXT), 4) = '2016'
GROUP BY pr.product_subcategory
ORDER BY count_order_id DESC;

-- 11. Which customer got the most discount in the data (in total amount)?

SELECT
		cm.customer_id,
    cm.customer_name,
    ROUND(SUM(od.order_discount)::DECIMAL,2) AS max_discount
FROM customers AS cm
		JOIN orders AS o 
    		ON cm.customer_id = o.customer_id
		JOIN order_details AS od 
    		ON o.order_id = od.order_id
GROUP BY 	cm.customer_id,
    			cm.customer_name
ORDER BY max_discount DESC
LIMIT 1;

-- 12. How widely did monthly profits vary in 2018?

SELECT
		SUM(od.order_profits) AS sum_profit,
    TO_CHAR(o.order_date, 'MM') AS months   
FROM order_details AS od
		JOIN orders AS o
				ON od.order_id = o.order_id
WHERE LEFT(CAST(o.order_date AS TEXT),4) = '2018'
GROUP BY months    

-- 13. Which was the biggest order regarding sales in 2015?

SELECT
		od.order_id,
		SUM(od.order_sales) AS biggest_sales
FROM order_details AS od
		JOIN orders AS o ON od.order_id = o.order_id
WHERE TO_CHAR(o.order_date, 'YYYY') = '2015'
GROUP BY od.order_id
ORDER BY biggest_sales DESC
LIMIT 1

-- 14. What was the rank of each city in the East region in 2015 in quantity?

SELECT
		o.shipping_city,
    SUM(od.quantity) AS sum_quantity,
    RANK() OVER(ORDER BY SUM(od.quantity) DESC) AS rank_quantity
FROM order_details AS od
		JOIN orders AS o 
    		ON od.order_id = o.order_id
WHERE o.shipping_region = 'East'
AND TO_CHAR(o.order_date::DATE, 'YYYY') = '2015'
GROUP BY o.shipping_city
ORDER BY rank_quantity;

/* 15. Display customer names for customers who are in the segment ‘Consumer’ or ‘Corporate.’
       How many customers are there in total?

       The question allows for some room for interpretation, so if you want to represent both 
       sets, the query looks as follows: */

SELECT 
    customer_name,
    customer_segment,
    COUNT(*) OVER () AS segment_customers,
    (
  	SELECT 
      COUNT(customer_id)
		FROM customers
    ) AS total_customers
    
FROM customers
WHERE customer_segment IN ('Consumer', 'Corporate')
GROUP BY 	customer_name,
    			customer_segment
ORDER BY	customer_segment;     

-- 16. Calculate the difference between the largest and smallest order quantities for product ID ‘100.’

 SELECT
 		MAX(quantity) - MIN(quantity) AS max_min_difference_quantity
 FROM order_details
 WHERE product_id = '100'

-- 17. Calculate the percent of products that are within the category ‘Furniture.’

SELECT
		ROUND((SELECT
		COUNT(product_id)	AS furniture_total_count	
		FROM product
		WHERE product_category = 'Furniture')::DECIMAL / COUNT(product_id) * 100 ,2) || ' %' AS percentage_products_category_furniture
FROM product

--alternativly

SELECT
    ROUND(
        (COUNT(CASE WHEN product_category = 'Furniture' THEN 1 END)::DECIMAL / COUNT(product_id)) * 100, 2
    		) || ' %' AS percentage_products_category_furniture
FROM product;

-- 18. Display the number of product manufacturers with more than 1 product in the product table.

SELECT
    COUNT(product_manufacturer) AS manufacturers_with_more_than_1_product
FROM 	(
    	SELECT
      		product_manufacturer
    	FROM product
    	GROUP BY product_manufacturer
    	HAVING COUNT(product_id) > 1 --Excludes manufacturers where the product_manufacturer column contains NULL
			) AS filtered_manufacturers;

/* 19.  Show the product_subcategory and the total number of products in the subcategory.
        Show the order from most to least products and then by product_subcategory name ascending.  */

SELECT
		pr.product_category,
    pr.product_subcategory,
    COUNT(pr.product_subcategory) AS total_products
FROM product AS pr
GROUP BY	pr.product_category,
    			pr.product_subcategory
ORDER BY	total_products,
					pr.product_category;

-- 20. Show the product_id(s), the sum of quantities, where the total sum of its product quantities is greater than or equal to 100.

SELECT
		product_id,
		SUM(quantity) AS quantities_over_99
FROM order_details
GROUP BY product_id
HAVING SUM(quantity) >= 100

--Join all database tables into one dataset that includes all unique columns and download it as a .csv file.

SELECT 
    o.order_id,
    o.customer_id,
    o.order_date,
    o.shipping_city,
    o.shipping_state,
    o.shipping_region,
    o.shipping_country,
    o.shipping_postal_code,
    o.shipping_date,
    o.shipping_mode,
    od.order_details_id,
    od.product_id,
    od.quantity,
    od.order_discount,
    od.order_profits,
    od.order_profit_ratio,
    od.order_sales,
    c.customer_name,
    c.customer_segment,
    pr.product_name,
    pr.product_category,
    pr.product_subcategory,
    pr.product_manufacturer
FROM orders AS o
JOIN order_details AS od 
    ON o.order_id = od.order_id
JOIN customers AS c 
    ON o.customer_id = c.customer_id
JOIN product AS pr 
    ON od.product_id = pr.product_id;

/* 	For further processing in Phase 2, the exported CSV file from this query is not relevant, as a spreadsheet in Google Sheets 
	will be provided instead. Comparing the use of a relational database with spreadsheets is intended to help us understand how 
	information is efficiently managed by observing the differences.

	End of Phase 1
*/







