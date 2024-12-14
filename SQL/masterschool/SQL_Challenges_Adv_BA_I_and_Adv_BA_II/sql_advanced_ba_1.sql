/*
Question #1: 
Create a list of flights, showing the flight ID, departure city, arrival city, manufacturer, 
and aircraft sub-type that will be used for each flight.

Show the results for all flights that are available even if not all information is available 
for all flights.
*/

-- List: flight ID, departure city, arrival city, manufacturer, aircraft subtype 
-- ba_flights, ba_flight_routes, ba_aircraft
-- flight_id, manufacturer, departure_city, arrival_city, ac_subtype

SELECT
		flights.flight_id,
    routes.departure_city,
    routes.arrival_city,
    aircraft.manufacturer,
    aircraft.ac_subtype
    FROM ba_flights AS flights
FULL OUTER JOIN ba_aircraft AS aircraft ON flights.flight_id = aircraft.flight_id
FULL OUTER JOIN ba_flight_routes AS routes ON flights.flight_number = routes.flight_number
ORDER BY flights.flight_id;

/*Question #2: 
What is the maximum number of passengers that have been on every available aircraft 
(manufacturer and sub-type) for flights that have been completed?

If the manufacturer and sub-type are not available for flights, we do not need to 
show the results of these flights.*/

-- TABLE: max_passengers, manufacturer, subtype
-- ba_flights, ba_aircraft
-- manufacturer, ac_subtype, total_passengers
-- MAX
-- WHERE flights completed AND manufaturer/ac_subtype IS NOT NULL

SELECT
    aircraft.manufacturer,
    aircraft.ac_subtype,
    MAX(flights.total_passengers) AS max_passengers
FROM ba_flights AS flights
LEFT JOIN ba_aircraft AS aircraft ON flights.flight_id = aircraft.flight_id
WHERE aircraft.manufacturer IS NOT NULL AND aircraft.ac_subtype IS NOT NULL
GROUP BY 	aircraft.manufacturer,
    			aircraft.ac_subtype;
          
 /*
Question #3: 
Since only some aircraft are capable of flying long distances overseas, we want 
to filter out the planes that only do shorter distances.

What aircraft (manufacturer and sub-type) have completed flights of a distance of 
more than 7,000 km? 

If the manufacturer and sub-type are not available for flights, we do not need to 
show the results of these flights.
 */
-- List: manufacturer, ac_subtype 
-- ba_flight_routes, ba_aircraft
-- airline, distance_flown, manufacturer, ac_subtype, 
-- WHERE distance_flown > 7000 -> "km" to be checked <-
-- WHERE manufacturer, ac_subtype IS NOT NULL

SELECT DISTINCT
		aircraft.manufacturer, 
    aircraft.ac_subtype 
FROM ba_flight_routes AS routes 
JOIN ba_flights AS flights ON routes.flight_number = flights.flight_number 
JOIN ba_aircraft AS aircraft ON flights.flight_id = aircraft.flight_id 
WHERE routes.distance_flown > 7000 
		AND flights.status <> 'Cancelled' 
		AND aircraft.manufacturer IS NOT NULL 
    AND aircraft.ac_subtype IS NOT NULL
ORDER BY aircraft.manufacturer, aircraft.ac_subtype;

/*
Focus: The combination of manufacturer and ac_subtype:
Since the same combination may occur across multiple flights, you need to ensure 
that each combination is displayed only once.
*/

/*
Question #4: 
What is the most used aircraft (manufacturer and sub-type) for flights departing 
from London and arriving in Basel, Trondheim, or Glasgow? 

Include the number of flights that the aircraft was used for.

If the manufacturer and sub-type are not available for flights, we do not need to 
show the results of these flights.
*/

-- Table: manufacturer, subtype , num_flights
-- departure_city, arrival_city, manufacturer, ac_subtype, flight_id, status 
-- WHERE departure_city = 'LONDON' AN arrival_city IN (Basel, Trondheim, Glasgow)
-- DISTINCT / NOT NULL / <> 'Cancelled' / JOIN

