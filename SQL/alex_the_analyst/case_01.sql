SELECT first_name, last_name, age,
	CASE
		WHEN age > 30 THEN 'Old'
		ELSE 'Young'
	END
FROM employee_demographics
WHERE age IS NOT NULL
ORDER BY age

SELECT first_name, last_name, age,
	CASE
		WHEN age > 32 THEN 'Old'
		WHEN age BETWEEN 29 AND 32 THEN 'Midage'
		ELSE 'Young'
	END
FROM employee_demographics
WHERE age IS NOT NULL
ORDER BY age
