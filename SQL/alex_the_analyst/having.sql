SELECT jobtitel, COUNT(jobtitel) AS count_jobtitel
FROM employee_salary
GROUP BY jobtitel
HAVING COUNT(jobtitel) >= 2


SELECT jobtitel, AVG(salary) AS avg_salary
FROM employee_salary
GROUP BY jobtitel
HAVING AVG(salary) >= 40000
ORDER BY avg_salary DESC
