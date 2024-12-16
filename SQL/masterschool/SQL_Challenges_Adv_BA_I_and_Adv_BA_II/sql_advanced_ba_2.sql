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
