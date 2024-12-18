-- ================================================
-- SQL FRAGEN: DATENEXPLORATION
-- ================================================


-- 1. Wie viele Kunden gibt es in den Daten?

SELECT DISTINCT customer_id
FROM customers

-- 2. Welche Stadt hatte den höchsten Gewinn für das Unternehmen im Jahr 2015?

SELECT
		o.shipping_city,
    MAX(od.order_profits) AS max_profit
FROM orders AS o
JOIN order_details AS od ON o.order_id = od.order_id
GROUP BY o.shipping_city
ORDER BY max_profit DESC
LIMIT 1;

-- 3. Wie hoch war der Gewinn der profitabelsten Stadt im Jahr 2015?

WITH cte_orders AS
(
SELECT
    SPLIT_PART(order_id, '-', 1) AS country_code, -- Teilt die order_id und extrahiert in diesem Fall den country_code.
    SPLIT_PART(order_id, '-', 2) AS order_year,   -- Teilt die order_id und extrahiert in diesem Fall das order_year.
    LEFT(CAST(order_date AS TEXT), 10)::DATE AS order_date, -- Extrahiert die ersten 10 Zeichen als Text und formatiert sie als Datum.
    LEFT(CAST(shipping_date AS TEXT), 10)::DATE AS shipping_date -- Extrahiert die ersten 10 Zeichen als Text und formatiert sie anschließend als Datum.
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


Ergebnis: shipping-city = Minneapolis | max_proft = 4630

-- 4. Wie viele verschiedene Städte gibt es in den Daten?

SELECT
		COUNT(DISTINCT shipping_city) AS number_different_cities
FROM orders;


-- 5. Zeige die Gesamtausgaben der Kunden von niedrig nach hoch.

SELECT
		o.customer_id AS customers,
		SUM(order_sales) AS total_sales
FROM orders AS o
JOIN order_details AS od ON o.order_id = od.order_id
GROUP BY o.customer_id
ORDER BY total_sales ASC;

-- 6. Welche Stadt im Bundesstaat Tennessee war am profitabelsten?

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

-- 7. Wie hoch ist der durchschnittliche jährliche Gewinn für diese Stadt über alle Jahre hinweg?

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

-- 8. Wie ist die Verteilung der Kundentypen in den Daten?

SELECT 
    customer_segment,
    COUNT(DISTINCT customer_id) AS num_customers
FROM customers
GROUP BY customer_segment
ORDER BY num_customers DESC;

-- 9. Welche Produktkategorie war durchschnittlich am profitabelsten in Iowa über alle Jahre hinweg?

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

-- 10. Welches war das beliebteste Produkt in dieser Kategorie in allen Bundesstaaten im Jahr 2016?

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

-- 11. Welcher Kunde hat insgesamt den größten Rabatt erhalten?

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

-- 12. Wie stark schwankten die monatlichen Gewinne im Jahr 2018?

SELECT
		SUM(od.order_profits) AS sum_profit,
    TO_CHAR(o.order_date, 'MM') AS months   
FROM order_details AS od
		JOIN orders AS o
				ON od.order_id = o.order_id
WHERE LEFT(CAST(o.order_date AS TEXT),4) = '2018'
GROUP BY months    

-- 13. Welche Bestellung hatte den höchsten Umsatz im Jahr 2015?

SELECT
		od.order_id,
		SUM(od.order_sales) AS biggest_sales
FROM order_details AS od
		JOIN orders AS o ON od.order_id = o.order_id
WHERE TO_CHAR(o.order_date, 'YYYY') = '2015'
GROUP BY od.order_id
ORDER BY biggest_sales DESC
LIMIT 1

-- 14. Wie war der Rang jeder Stadt in der Ost-Region im Jahr 2015 basierend auf der Menge?

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

/* 15.  Zeige die Kundennamen für Kunden, die im Segment „Consumer“ oder „Corporate“ sind.
        Wie viele Kunden gibt es insgesamt?

        Die Frage lässt Interpretationsspielraum. Wenn man also beide Mengen darstellen 
        möchte, sieht die Abfrage wie folgt aus */

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

-- 16. Berechne die Differenz zwischen der größten und der kleinsten Bestellmenge für die Produkt-ID „100“.

 SELECT
 		MAX(quantity) - MIN(quantity) AS max_min_difference_quantity
 FROM order_details
 WHERE product_id = '100'

-- 17. Berechne den Prozentsatz der Produkte, die zur Kategorie „Möbel“ gehören.

SELECT
		ROUND((SELECT
		COUNT(product_id)	AS furniture_total_count	
		FROM product
		WHERE product_category = 'Furniture')::DECIMAL / COUNT(product_id) * 100 ,2) || ' %' AS percentage_products_category_furniture
FROM product

--alternativ

SELECT
    ROUND(
        (COUNT(CASE WHEN product_category = 'Furniture' THEN 1 END)::DECIMAL / COUNT(product_id)) * 100, 2
    		) || ' %' AS percentage_products_category_furniture
FROM product;

-- 18. Zeige die Anzahl der Produkt-Hersteller, die mehr als ein Produkt in der Produkttabelle haben.

SELECT
    COUNT(product_manufacturer) AS manufacturers_with_more_than_1_product
FROM 	(
    	SELECT
      		product_manufacturer
    	FROM product
    	GROUP BY product_manufacturer
    	HAVING COUNT(product_id) > 1 --schließt Hersteller mit NULL in der Spalte product_manufacturer aus
			) AS filtered_manufacturers;

/* 19.  Zeige die Produktunterkategorie und die Gesamtanzahl der Produkte in der Unterkategorie.
        
        Sortiere von den meisten zu den wenigsten Produkten und anschließend nach dem Namen der 
        Unterkategorie aufsteigend.*/
        
SELECT
		pr.product_category,
    pr.product_subcategory,
    COUNT(pr.product_subcategory) AS total_products
FROM product AS pr
GROUP BY	pr.product_category,
    			pr.product_subcategory
ORDER BY	total_products,
					pr.product_category;

-- 20. Zeige die Produkt-IDs und die Summe der Mengen, bei denen die Gesamtsumme der Produktmengen größer oder gleich 100 ist.

SELECT
		product_id,
		SUM(quantity) AS quantities_over_99
FROM order_details
GROUP BY product_id
HAVING SUM(quantity) >= 100

-- Führe alle Datenbanktabellen zu einem Datensatz zusammen, der alle einzigartigen Spalten enthält, und lade ihn als .csv-Datei herunter
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









