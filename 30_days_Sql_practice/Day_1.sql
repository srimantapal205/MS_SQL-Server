CREATE DATABASE DaysSqlPractice_30;
GO

USE DaysSqlPractice_30;
GO

CREATE TABLE orders (
    order_id     INT PRIMARY KEY,
    customer_id  INT,
    order_date   DATE,
    amount       INT
);



 INSERT INTO orders (order_id, customer_id, order_date, amount) VALUES
(101, 1, '2024-01-01', 500),
(102, 1, '2024-01-10', 700),
(103, 1, '2024-02-01', 300),
(104, 1, '2024-02-10', 900),
(105, 1, '2024-03-01', 400),
(106, 1, '2024-03-15', 600),
(201, 2, '2024-02-01', 800),
(202, 2, '2024-02-05', 200),
(203, 2, '2024-02-10', 500);

SELECT * FROM orders;


-- Problem Statement: Given an orders table, retrieve the most recent 5 orders for each customer.

SELECT 
    customer_id, 
    max(order_date)
FROM orders
GROUP BY customer_id;


SELECT * FROM(
    SELECT o.*,
    ROW_NUMBER() OVER(
        PARTITION BY customer_id ORDER BY order_date DESC
    ) AS rn
    FROM orders o
) sub
WHERE rn <=5