SELECT ed.employee_id AS id, ed.last_name AS last_name, es.jobtitel AS jobtitel, es.salary AS salary,
	CASE
		WHEN jobtitel = 'Salesman' THEN salary + (salary * 0.3)
		WHEN jobtitel = 'Receptionist' THEN salary + (salary * 0.2)
		WHEN jobtitel = 'Regional Manager' THEN salary - (salary *0.2)
		ELSE salary + (salary *0.1)
	END AS new_salary
FROM employee_demographics AS ed
JOIN employee_salary AS es
ON ed.employee_id = es.employee_id


SELECT 
    jobtitel, 
    AVG(new_salary) AS avg_salary
FROM (
    SELECT 
        es.jobtitel AS jobtitel,
        CASE
            WHEN es.jobtitel = 'Salesman' THEN es.salary + (es.salary * 0.3)
            WHEN es.jobtitel = 'Receptionist' THEN es.salary + (es.salary * 0.2)
            WHEN es.jobtitel = 'Regional Manager' THEN es.salary - (es.salary * 0.2)
            ELSE es.salary + (es.salary * 0.1)
        END AS new_salary
    FROM 
        employee_demographics AS ed
    JOIN 
        employee_salary AS es
    ON 
        ed.employee_id = es.employee_id
) AS calculated_salaries
GROUP BY jobtitel;

WITH calculated_salaries AS (
    SELECT 
        es.jobtitel AS jobtitel,
        es.salary AS salary,
        CASE
            WHEN es.jobtitel = 'Salesman' THEN es.salary + (es.salary * 0.3)
            WHEN es.jobtitel = 'Receptionist' THEN es.salary + (es.salary * 0.2)
            WHEN es.jobtitel = 'Regional Manager' THEN es.salary - (es.salary * 0.2)
            ELSE es.salary + (es.salary * 0.1)
        END AS new_salary
    FROM employee_salary AS es
)
SELECT 
    jobtitel, 
    AVG(new_salary) AS avg_salary
FROM calculated_salaries
GROUP BY jobtitel;