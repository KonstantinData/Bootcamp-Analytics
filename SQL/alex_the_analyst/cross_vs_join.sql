SELECT *
FROM employee_demographics AS ed
CROSS JOIN employee_salary AS es

SELECT*
FROM employee_demographics AS ed
INNER JOIN employee_salary AS es
ON ed.employee_id = es.employee_id