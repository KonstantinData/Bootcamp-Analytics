-- Find the total sales across all orders
-- Find the total sales for each product
-- Additionally provide details such order id, order date.

USE SalesDB;


SELECT
	OrderID,
	OrderDate,
	ProductId,
	Sales,
	SUM(Sales) OVER() TotalSales, 
	SUM(Sales) OVER(PARTITION BY ProductID) TotalSalesProduct
	FROM Sales.Orders;