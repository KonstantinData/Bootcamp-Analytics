/*
Question #1: 
What is the total number of unique flight IDs, total unique ac subtype and 
average fuel efficiency used to operate all flights of British Airways?

Combine the tables together with two left joins.
*/

--Desired output -> aggregate of 3 metrics; flight_id, ac_subtype, fuel_efficiency   

--Tables needed -> ba_aircraft, ba_flights, ba_fuel_effenciency

--Columns needed -> fuel.fuel_efficiency, flight.flight_id, air.ac_subtype join flight_id, ac_subtype

--Functions needed -> count, average

--Filters needed ->

SELECT
		COUNT(DISTINCT flight.flight_id) AS count_flight_id,
    COUNT(DISTINCT air.ac_subtype) AS count_ac_subtype,
    AVG(fuel.fuel_efficiency) AS avg_fuel_efficiency
FROM ba_flights AS flight
LEFT JOIN ba_aircraft AS air
ON flight.flight_id = air.flight_id
LEFT JOIN ba_fuel_efficiency AS fuel
ON air.ac_subtype = fuel.ac_subtype
GROUP BY flight.airline

--Output: count_flight_id = 1012 | count_ac_subtype = 9 | avg_fuel = 0.1992187....

/*
Question #2: 
For this exercise, you can reuse the answer of question 1. 

Update the join types used in question 1 to two INNER JOINs. What do 
you see happening? Did anything changed in the query result?
*/

SELECT
		COUNT(DISTINCT flight.flight_id) AS count_flight_id,
    COUNT(DISTINCT air.ac_subtype) AS count_ac_subtype,
    AVG(fuel.fuel_efficiency) AS avg_fuel_efficiency
FROM ba_flights AS flight
INNER JOIN ba_aircraft AS air
ON flight.flight_id = air.flight_id
INNER JOIN ba_fuel_efficiency AS fuel
ON air.ac_subtype = fuel.ac_subtype
GROUP BY flight.airline

-- The count of flight_id has decreases to 835

-- Testing
SELECT
		flight.flight_id,
    air.flight_id,
    air.ac_subtype,
    fuel.ac_subtype
FROM ba_flights AS flight
LEFT JOIN ba_aircraft AS air ON flight.flight_id = air.flight_id
LEFT JOIN ba_fuel_efficiency AS fuel ON air.ac_subtype = fuel.ac_subtype
WHERE air.ac_subtype IS NULL



/*
Question #3: 
Create a list of flight IDs that currently don’t have a manufacturer and ac subtype assigned.
*/

--Desired output -> table of flights with manufacturer an ac_subtype

--Tables needed -> ba_aircraft, ba_flights

--Columns needed -> flight_id, manufacturer, ac_subtype

--Functions needed -> x

--Filters needed -> WHERE 

SELECT 
		flights.flight_id,
    air.manufacturer,
    air.ac_subtype
FROM ba_flights AS flights
LEFT JOIN ba_aircraft AS air ON flights.flight_id = air.flight_id
WHERE air.manufacturer IS NULL AND air.ac_subtype IS NULL;

/* (i)
Based on the answer to question 3, you can understand how our rows are removed 
when using INNER JOINs. It is caused by non-matching join keys between the flight_id 
from ba_flights and the flight_id from ba_aircraft.
*/


/*
Question #4: 
How many unique flight dates did each aircraft (manufacturer and ac subtype) operate on? Make 
sure to also include the aircraft that did not operate on flights at all.

*/

--Desired output -> Table with flight dates, manufacturer an subtype

--Tables needed -> ba_fuel_efficiency, ba_flights, ba_aircraft

--Columns needed -> actual_flight_dates, manufacturer, ac_subtype

--Functions needed -> count DISTINCT

--Filters needed ->

/*
"First, we need to determine which table to start with. After reviewing the tables, it becomes 
clear that the ba_fuel_efficiency table contains the most complete dataset for this query.
Important: The SELECT statement must therefore reference this table."

1. A **table or list** refers to a simple SELECT query that retrieves raw data without any aggregation.  
2. A **pivot table** involves aggregation and grouping of data, summarizing it using functions like `COUNT`, `SUM`, or `AVG`.

*/

SELECT
		fuel.manufacturer,
		fuel.ac_subtype,
		COUNT(DISTINCT flights.actual_flight_date) AS operation_days
    
FROM ba_fuel_efficiency AS fuel
LEFT JOIN ba_aircraft AS air ON fuel.ac_subtype = air.ac_subtype
LEFT JOIN ba_flights AS flights ON air.flight_id = flights.flight_id
GROUP BY 	fuel.manufacturer,
					fuel.ac_subtype;
          
/*
Question #5: 
Let’s try to find the second way how we could resolve this problem. Attempt to solve this 
exercises by using one FULL JOIN.

How many unique flight dates did each aircraft (manufacturer and ac subtype) operate on? 
Make sure to also include the aircraft that did not operate on flights at all.
*/

SELECT
		fuel.manufacturer,
		fuel.ac_subtype,
		COUNT(DISTINCT flights.actual_flight_date) AS operation_days
    
FROM ba_flights AS flights
INNER JOIN ba_aircraft AS air ON flights.flight_id = air.flight_id
FULL JOIN ba_fuel_efficiency AS fuel ON air.ac_subtype = fuel.ac_subtype

GROUP BY 	fuel.manufacturer,
					fuel.ac_subtype;