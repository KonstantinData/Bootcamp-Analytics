
SELECT * 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'employee_demographics';

-- Überprüfe die Spalten in warehouse_employee_demographics
SELECT * 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'warehouse_employee_demographics';

-- Überprüfe die Spalten in employee_salary
SELECT * 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'employee_salary';

