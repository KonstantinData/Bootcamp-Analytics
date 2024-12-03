USE SQLTutorial;
GO

-- Partition by

SELECT 
	first_name,
	last_name,
	gender,
	salary,
	COUNT(gender) OVER(PARTITION BY gender) AS count_gender --Like GROUP BY but it provides more details
FROM employee_demographics AS demo
JOIN employee_salary AS sal
ON demo.employee_id = sal.employee_id

-- This query makes no sense! It only shows the difference compared to PARTITION BY.
SELECT 
	first_name,
	last_name,
	gender,
	salary,
	COUNT(gender)
FROM employee_demographics AS demo
JOIN employee_salary AS sal
ON demo.employee_id = sal.employee_id
GROUP BY first_name, last_name,	gender, salary

-- This provides the same information as PARTITION BY but with fewer details
SELECT 
	gender,
	COUNT(gender)
FROM employee_demographics AS demo
JOIN employee_salary AS sal
ON demo.employee_id = sal.employee_id
GROUP BY gender