--CREATE DATABASE ComplexQueryPracticeDB;

USE ComplexQueryPracticeDB
GO

-- Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    join_date DATE
);

INSERT INTO customers VALUES
(1, 'Alice', 'New York', 'NY', '2022-01-10'),
(2, 'Bob', 'Los Angeles', 'CA', '2022-02-15'),
(3, 'Charlie', 'Chicago', 'IL', '2022-03-05'),
(4, 'David', 'Houston', 'TX', '2022-04-20'),
(5, 'Eva', 'Phoenix', 'AZ', '2022-05-25');

-- Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO orders VALUES
(101, 1, '2022-06-01', 250.00),
(102, 1, '2022-06-15', 450.00),
(103, 2, '2022-07-01', 300.00),
(104, 3, '2022-07-20', 700.00),
(105, 4, '2022-08-01', 150.00),
(106, 5, '2022-08-15', 900.00);

-- Order_Items Table
CREATE TABLE order_items (
    item_id INT PRIMARY KEY,
    order_id INT,
    product_name VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO order_items VALUES
(1, 101, 'Laptop', 1, 250.00),
(2, 102, 'Phone', 2, 225.00),
(3, 103, 'Tablet', 1, 300.00),
(4, 104, 'TV', 1, 700.00),
(5, 105, 'Headphones', 3, 50.00),
(6, 106, 'Camera', 2, 450.00);

-- Employees Table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    manager_id INT NULL
);

INSERT INTO employees VALUES
(1, 'John', 'HR', 60000, NULL),
(2, 'Sara', 'IT', 80000, 1),
(3, 'Mike', 'Finance', 75000, 1),
(4, 'Anna', 'IT', 90000, 2),
(5, 'Tom', 'Finance', 70000, 3);

SELECT * FROM dbo.customers;
SELECT * FROM dbo.employees;
SELECT * FROM dbo.order_items;
SELECT * FROM dbo.orders;

-- 1. Find the total revenue per customer.
SELECT c.name AS CustomerName, SUM(o.total_amount) AS total_spent  FROM dbo.customers c JOIN dbo.orders o ON c.customer_id = o.customer_id GROUP BY c.name;

-- 2. Find the top 2 customers by spending.
SELECT TOP 2 c.name AS CustomerName, SUM(o.total_amount) AS total_spent FROM customers c JOIN orders o on c.customer_id = o.customer_id GROUP BY c.name ORDER BY total_spent DESC;


