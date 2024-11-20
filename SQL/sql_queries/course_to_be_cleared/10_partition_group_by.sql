-- Rank Customers based on ther total sales

USE SalesDB;


SELECT
	CustomerID,
	SUM(Sales) TotalSales,
	RANK() OVER(ORDER BY SUM(Sales) Desc) RankCustomers
FROM Sales.Orders
GROUP BY CustomerID;