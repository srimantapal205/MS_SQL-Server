USE MARKETPLACEDB
GO

SELECT * FROM sys.tables;

SELECT * FROM Sales.Customer;
SELECT * FROM Sales.Product;
SELECT * FROM Sales.Transactions;

-- Get multiple category item  in single query
SELECT Category AS Product_Category, COUNT(*) AS Product_Count  FROM Sales.Product WHERE Category IN ('Electronics', 'Furniture') GROUP BY Category;

--------
SELECT DISTINCT * FROM Sales.Product;
SELECT DISTINCT * FROM Sales.Transactions ORDER BY Customer_ID ASC;

 SELECT * FROM Sales.Product 
	LEFT JOIN Sales.Transactions ON Transactions.Product_Id = Product.ProductId
	LEFT JOIN Sales.Customer ON Customer.CustomerId = Transactions.Customer_ID

 SELECT P.ProductName,P.Price,P.Category, (C.FristName +' '+C.LastName) AS Customer_Name FROM Sales.Product AS P
	LEFT JOIN Sales.Transactions AS T ON T.Product_Id = P.ProductId
	LEFT JOIN Sales.Customer AS C ON C.CustomerId = T.Customer_ID 

 SELECT P.ProductName,P.Price,P.Category, (C.FristName +' '+C.LastName) AS Customer_Name FROM Sales.Product AS P
	LEFT JOIN Sales.Transactions AS T ON T.Product_Id = P.ProductId
	LEFT JOIN Sales.Customer AS C ON C.CustomerId = T.Customer_ID WHERE C.CustomerId = 1 

 

-- Get Each customer Total transaction time and transction amount
SELECT  T.Customer_ID, (C.FristName +' '+C.LastName) AS Customer_Name,
	COUNT(T.TransactionId) AS Total_Transaction_Time,
	SUM(T.TotalAmount) AS Total_Transaction
FROM Sales.Transactions AS T 
LEFT JOIN Sales.Customer AS C ON T.Customer_ID = C.CustomerId
GROUP BY T.Customer_ID, C.FristName, C.LastName;

