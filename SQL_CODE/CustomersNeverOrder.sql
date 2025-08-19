USE [sql_exercise]
GO

-- Drop tables if they already exist
IF OBJECT_ID('OrdersTable', 'U') IS NOT NULL DROP TABLE OrdersTable;
IF OBJECT_ID('CustomersTable', 'U') IS NOT NULL DROP TABLE CustomersTable;
GO

-- Create Customers table
CREATE TABLE CustomersTable (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Create Orders table
CREATE TABLE OrdersTable (
    id INT PRIMARY KEY,
    customerId INT NOT NULL,
    CONSTRAINT FK_Customer FOREIGN KEY (customerId) REFERENCES CustomersTable(id)
);

-- Insert Customers
INSERT INTO CustomersTable (id, name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'David'),
(5, 'Eve'),
(6, 'Frank');   -- <-- Frank never orders

-- Insert Orders
INSERT INTO OrdersTable (id, customerId) VALUES
(101, 1),   -- Alice placed an order
(102, 2),   -- Bob placed an order
(103, 2),   -- Bob placed another order
(104, 4),   -- David placed an order
(105, 5);   -- Eve placed an order
-- Charlie (id=3) and Frank (id=6) have no orders
SELECT name AS Customers FROM CustomersTable LEFT JOIN OrdersTable ON CustomersTable.id = OrdersTable.customerId  WHERE OrdersTable.id IS NULL;

WITH customerOrderTableCombine AS(
	SELECT c.id AS CustId, c.name AS CustomerName, o.id AS Ooder_Id, o.customerId FROM CustomersTable c LEFT JOIN OrdersTable o ON c.id = o.customerId
)
--SELECT * FROM customerOrderTableCombine
SELECT CustId, CustomerName FROM customerOrderTableCombine WHERE Ooder_Id IS NULL;

