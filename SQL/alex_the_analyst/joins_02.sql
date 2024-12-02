SELECT ed.employee_id, ed.last_name, es.jobtitel, es.salary
FROM employee_demographics AS ed
JOIN employee_salary AS es
ON es.employee_id = ed.employee_id
WHERE ed.last_name <> 'Martin'
ORDER BY es.salary Desc

SELECT es.jobtitel, AVG(es.salary)
FROM employee_demographics AS ed
JOIN employee_salary AS es
ON es.employee_id = ed.employee_id
WHERE jobtitel = 'Salesman'
GROUP BY jobtitel



