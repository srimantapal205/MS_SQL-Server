USE MarketPlace_v2;
Go

SELECT * FROM Product;
SELECT * FROM Customer;
SELECT * FROM Purchases;
SELECT * FROM Transactions;

---------------------------------------------------
SELECT
	*
FROM 
	dbo.Product AS pr
INNER JOIN 
	dbo.Purchases AS pu
ON
	pr.ProductID = pu.ProductID
INNER JOIN
	dbo.Customer AS cu
ON
	pu.CustomerID= cu.CustomerID;
------------------------------------------------------

SELECT
	pr.ProductID AS Product_Id,
	pr.ProductName AS Product_Name,
	pr.Price AS Unit_Price,
	COUNT(pu.PurchaseID) AS Count_of_Purchase_Product,
	(pr.Price * COUNT(pu.PurchaseID)) AS Total_Sales_Amount_PerProduct
FROM 
	dbo.Product AS pr
INNER JOIN 
	dbo.Purchases AS pu
ON
	pr.ProductID = pu.ProductID
INNER JOIN
	dbo.Customer AS cu
ON
	pu.CustomerID= cu.CustomerID 
GROUP BY pr.ProductID, pr.ProductName,pr.Price;

------------------------Get Daly Sales Amount------------------------------------

SELECT 
	pu.PurchaseDate,
	SUM(pr.Price) OVER(PARTITION BY pu.PurchaseDate) AS Daly_Sales_Amount
FROM 
	dbo.Product AS pr
INNER JOIN 
	dbo.Purchases AS pu
ON
	pr.ProductID = pu.ProductID
ORDER BY Daly_Sales_Amount DESC
;
------------------------Get Monthly Sales Amount BY Product------------------------------------
WITH MonthLySales AS (
	SELECT
		pr.ProductID,
		YEAR(pu.PurchaseDate) AS Sales_Year,
		MONTH(pu.PurchaseDate) AS Sales_month,
		SUM(pr.Price) AS Monthly_Sales
	FROM 
		dbo.Product AS pr
	INNER JOIN 
		dbo.Purchases AS pu
	ON
		pr.ProductID = pu.ProductID
	GROUP BY 
		pr.ProductID,
		YEAR(pu.PurchaseDate), 
		MONTH(pu.PurchaseDate)	
)
SELECT
	ProductID,
	Sales_Year,
	Sales_month,
	Monthly_Sales,
	SUM(Monthly_Sales) OVER (
		PARTITION BY 
			ProductID
		ORDER BY 
			Sales_Year,
			Sales_month
		ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
	) AS Running_Monthly_Sales
 
FROM 
	MonthLySales;
