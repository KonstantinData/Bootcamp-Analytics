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

-- Ohne CTE
SELECT
		o.shipping_city,
    MAX(od.order_profits) AS max_profit
FROM orders AS o
JOIN order_details AS od ON o.order_id = od.order_id
JOIN cte_orders AS cto ON o.order_id = cto.order_id
AND cto.order_year = '2015'
GROUP BY o.shipping_city
ORDER BY max_profit DESC
LIMIT 1;

-- Mit CTE
SELECT
		o.shipping_city,
    MAX(od.order_profits) AS max_profit
FROM orders AS o
JOIN order_details AS od ON o.order_id = od.order_id
JOIN cte_orders AS cto ON o.order_id = cto.order_id
AND cto.order_year = '2015'
GROUP BY o.shipping_city
ORDER BY max_profit DESC
LIMIT 1;

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

SELECT DISTINCT shipping_city
FROM orders

-- 5. Zeige die Gesamtausgaben der Kunden von niedrig nach hoch.

SELECT
		o.customer_id AS customers,
		SUM(order_sales) AS total_sales
FROM orders AS o
JOIN order_details AS od ON o.order_id = od.order_id
GROUP BY o.customer_id
ORDER BY total_sales ASC;

-- 6. Welche Stadt im Bundesstaat Tennessee war am profitabelsten?

-- 7. Wie hoch ist der durchschnittliche jährliche Gewinn für diese Stadt über alle Jahre hinweg?

-- 8. Wie ist die Verteilung der Kundentypen in den Daten?

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