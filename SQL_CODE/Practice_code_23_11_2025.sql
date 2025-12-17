

-- Create Database and Tables
Create Database SalesDB;
Go

USE SalesDB;
GO

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL
);  
CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    region VARCHAR(255),
    sale_amount DECIMAL(10, 2),
    sale_date DATE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
-- Insert Sample Data
INSERT INTO Products (product_id, product_name) VALUES
(1, 'Product A'),
(2, 'Product B'),
(3, 'Product C'),
(4, 'Product D');   
INSERT INTO Sales (sale_id, product_id, region, sale_amount, sale_date) VALUES
(1, 1, 'North', 100.00, '2025-05-01'),
(2, 1, 'North', 150.00, '2025-06-15'),
(3, 2, 'North', 200.00, '2025-07-20'),
(4, 3, 'South', 300.00, '2025-08-10'),
(5, 2, 'South', 250.00, '2025-09-05'),
(6, 4, 'East', 400.00, '2025-04-25'),
(7, 3, 'East', 350.00, '2025-06-30'),
(8, 1, 'West', 500.00, '2025-07-15'),
(9, 4, 'West', 450.00, '2025-08-20'),
(10, 2, 'West', 300.00, '2025-09-10'),
(11, 3, 'North', 150.00, '2025-10-01'),
(12, 4, 'South', 200.00, '2025-10-05');

SELECT * FROM Sales;

-- 1️ Top 3 products by total sales per region in the last 6 months (handle ties)
WITH getlast6monthSales AS(
    SELECT 
        product_id, 
        region,
        SUM(sale_amount) AS total_sales
    FROM Sales
    WHERE sale_date >= DATEADD(MONTH, -6, GETDATE())
    GROUP BY region, product_id
),
rankedSales AS (
    SELECT
        product_id,
        region,
        total_sales,
        DENSE_RANK() OVER(
            PARTITION BY region ORDER BY total_sales DESC
        ) AS rnk
    FROM 
        getlast6monthSales
)
SELECT product_id, region, total_sales FROM rankedSales WHERE rnk <= 3;

-- 2️ Orders where shipping took longer than the month’s average
-- Create Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    ship_date DATE
);
-- Insert Sample Data into Orders Table
INSERT INTO Orders (order_id, order_date, ship_date) VALUES
(1, '2025-05-01', '2025-05-10'),
(2, '2025-06-15', '2025-06-20'),
(3, '2025-07-20', '2025-07-30'),
(4, '2025-08-10', '2025-08-25'),
(5, '2025-09-05', '2025-09-15'),
(6, '2025-04-25', '2025-05-05'),
(7, '2025-06-30', '2025-07-10'),
(8, '2025-07-15', '2025-07-22'),
(9, '2025-08-20', '2025-09-01'),
(10, '2025-09-10', '2025-09-20');

SELECT * FROM Orders;

/*
Compute shipping duration per order

Compute average duration per month

Compare each order’s duration with the monthly average

*/

WITH order_durations AS(
    SELECT 
        order_id, 
        YEAR (order_date) AS order_year,
        MONTH (order_date) AS order_month,
        DATEDIFF(DAY, order_date, ship_date) AS ship_days
    FROM 
        Orders
),
monthAvarage AS(
    SELECT
        order_year,
        order_month,
        AVG(ship_days) AS avg_ship_days
    FROM
        order_durations
    GROUP BY order_year, order_month        
)
SELECT  
    o.order_id,
    o.ship_days,
    m.avg_ship_days
FROM 
    order_durations o
JOIN
    monthAvarage m
ON
    o.order_year = m.order_year
AND
    o.order_month = m.order_month
WHERE
    o.ship_days > m.avg_ship_days;

-- 3️ Recursive query: list all subordinates for a given manager
-- Create Employees Table
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(255) NOT NULL,
    manager_id INT,
    FOREIGN KEY (manager_id) REFERENCES Employees(employee_id)
);  
-- Insert Sample Data into Employees Table
INSERT INTO Employees (employee_id, employee_name, manager_id) VALUES
(1, 'Alice', NULL),
(2, 'Bob', 1),
(3, 'Charlie', 1),
(4, 'David', 2),
(5, 'Eve', 2),
(6, 'Frank', 3),
(7, 'Grace', 3),
(8, 'Heidi', 4);

SELECT * FROM Employees;

WITH RECURSIVE subordinatesList AS(
    SELECT 
        emp_id,
        emp_name,
        manager_id,
        0 AS Level
    FROM Employees
    WHERE manager_id IS NULL
    UNION ALL
    -- recursion : indirect reports
    SELECT 
        e.emp_id,
        e.emp_name,
        e.manager_id
    FROM  
        Employees e
    INNER JOIN 
        subordinatesList s
    ON 
       e.manager_id = e.emp_id
)
SELECT * FROM subordinatesList;



