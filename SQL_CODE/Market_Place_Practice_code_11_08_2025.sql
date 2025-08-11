USE MARKETPLACEDB
GO


SELECT * FROM [Sales].[Customer]

SELECT * FROM [Sales].[Product]

SELECT * FROM [Sales].[Transactions]

AlTER TABLE [Sales].[Product] ADD Default_Price INT;

UPDATE [Sales].[Product] SET Default_Price = 30 WHERE Default_Price IS NULL;


WITH Rank_Price_Table AS (
    SELECT 
        ProductId, 
        Price AS New_Price, 
        ROW_NUMBER() OVER (PARTITION BY ProductId ORDER BY CreateDate) rn_num 
    FROM Product
)
SELECT 
    p.ProductId,  
    CASE
        WHEN rp.New_Price IS NULL THEN 40
        ELSE rp.New_Price
    END AS New_Price_2
FROM (
    SELECT DISTINCT ProductId 
    FROM Product
) p
LEFT JOIN Rank_Price_Table rp 
    ON p.ProductId = rp.ProductId 
    AND rp.rn_num = 1 
ORDER BY p.ProductId;

	
SELECT * FROM Rank_Price_Table;