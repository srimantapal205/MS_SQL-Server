/*
Find Average Order Value (AOV) per month and product category

Given an orders table (and optionally a products table), calculate the average order value permonth for each product category.
AOV = Total Order Amount / Number of Orders
🔹

*/

USE [DaysSqlPractice_30];
GO

CREATE TABLE orders_with_product (
    order_id     INT PRIMARY KEY,
    order_date   DATE,
    product_id   VARCHAR(10),
    order_amount INT
);

INSERT INTO orders_with_product (order_id, order_date, product_id, order_amount) VALUES
(1, '2024-01-05', 'P1', 500),
(2, '2024-01-15', 'P2', 800),
(3, '2024-01-20', 'P1', 700),
(4, '2024-02-02', 'P1', 600),
(5, '2024-02-18', 'P2', 1000);

CREATE TABLE productsListItem (
    product_id VARCHAR(10) PRIMARY KEY,
    category   VARCHAR(50)
);
INSERT INTO productsListItem (product_id, category) VALUES
('P1', 'Electronics'),
('P2', 'Fashion');


SELECT 
    MONTH(o.order_date) AS months,
    p.category,
    AVG(o.order_amount) AS avarage_amount
FROM 
    orders_with_product AS o
JOIN 
    productsListItem AS p
ON
    o.product_id = p.product_id
GROUP BY
    MONTH(o.order_date), p.category
ORDER BY
    months, category;
