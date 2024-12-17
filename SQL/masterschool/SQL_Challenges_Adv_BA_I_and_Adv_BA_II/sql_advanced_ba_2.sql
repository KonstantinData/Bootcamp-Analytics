/*
Question #1: 
To get started with analysis, create a summary of how many short-haul versus long-haul 
flights happen. A typical short-haul flight in Europe has a maximum distance of 2,000 km.

How many flights are scheduled or completed for both short-haul and long-haul flights in 2023?
*/

-- Table: flight_lenght, total_flights
-- ba_flight_routes, ba_flights
-- actual_flight_date, flight_id, status, distance_flown
-- WHERE distance_flown > 2000 == long_haul_flight
-- AND status true

SELECT
    CASE WHEN routes.distance_flown > 2000 THEN 'Long Haul Flight'
    ELSE 'Short Haul Flight'
    END AS lenght_flight,
    COUNT(flights.flight_id) AS Total_Flights
FROM ba_flight_routes AS routes
JOIN ba_flights AS flights ON routes.flight_number = flights.flight_number
WHERE flights.status <> 'Cancelled'
GROUP BY lenght_flight

/*
Question #2: 
We can calculate how full flights were by comparing the number of passengers on the 
flight against the capacity of the aircraft.

Calculate the average number of empty seats for the short-haul and long-haul flights. 
Additionally, can you also calculate the average number of empty seats as a percentage 
of the maximum number of passengers?

If the manufacturer and sub-type are not available for flights, we do not need to show 
the results of these flights.
*/

-- # passengers vs capacity flights
-- avg_empty_seats short-haul and long-haul flights
-- avg_empty_seats rate
-- DISTICT/GROUP BY

WITH flight_length_categories AS
(
 SELECT
		flights.flight_number,
    flights.flight_id,
		CASE
    		WHEN routes.distance_flown > 2000 THEN 'Long Haul Flight'
        ELSE 'Short Haul Flight'
        END AS flight_length_categories
FROM ba_flights AS flights
JOIN ba_flight_routes AS routes ON flights.flight_number = routes.flight_number
),

empty_seats AS
(
SELECT
		flights.flight_id,
		flc.flight_length_categories,
		SUM(eff.capacity) - SUM(flights.total_passengers) AS empty_seats
FROM ba_flights AS flights
JOIN flight_length_categories AS flc ON flights.flight_id = flc.flight_id
JOIN ba_aircraft AS air ON flights.flight_id = air.flight_id
JOIN ba_fuel_efficiency AS eff ON air.ac_subtype = eff.ac_subtype
GROUP BY flc.flight_length_categories, flights.flight_id
)

SELECT
		flc.flight_length_categories,
    SUM(es.empty_seats) AS empty_seats,
		ROUND(AVG(es.empty_seats::INT / NULLIF(flights.total_passengers,0)), 2) || ' %' AS empty_seats_ratio
 FROM ba_flights AS flights
 JOIN empty_seats AS es ON flights.flight_id = es.flight_id
 JOIN flight_length_categories AS flc ON flights.flight_id = flc.flight_id
 GROUP BY flc.flight_length_categories