/*
Question #1: 
Select the flight number, flight date, departure city, and arrival city for flights that leave after May 1, 2023
*/


SELECT 
	flight_number,
  actual_flight_date,
  departure_city,
  arrival_city
FROM ba_flights_excerpt
WHERE actual_flight_date > '2023-05-01';

/*
Question #2: 
Select the flight IDs, number of bike bags, and baggage weight for flights that have a baggage revenue above £50,000
*/

SELECT 
	flight_id,
  bike_bags,
  baggage_weight
FROM ba_flights_excerpt
WHERE revenue_from_baggage > '50000'
GROUP BY flight_id, baggage_weight
ORDER BY flight_id;

/*
Question #3: 
Select all the columns for flights that are cancelled and either depart from or arrive at Panama City
*/


SELECT *
FROM ba_flights_excerpt
WHERE (departure_city = 'Panama City' OR
arrival_city = 'Panama City') AND status = 'Cancelled';

/*
Question #4: 
Select the flight IDs and fuel consumption for flights that either have a baggage weight 
below 3000 or less than 200 passengers on the flight
*/

SELECT flight_id, total_fuel_consumption
FROM ba_flights_excerpt
WHERE baggage_weight < '3000' OR total_passengers < '200';

/*
Question #5: 
Can you identify all columns of the flights that are scheduled to leave 
between April 15 and May 15 2023, and fly a distance less than 1000km?
*/

SELECT*
FROM ba_flights_excerpt
WHERE (actual_flight_date BETWEEN '2023-04-15' AND '2023-05-15') AND
distance_flown < '1000';

/*
Question #6: 
Can you select the unique flight numbers and arrival cities of flights that either 
have more than 0 passengers or more than 0kg baggage weight on board or that have 
flown more than 0km in distance for flights that depart from London
*/

/*
DISTINCT flight_number
DISTINCT arrival_city
WHERE total_passengers > 0 
OR baggage_weight > 0
WHERE distance_flown > 0 AND
departure_city = 'London'
*/


SELECT DISTINCT flight_number, arrival_city
FROM ba_flights_excerpt
WHERE (total_passengers > '0' OR baggage_weight > '0')
AND distance_flown > 0 AND departure_city = 'London';

/*
Question #7: 
Imagine you are looking for unique departure cities with the text “City” 
but unsure which cities include it. How do you pull the unique cities that include the text “City”?
*/

SELECT DISTINCT departure_city
FROM ba_flights_excerpt
WHERE departure_city LIKE('%City%');
