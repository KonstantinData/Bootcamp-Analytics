--What flight routes are being operated by Boeing?
--Include the departure city, arrival city, and total number of flights ID

--Desired output -> summarized table grouped by departure/arrival, aggregated numbers of flights

--Tables needed -> ba_aircraft, ba_flight_routes, ba_flights

--Columns needed -> manufacturer, departure_city, arrival_city, flight_id

--Functions needed -> count flight isd

--Filters needed -> manufacturer = Boing

SELECT
		route.departure_city,
    route.arrival_city,
    COUNT(fly.flight_number) AS number_flights
FROM ba_flights AS fly

JOIN ba_aircraft AS air
ON fly.flight_id = air.flight_id
LEFT JOIN ba_flight_routes AS route
ON fly.flight_number = route.flight_number

GROUP BY 	route.departure_city,
    			route.arrival_city;








