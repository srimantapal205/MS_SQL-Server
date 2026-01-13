/*
Pivot rows into columns (Dynamic vs Fixed Pivot)
Problem Statement:
    Given data in row format, convert it into column format (pivoting).
    If dynamic pivot is not supported by the database, simulate it using fixed values.

*/

USE [DaysSqlPractice_30];
GO

CREATE TABLE salesTable2 (
    order_date VARCHAR(7),   -- YYYY-MM
    product    VARCHAR(50),
    amount     INT
);

INSERT INTO salesTable2 (order_date, product, amount) VALUES
('2024-01', 'Laptop', 1000),
('2024-01', 'Mobile', 800),
('2024-02', 'Laptop', 1200),
('2024-02', 'Mobile', 900),
('2024-02', 'Tablet', 500);


SELECT * FROM salesTable2;

SELECT * FROM salesTable2 PIVOT(
    SUM(amount)
    FOR product IN ([Laptop], [Mobile], [Tablet])
) P;
