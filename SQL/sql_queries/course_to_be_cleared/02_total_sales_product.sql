-- Find the total Sales for each product

USE SalesDB

SELECT 
	ProductID,
	SUM(Sales) TotalSales
FROM Sales.Orders
GROUP BY ProductID
