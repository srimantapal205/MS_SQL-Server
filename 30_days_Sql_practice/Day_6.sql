/*
Find the second most recent order date per customer
Problem Statement Given an orders table, find the second latest order date for each customer.

*/

USE DaysSqlPractice_30;
GO

SELECT * FROM [dbo].[orders];

SELECT 
	customer_id,
	order_date
FROM (
	SELECT 
		customer_id,
		order_date,
		ROW_NUMBER() OVER(
			PARTITION BY customer_id ORDER BY order_date DESC
		) rn
	FROM orders
) sub
WHERE rn = 2;
