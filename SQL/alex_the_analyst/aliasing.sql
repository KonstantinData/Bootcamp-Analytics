USE SQLTutorial;
GO

SELECT first_name + ' ' + last_name AS "Full Name"
FROM employee_demographics

SELECT avg(age) AS avg_age
FROM employee_demographics


SELECT demo.gender, AVG(age) AS avg_age
FROM employee_demographics AS demo
GROUP BY demo.gender

SELECT*
FROM employee_salary AS sal
FULL OUTER JOIN (SELECT*
FROM employee_demographics AS demo
UNION ALL
SELECT *
FROM warehouse_employee_demographics AS ware) AS all_employee
ON all_employee.employee_id = sal.employee_id





