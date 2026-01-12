/*
Find customers who purchased more than once on the same day
Problem Statement: Given a sales table, find customers who made multiple purchases on the same calendar day.
*/

USE [DaysSqlPractice_30];
GO

CREATE TABLE salesTable (
    sale_id       INT PRIMARY KEY,
    customer_id   INT,
    purchase_date DATETIME,
    amount        INT
);

INSERT INTO salesTable (sale_id, customer_id, purchase_date, amount) VALUES
(1, 101, '2024-03-01 10:15:00', 500),
(2, 101, '2024-03-01 18:30:00', 700),
(3, 101, '2024-03-02 09:00:00', 300),
(4, 102, '2024-03-01 11:00:00', 400),
(5, 103, '2024-03-05 14:00:00', 600),
(6, 103, '2024-03-05 16:45:00', 800);

SELECT * FROM salesTable order by purchase_date;

SELECT customer_id, CAST(purchase_date AS DATE) AS purchase_date, COUNT(*) AS purchase_count FROM salesTable GROUP BY customer_id, CAST(purchase_date AS DATE) HAVING COUNT(*) > 1;