-- Find the total sales across all orders
-- Additionally provide details such order id, order date.

USE SalesDB;

SELECT
	OrderID,
	OrderDate,
	SUM(Sales) OVER() TotalSales
	FROM Sales.Orders;