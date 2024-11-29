/*
Complex WHERE clauses: Using Brackets
*/

SELECT *
FROM ba_flights_excerpt
WHERE (departure_city = 'Berlin' 
       AND total_passengers > 100 
       AND distance_flown > 3000)
   OR departure_city = 'London';
   
SELECT *
FROM ba_flights_excerpt
WHERE revenue_from_baggage > 1000
   OR (baggage_weight > 500 
       AND status = 'completed');   

SELECT *
FROM ba_flights_excerpt
WHERE actual_flight_date > '2024-01-01'
  AND (departure_city = 'London'
       OR arrival_city = 'Aberdeen');


SELECT flight_id, airline, total_passengers
FROM ba_flights_excerpt
WHERE (departure_city = 'Berlin' AND total_passengers > 150)
   OR (arrival_city = 'Paris' AND revenue_from_baggage > 2000);






