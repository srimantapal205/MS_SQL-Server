USE CommonPracticDB;
GO

-- Table: customers
CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    customer_name NVARCHAR(30) NOT NULL,
    join_date DATE NOT NULL
);

-- Table: online_orders
CREATE TABLE online_orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    order_date DATE NOT NULL,
    amount REAL NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Table: store_orders
CREATE TABLE store_orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    order_date DATE NOT NULL,
    amount REAL NOT NULL,
    store_id TEXT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Insert data into customers table
INSERT INTO customers (customer_id, customer_name, join_date) VALUES
(1, 'Alice', '2023-04-10'),
(2, 'Bob', '2023-05-01'),
(3, 'Charlie', '2023-06-15');

-- Insert data into online_orders table
INSERT INTO online_orders (order_id, customer_id, order_date, amount) VALUES
(201, 1, '2024-01-05', 120.50),
(202, 2, '2024-01-06', 89.99);

-- Insert data into store_orders table
INSERT INTO store_orders (order_id, customer_id, order_date, amount, store_id) VALUES
(1001, 1, '2024-01-03', 150.00, 'S1'),
(1002, 3, '2024-01-07', 220.00, 'S2');

SELECT * FROM online_orders;
SELECT * FROM store_orders;
SELECT * FROM customers;


--DROP TABLE online_orders;
--DROP TABLE store_orders;
--DROP TABLE customers;

/*
Write a SQL query using a Common Table Expression (CTE)						
Combine online and store orders into a single dataset using UNION. Add a column channel with values 'online' or 'store' to distinguish the source.
For each customer: 						
Calculate the total amount spent.
Determine the first and most recent purchase date.						
Compute the running total of amount spent ordered by order date using a window function.						
Filter the result to include only customers whose total amount spent > 300.	
Convert the order date to 'YYYY-MM' format and format the amount to 2 decimal places.						
Return: customer_id, customer_name, channel, order_month, order_amount, running_total, first_order_date, last_order_date.
*/

WITH CombineOrderTable AS (
	SELECT order_id, customer_id, order_date, amount, 'online' AS channel FROM online_orders 
		UNION ALL 
	SELECT order_id, customer_id, order_date, amount, 'store' AS channel FROM store_orders 
)
--SELECT * FROM CombineOrderTable
--SELECT c.customer_id, c.customer_name, SUM(o.amount)  AS total_spent  FROM customers c INNER JOIN CombineOrderTable o ON c.customer_id = o.customer_id GROUP BY  c.customer_id, c.customer_name;
 


