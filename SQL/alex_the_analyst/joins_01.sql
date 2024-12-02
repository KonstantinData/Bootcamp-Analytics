
SELECT*
FROM employee_demographics AS ed
INNER JOIN employee_salary AS es
ON ed.employee_id = es.employee_id

SELECT*
FROM employee_demographics AS ed
FULL OUTER JOIN employee_salary AS es
ON ed.employee_id = es.employee_id

SELECT*
FROM employee_demographics AS ed
LEFT OUTER JOIN employee_salary AS es
ON ed.employee_id = es.employee_id

SELECT*
FROM employee_demographics AS ed
RIGHT OUTER JOIN employee_salary AS es
ON ed.employee_id = es.employee_id
