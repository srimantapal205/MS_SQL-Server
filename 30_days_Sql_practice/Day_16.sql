/*
Month-over-Month (MoM) % change in sales per product
Problem Statement: For each product, calculate the percentage change in monthly sales compared to the previousmonth.
*/

USE [DaysSqlPractice_30];
GO

CREATE TABLE sales_5 (
    sale_id    INT PRIMARY KEY,
    product_id VARCHAR(10),
    sale_date  DATE,
    amount     INT
);

INSERT INTO sales_5 (sale_id, product_id, sale_date, amount) VALUES
(1, 'P1', '2024-01-05', 100),
(2, 'P1', '2024-01-20', 200),
(3, 'P1', '2024-02-10', 150),
(4, 'P1', '2024-02-18', 250),
(5, 'P1', '2024-03-05', 300),
(6, 'P2', '2024-01-12', 500),
(7, 'P2', '2024-02-10', 750),
(8, 'P1', '2024-01-06', 400);

CREATE TABLE MonthlyAggregationTable (
    product_id  VARCHAR(10),
    sale_month  VARCHAR(7),   -- YYYY-MM
    total_sales INT
);

INSERT INTO MonthlyAggregationTable (product_id, sale_month, total_sales)
SELECT
    product_id,
    FORMAT(sale_date, 'yyyy-MM') AS sale_month,
    SUM(amount) AS total_sales
FROM sales_5
GROUP BY
    product_id,
    FORMAT(sale_date, 'yyyy-MM');

SELECT * FROM sales_5;
SELECT * FROM MonthlyAggregationTable;

WITH monthly_sales AS (
    SELECT
        product_id,
        MONTH(sale_date) AS sale_month,
        SUM(amount) AS total_sales
    FROM sales_5
    GROUP BY
        product_id,
        MONTH(sale_date)
)
SELECT
    product_id,
    sale_month,
    total_sales,
    (total_sales - LAG(total_sales) OVER (
        PARTITION BY product_id
        ORDER BY sale_month
    )) * 100.0
    /
    LAG(total_sales) OVER (
        PARTITION BY product_id
        ORDER BY sale_month
    ) AS pct_change
FROM monthly_sales
ORDER BY product_id, sale_month;

