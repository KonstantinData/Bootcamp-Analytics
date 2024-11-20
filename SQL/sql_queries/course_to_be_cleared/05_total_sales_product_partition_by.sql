-- Find the total sales for each product
-- Additionally provide details such order id, order date.

USE SalesDB;

SELECT
	OrderID,
	OrderDate,
	ProductId,
	SUM(Sales) OVER(PARTITION BY ProductID) TotalSales
	FROM Sales.Orders;