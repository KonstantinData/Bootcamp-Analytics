-- Find the total sales across all orders
-- Find the total sales for each product
-- Find the total sales for each combination of product and order status
-- Additionally provide details such order id, order date.

USE SalesDB;

SELECT
	OrderID,
	OrderDate,
	ProductId,
	Sales,
	SUM(Sales) OVER() TotalSales, 
	SUM(Sales) OVER(PARTITION BY ProductID) TotalSalesProduct,
	SUM(Sales) OVER(PARTITION BY ProductID, OrderStatus) "Sales by Order Status"
FROM Sales.Orders;
