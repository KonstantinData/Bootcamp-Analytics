SELECT DISTINCT fav_tennis_player
FROM customers;

WITH rafa_table AS (
  SELECT
  	CASE
  		WHEN fav_tennis_player LIKE 'Rafa%' THEN 'Rafa'
  		ELSE fav_tennis_player 
  	END AS fav_tennis_player_clean,
  FROM customers)

SELECT*
FROM rafa_table
WHERE fav_tennis_player_clean = 'Rafa'



/*
First, use a WITH statement to replace the missing data in the product_id 
column in order_items_vintage with ‘P012’.

Then, show all revenue for the Vintage product “Vintage Nike Air Max 1”.
*/

SELECT 
DISTINCT product_id
FROM order_items_vintage
ORDER BY product_id;

WITH oiv_cleaned AS(
  SELECT 
  		order_item_id, 
  		order_id, 
  		coalesce(product_id, 'P012') AS product_id, 
      created_at, 
      shipped_at
  FROM order_items_vintage
 )    

SELECT
  pr.product_name  
FROM products AS pr
JOIN oiv_cleaned
ON pr.product_id = oiv_cleaned.product_id
WHERE product_name = 'Vintage Nike Air Max 1'
GROUP BY pr.product_name


/*“ “ Can you clean the data and show the % of revenue from repeat customers and new customers for the vintage business?

Hint: replace product_id NULLs with P012 for order_items_vintage
*/

WITH oiv_cleaned AS(
  SELECT 
  		order_item_id, 
  		order_id, 
  		coalesce(product_id, 'P012') AS product_id, 
      created_at, 
      shipped_at
  FROM order_items_vintage
 ),
 
 vintage_orders AS
 (SELECT*
 FROM orders
 WHERE order_id IN(SELECT order_id FROM order_items_vintage))

SELECT*
FROM vintage_orders