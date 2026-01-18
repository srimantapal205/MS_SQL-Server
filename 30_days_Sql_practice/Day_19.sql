/*
Find customers who bought ALL products in a category
Problem Statement: 
List customers who have purchased every product belonging to a given category (e.g., category_id = 10 ).
This tests whether you understand "for all" logic in SQL.
*/


USE [DaysSqlPractice_30];
GO

CREATE TABLE products_9_table (
    product_id   INT PRIMARY KEY,
    product_name VARCHAR(50),
    category_id  INT
);

INSERT INTO products_9_table (product_id, product_name, category_id) VALUES
(101, 'Laptop',   10),
(102, 'Mouse',    10),
(103, 'Keyboard', 10),
(201, 'Phone',    20);


CREATE TABLE sales_9_table (
    sale_id     INT PRIMARY KEY,
    customer_id VARCHAR(10),
    product_id  INT,
    FOREIGN KEY (product_id) REFERENCES products_9_table(product_id)
);


INSERT INTO sales_9_table (sale_id, customer_id, product_id) VALUES
(1, 'C1', 101),
(2, 'C1', 102),
(3, 'C1', 103),
(4, 'C2', 101),
(5, 'C2', 102),
(6, 'C3', 101),
(7, 'C3', 103);


SELECT * FROM products_9_table;
SELECT * FROM sales_9_table;

SELECT customer_id FROM sales_9_table 
GROUP BY customer_id 
HAVING COUNT(DISTINCT product_id) = (
    SELECT COUNT(DISTINCT product_id) 
    FROM products_9_table WHERE category_id = 10
)