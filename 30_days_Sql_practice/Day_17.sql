/*
Find missing dates (gaps) in customer purchase sequences

Problem Statement:
For each customer, identify missing purchase dates in their transaction history.
If a customer purchased on Jan 1 and next on Jan 4, then Jan 2 & Jan 3 are missing days.

*/

USE [DaysSqlPractice_30];
GO

CREATE TABLE sales_7 (
    sale_id       INT PRIMARY KEY,
    customer_id   VARCHAR(10),
    purchase_date DATE
);

INSERT INTO sales_7 (sale_id, customer_id, purchase_date) VALUES
(1, 'C1', '2024-01-01'),
(2, 'C1', '2024-01-02'),
(3, 'C1', '2024-01-05'),
(4, 'C2', '2024-02-01'),
(5, 'C2', '2024-02-04');

WITH dates AS (
    SELECT 
        customer_id,
        purchase_date,
        LAG(purchase_date) OVER (
            PARTITION BY customer_id
            ORDER BY purchase_date
        ) AS prev_date
    FROM sales_7
)
SELECT
    customer_id,
    DATEADD(DAY, 1, prev_date) AS missing_date
FROM dates
WHERE purchase_date > DATEADD(DAY, 1, prev_date);