-- Step 1 shows me the DISTINCT manufacturers so I can ensure there are no special entries
SELECT DISTINCT manufacturer
FROM ba_aircraft

-- Step 2 ensures that the two flight_id columns do not contain any differing values.
SELECT
flight_id
FROM ba_aircraft
EXCEPT
SELECT
flight_id
FROM ba_flights


SELECT
flight_id
EXCEPT
SELECT
flight_id
FROM ba_aircraftFROM ba_flights

-- Step 3 ensures that there are no blanks, NULL values, or special characters that might not be visible


WITH clean_manufacturer AS (
    SELECT
        manufacturer,
        ac_subtype,
        flight_id  -- flight_id aus ba_aircraft hinzufügen
    FROM public.ba_aircraft
    WHERE manufacturer IS NOT NULL
      AND TRIM(manufacturer) <> ''
      AND manufacturer !~ '[^a-zA-Z0-9]'
)
-- Step 4 generates the actuel result
SELECT
    clm.manufacturer,
    COUNT(DISTINCT clm.ac_subtype) AS subtype,  -- Anzahl der ac_subtype-Einträge
    COUNT(DISTINCT clm.flight_id) AS num_flights       -- Anzahl der Flüge

FROM clean_manufacturer AS clm
INNER JOIN ba_flights AS fli 
    ON fli.flight_id = clm.flight_id          -- Join auf flight_id
INNER JOIN ba_flight_routes AS routes 
		ON fli.flight_number = routes.flight_number

WHERE fli.status <> 'Cancelled'								-- Nur nicht stornierte Flüge
AND routes.departure_city = 'London'
AND routes.arrival_city IN ('Basel','Trondheim','Glasgow')
GROUP BY clm.manufacturer
ORDER BY num_flights DESC
LIMIT 1;                   -- Sortie

/*Question #5: 
For the flight routes highlighted in question 4 combined, would there have been an aircraft that, on 
average, would use less fuel on the flight routes? 

The fuel used in liters per flight can be calculated by multiplying the fuel efficiency metric by distance, 
baggage weight, and number of passengers. 

What aircraft (manufacturer and sub-type) would you recommend to use for each of these flight routes 
if you use the average fuel consumption as your guiding metric?

If the manufacturer and sub-type are not available for flights, we do not need to show the results of these flights.*/

-- aircraft_which has in avg the least fuel consumption, subtype
-- ba_aircraft, ba_flight_routes, ba_fuel_efficiency, ba_flights
-- ac_subtyp, manufacturer, departure_city,  arrival_city, distance_flown, status, total_passengers, baggage_weight, fuel_efficiency  
-- fuel_efficency_metric x distance, baggage weight, number of passengers 
-- WHERE departure_city = 'LONDON' AN arrival_city IN (Basel, Trondheim, Glasgow)

-- A comparison of manufacturers reveals that we need to use 'ba_aircraft' as the source 
-- because 'ba_fuel_efficiency' contains manufacturers that are not aircraft-related.
SELECT manufacturer
FROM ba_aircraft
EXCEPT
SELECT manufacturer
FROM ba_fuel_efficiency;

SELECT manufacturer
FROM ba_fuel_efficiency
EXCEPT
SELECT manufacturer
FROM ba_aircraft;


SELECT
		air.manufacturer,
    air.ac_subtype,
    fuel.fuel_efficiency,
    arrival_city
FROM ba_flights AS fli
LEFT JOIN ba_flight_routes AS rout ON fli.flight_number = rout.flight_number
LEFT JOIN ba_aircraft AS air ON fli.flight_id = air.flight_id
LEFT JOIN ba_fuel_efficiency AS fuel ON air.ac_subtype = fuel.ac_subtype
WHERE fli.status <> 'Cancelled'								-- Nur nicht stornierte Flüge
AND rout.departure_city = 'London'
AND rout.arrival_city IN ('Basel','Trondheim','Glasgow')
AND air.manufacturer IS NOT NULL
AND air.ac_subtype IS NOT NULL
ORDER BY rout.arrival_city

