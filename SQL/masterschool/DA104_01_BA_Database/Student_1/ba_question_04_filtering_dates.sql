/*Filtering Dates*/


SELECT
		flight_id,
		airline,
    actual_flight_date
FROM ba_flights_excerpt
WHERE actual_flight_date BETWEEN '2023/04/01' AND '2023/04/10'
AND airline IS NOT NULL
ORDER BY actual_flight_date DESC;

SELECT *
FROM ba_flights_excerpt
WHERE actual_flight_date >= '2023-04-01'
  AND actual_flight_date < '2023-04-10';


SELECT
		flight_id,
		airline,
    actual_flight_date
FROM ba_flights_excerpt
WHERE EXTRACT(MONTH FROM actual_flight_date) = 4
AND airline IS NOT NULL
ORDER BY actual_flight_date DESC;


SELECT *
FROM ba_flights_excerpt
WHERE DATE_PART('month', actual_flight_date) = 4;

SELECT*
FROM ba_flights_excerpt
WHERE actual_flight_date >= DATE '2023/05/20' - INTERVAL '10 days';

SELECT*
FROM ba_flights_excerpt
WHERE actual_flight_date >= CURRENT_DATE - INTERVAL '30 days';

SELECT*
FROM ba_flights_excerpt
WHERE actual_flight_date = CURRENT_DATE;

SELECT *
FROM ba_flights
WHERE actual_flight_date 
IN ('2023-04-05', '2023-05-07');





