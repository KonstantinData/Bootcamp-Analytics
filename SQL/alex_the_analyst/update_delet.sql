USE SQLTutorial;
GO

SELECT*
FROM employee_demographics;
GO

UPDATE employee_demographics 
SET employee_id = 1012
WHERE first_name = 'Holly' AND last_name = 'Flax';
GO

UPDATE employee_demographics 
SET age = 22, gender = 'Female'
WHERE employee_id = 1012;
GO

SELECT* -- Before deleting, always use a SELECT statement first to see which data will be affected
FROM employee_demographics
WHERE employee_id = 1013
GO

DELETE -- Replace SELECT* with DELETE if the query matches the data to be deleted
FROM employee_demographics
WHERE employee_id = 1013
GO

SELECT*
FROM employee_demographics;
GO
