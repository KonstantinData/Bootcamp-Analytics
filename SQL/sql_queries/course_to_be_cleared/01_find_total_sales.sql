-- Find the total Sales Across all orders

USE SalesDB;

SELECT
SUM(Sales) TotalSales
FROM sales.Orders