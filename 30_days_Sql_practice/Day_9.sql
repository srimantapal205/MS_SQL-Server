/*
Find the difference between current row's sales and previous row'ssales (per product)

Problem Statement: Given a sales table, calculate the difference between the current row's sales and the previousrow's sales, partitioned by product and ordered by date.

*/
USE [DaysSqlPractice_30];
GO

CREATE TABLE Product_sales_table (
    sale_date     DATE,
    product_id    VARCHAR(10),
    sales_amount  INT
);

INSERT INTO Product_sales_table (sale_date, product_id, sales_amount) VALUES
('2024-01-01', 'P1', 100),
('2024-01-02', 'P1', 150),
('2024-01-03', 'P1', 120),
('2024-01-01', 'P2', 200),
('2024-01-02', 'P2', 250);

SELECT * FROM  Product_sales_table;

SELECT 
     product_id,
     sale_date, 
     sales_amount,
     sales_amount - LAG(sales_amount) OVER(PARTITION BY product_id ORDER BY sale_date) AS dif_amount
FROM 
    Product_sales_table;
    