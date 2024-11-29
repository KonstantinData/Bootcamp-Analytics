/*
Question: Can you SELECT the flight number, baggage weight, total passengers, and distance flown? 
Shorten the column headers from “baggage_weight” to “weight” and distance_flown to “distance”.

show flight_number,
show gaggage_weight AS "weight",
show total_passenhers,
show distance_flown AS "distance"

FROM ba_flights_excerpt
*/

SELECT
	flight_number,
	baggage_weight AS "weight",
	total_passengers,
	distance_flown AS "distance"
FROM ba_flights_excerpt
