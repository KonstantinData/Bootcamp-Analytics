/*
Question #1: 
Select all the flight IDs for flights that have 0 total passengers, or that flew 0 distance

flight_id
WHERE total_passengers = 0 OR distance_flown = 0
FROM ba_flights_excerpt
*/

SELECT flight_id
FROM ba_flights_excerpt
WHERE total_passengers = '0' OR distance_flown = '0'
;

/*
Question #2: 
Select the unique arrival cities that British Airways is flying to when departing from London

DISTINCT arrival_city
WHERE airline = British Airways
AND departure_city = London
*/

SELECT DISTINCT arrival_city
FROM ba_flights_excerpt
WHERE airline = 'BA' AND departure_city = 'London';

/*
Question #3: 
Select the flight numbers, flight date, and departure city for flights that fly to Madrid, Lisbon, Port of Spain, or Tel Aviv

flight numbers, 
flight date, 
departure city

arrival_city = Madrid, Lisbon, Port of Spain OR Tel Aviv
*/

SELECT
	flight_number, 
	actual_flight_date, 
	departure_city
FROM ba_flights_excerpt
WHERE arrival_city IN ('Madrid', 'Lisbon', 'Port of Spain', 'Tel Aviv');


/*
Question #4: 
Select the flight number and departure city for flights that meet two conditions: 
- the flight status is scheduled
- the flights generated £0 revenue for baggage or had 0 passengers

flight_number
departure_city
flight_status = scheduled AND
revenue_from_baggage = 0 or total_passengers = 0
*/

SELECT
		flight_number,
    departure_city,
    status
FROM ba_flights_excerpt
WHERE (status = 'scheduled' AND revenue_from_baggage = '0')
			OR total_passengers = '0'; 
    
    

