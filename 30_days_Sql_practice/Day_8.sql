/*
Find duplicate rows based on multiple columns
Problem Statement:Given a table, identify duplicate records based on a combination of columns
*/
USE [DaysSqlPractice_30];
GO

CREATE TABLE duplicate_orders_table (
    order_id    INT PRIMARY KEY,
    customer_id INT,
    product_id  VARCHAR(10),
    order_date  DATE
);

INSERT INTO duplicate_orders_table (order_id, customer_id, product_id, order_date) VALUES
(1, 101, 'P1', '2024-01-01'),
(2, 101, 'P1', '2024-01-01'),
(3, 102, 'P2', '2024-01-05'),
(4, 103, 'P3', '2024-01-10'),
(5, 103, 'P3', '2024-01-10');

SELECT * FROM duplicate_orders_table;

SELECT customer_id, product_id, order_date, COUNT(*) as cout_item FROM duplicate_orders_table GROUP BY customer_id, product_id, order_date HAVING COUNT(*) > 1;