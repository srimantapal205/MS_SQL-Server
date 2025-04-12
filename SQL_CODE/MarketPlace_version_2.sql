CREATE DATABASE MarketPlace_v2;
GO

USE MarketPlace_v2
GO

-- Create Customer table
CREATE TABLE Customer (
    CustomerID INT,
    CustomerName VARCHAR(100),
    Email VARCHAR(100)
);

-- Insert duplicate data into Customer
INSERT INTO Customer (CustomerID, CustomerName, Email)
VALUES 
(1, 'Alice Smith', 'alice@example.com'),
(2, 'Bob Johnson', 'bob@example.com'),
(3, 'Charlie Brown', 'charlie@example.com'),
(1, 'Alice Smith', 'alice@example.com'),  -- duplicate
(4, 'Diana Prince', 'diana@example.com'),
(5, 'Ethan Hunt', 'ethan@example.com'),
(2, 'Bob Johnson', 'bob@example.com'),   -- duplicate
(6, 'Fiona Glenanne', 'fiona@example.com'),
(7, 'George Orwell', 'george@example.com'),
(3, 'Charlie Brown', 'charlie@example.com'); -- duplicate

-- Create Product table
CREATE TABLE Product (
    ProductID INT,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2)
);

-- Insert duplicate data into Product
INSERT INTO Product (ProductID, ProductName, Price)
VALUES 
(101, 'Laptop', 999.99),
(102, 'Phone', 599.99),
(103, 'Tablet', 399.99),
(104, 'Monitor', 199.99),
(105, 'Keyboard', 49.99),
(101, 'Laptop', 999.99),     -- duplicate
(106, 'Mouse', 29.99),
(102, 'Phone', 599.99),      -- duplicate
(107, 'Webcam', 89.99),
(103, 'Tablet', 399.99);     -- duplicate

-- Create Purchases table
CREATE TABLE Purchases (
    PurchaseID INT,
    CustomerID INT,
    ProductID INT,
    PurchaseDate DATE
);

-- Insert duplicate data into Purchases
INSERT INTO Purchases (PurchaseID, CustomerID, ProductID, PurchaseDate)
VALUES 
(1001, 1, 101, '2024-01-15'),
(1002, 2, 102, '2024-01-20'),
(1003, 3, 103, '2024-02-01'),
(1004, 4, 104, '2024-02-10'),
(1005, 5, 105, '2024-02-15'),
(1001, 1, 101, '2024-01-15'), -- duplicate
(1006, 6, 106, '2024-03-01'),
(1007, 7, 107, '2024-03-05'),
(1002, 2, 102, '2024-01-20'), -- duplicate
(1003, 3, 103, '2024-02-01'); -- duplicate

-- Create Transactions table
CREATE TABLE Transactions (
    TransactionID INT,
    PurchaseID INT,
    Amount DECIMAL(10, 2),
    PaymentMethod VARCHAR(50)
);

-- Insert duplicate data into Transactions
INSERT INTO Transactions (TransactionID, PurchaseID, Amount, PaymentMethod)
VALUES 
(2001, 1001, 999.99, 'Credit Card'),
(2002, 1002, 599.99, 'PayPal'),
(2003, 1003, 399.99, 'Credit Card'),
(2004, 1004, 199.99, 'Debit Card'),
(2005, 1005, 49.99, 'Cash'),
(2001, 1001, 999.99, 'Credit Card'), -- duplicate
(2006, 1006, 29.99, 'Credit Card'),
(2007, 1007, 89.99, 'PayPal'),
(2002, 1002, 599.99, 'PayPal'),      -- duplicate
(2003, 1003, 399.99, 'Credit Card'); -- duplicate