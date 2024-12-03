USE SQLTutorial;
GO

-- Stored Procedures

CREATE PROCEDURE sel_sal
AS
SELECT*
FROM employee_salary;

EXEC sel_demo;

EXEC sel_sal;

CREATE PROCEDURE calculate_bonus
    @emp_id INT, 
    @bonus DECIMAL(10, 2) OUTPUT
AS
BEGIN
    DECLARE @emp_salary DECIMAL(10, 2);

    -- Gehalt des Mitarbeiters basierend auf der ID abrufen
    SELECT @emp_salary = salary
    FROM employee_salary
    WHERE employee_id = @emp_id;

    -- Bonus berechnen (10% des Gehalts)
    SET @bonus = @emp_salary * 0.03;
END;

EXEC calculate_bonus @1001,@bonus decimal(10,2)

EXEC sel_sal

DECLARE @bonus DECIMAL(10,2);

EXEC calculate_bonus @emp_id = 1001, @bonus = @bonus OUTPUT

SELECT @bonus AS CalculatedBonus;
