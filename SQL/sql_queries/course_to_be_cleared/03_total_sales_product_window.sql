-- Find the total sales for each product,
-- additionally provide detail such order id & order date

USE SalesDB

SELECT 
	OrderDate,
	OrderID,
	ProductID,
	SUM(Sales) OVER(PARTITION BY ProductID) TotalSalesByProducts
FROM Sales.Orders





