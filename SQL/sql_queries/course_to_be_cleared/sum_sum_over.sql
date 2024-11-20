USE SalesDB;


SELECT
	OrderID,
	OrderDate,
	ProductId,
	OrderStatus,
	Sales,
	SUM(Sales) OVER() TotalSales, 
	SUM(Sales) OVER(PARTITION BY ProductID, OrderStatus) "Partition by"
	FROM Sales.Orders;