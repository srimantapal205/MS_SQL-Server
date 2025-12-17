USE DataEngineerPracticeDB;
GO
SELECT * FROM [dbo].[Products]

SELECT * FROM [dbo].[Sales]

SELECT * FROM [dbo].[Orders]

-- 19. Retrieve top 3 products by category
SELECT * FROM (
	SELECT
		ProductID, 

	FROM Sales
)