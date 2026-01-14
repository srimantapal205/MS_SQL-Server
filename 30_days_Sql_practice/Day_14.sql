/*
	Rank sales people by monthly sales (rank resets every month)
	Problem Statement:
		Given a sales table, calculate monthly total sales per salesperson and rank them within each month, withranks resetting every month.
*/
USE [DaysSqlPractice_30];
GO

CREATE TABLE salesTable4 (
    sale_id        INT PRIMARY KEY,
    salesperson_id VARCHAR(10),
    sale_date      DATE,
    amount         INT
);

INSERT INTO salesTable4 (sale_id, salesperson_id, sale_date, amount) VALUES
(1, 'S1', '2024-01-05', 500),
(2, 'S2', '2024-01-10', 800),
(3, 'S1', '2024-01-20', 700),
(4, 'S3', '2024-01-25', 600),
(5, 'S1', '2024-02-03', 400),
(6, 'S2', '2024-02-15', 1000),
(7, 'S3', '2024-02-20', 1000);


SELECT 
   salesperson_id,
   sale_month,
   total_sales,
   RANK() OVER(
    PARTITION BY sale_month ORDER BY total_sales DESC
   ) AS monthly_rank
FROM(
    SELECT 
        salesperson_id,
        MONTH(sale_date) AS sale_month,
        SUM(amount) AS total_sales
    FROM salesTable4
    GROUP BY salesperson_id,  MONTH(sale_date)   
)monthly_sales;
