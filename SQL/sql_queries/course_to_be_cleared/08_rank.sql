-- Rank each order based on their sales from highest to lowest
-- Additionally provide details such order id, order date

USE SalesDB;

SELECT
	OrderID,
	OrderDate,
	Sales,
	RANK() OVER (ORDER BY Sales DESC) "Sales Ranking"
FROM SALES.Orders

