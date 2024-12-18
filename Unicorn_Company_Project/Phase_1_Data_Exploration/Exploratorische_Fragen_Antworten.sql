-- ================================================
-- SQL FRAGEN: DATENEXPLORATION
-- ================================================

-- Um die Abfragen klarer zu gestalten habe ich zuerst für folgende Tabellen eine CTE (common table expression) erstellt 
-- orders:
WITH cte_orders AS
(
SELECT
    SPLIT_PART(order_id, '-', 1) AS country_code, -- teilt die order_id auf und extrahiert in diesem Fall den country_code  
    SPLIT_PART(order_id, '-', 2) AS order_year, -- teilt die order_id auf und extrahiert in diesem Fall das order_year 
	LEFT(CAST(order_date AS TEXT), 10)::DATE AS order_date, -- Extrahiert 10 Pos. von L. das Datum als Text und formatiert es als Datum 
    LEFT(CAST(shipping_date AS TEXT), 10)::DATE AS shipping_date -- Extrahiert 10 Pos. von L. das Datum als Text und formatiert es als Datum
FROM orders
)

-- Über "cte_orders" kann diese cte wie eine Tabelle abgerufen werden. Da diese nach der ersten Ausführung im Cache 
-- liegt ist der Abruf sehr schnell


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

-- 10. Welches war das beliebteste Produkt in dieser Kategorie in allen Bundesstaaten im Jahr 2016?

-- 11. Welcher Kunde hat insgesamt den größten Rabatt erhalten?

-- 12. Wie stark schwankten die monatlichen Gewinne im Jahr 2018?

-- 13. Welche Bestellung hatte den höchsten Umsatz im Jahr 2015?

-- 14. Wie war der Rang jeder Stadt in der Ost-Region im Jahr 2015 basierend auf der Menge?

-- 15. Zeige die Kundennamen für Kunden, die im Segment „Consumer“ oder „Corporate“ sind.
--     Wie viele Kunden gibt es insgesamt?

-- 16. Berechne die Differenz zwischen der größten und der kleinsten Bestellmenge für die Produkt-ID „100“.

-- 17. Berechne den Prozentsatz der Produkte, die zur Kategorie „Möbel“ gehören.

-- 18. Zeige die Anzahl der Produkt-Hersteller, die mehr als ein Produkt in der Produkttabelle haben.

-- 19. Zeige die Produktunterkategorie und die Gesamtanzahl der Produkte in der Unterkategorie.
--     Sortiere von den meisten zu den wenigsten Produkten und anschließend nach dem Namen der Unterkategorie aufsteigend.

-- 20. Zeige die Produkt-IDs und die Summe der Mengen, bei denen die Gesamtsumme der Produktmengen größer oder gleich 100 ist.