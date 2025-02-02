USE MARKETPLACEDB
GO

SELECT * FROM sys.tables;

SELECT * FROM Sales.Customer;
SELECT * FROM Sales.Product;
SELECT * FROM Sales.Transactions;

-- Get multiple category item  in single query
SELECT Category AS Product_Category, COUNT(*) AS Product_Count  FROM Sales.Product WHERE Category IN ('Electronics', 'Furniture') GROUP BY Category;


