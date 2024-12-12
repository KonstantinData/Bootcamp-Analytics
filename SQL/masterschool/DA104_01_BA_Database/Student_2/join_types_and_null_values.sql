-- NULL values and joins

/*Sometimes joins can generate NULL values, depending on whether we choose to 
use an INNER JOIN or any of the OUTER JOINS . Let’s dive into to 
understand how this happens.*/

SELECT flight.flight_id,
       route.flight_number,
       aircraft.ac_subtype
FROM ba_flights flight
FULL OUTER JOIN ba_flight_routes route
    ON flight.flight_number = route.flight_number
FULL OUTER JOIN ba_aircraft aircraft
    ON flight.flight_id = aircraft.flight_id;

/*
How can you quickly identify whether two join keys between two tables have any misalignments?
Answer:
You can write a query using a FULL JOIN and include both join keys in your SELECT statement. 
In this way, you can easily see which values have and do not have a match between the tables.
*/


SELECT 
			flight.flight_id,
			aircraft.flight_id,	
      route.flight_number,
      aircraft.ac_subtype
FROM ba_flights flight
FULL OUTER JOIN ba_flight_routes route
    ON flight.flight_number = route.flight_number
FULL OUTER JOIN ba_aircraft aircraft
    ON flight.flight_id = aircraft.flight_id
    