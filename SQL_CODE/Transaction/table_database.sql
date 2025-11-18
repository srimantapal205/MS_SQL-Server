-- Create a new database
CREATE DATABASE RetailPaymentDB;
GO

USE RetailPaymentDB;
GO

--- Table: Customers
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    CreatedDate DATE
);
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, CreatedDate) VALUES
(1, 'Amit', 'Sharma', 'amit.sharma@example.com', '9876543210', '2024-01-12'),
(2, 'Priya', 'Verma', 'priya.verma@example.com', '9876501234', '2024-02-01'),
(3, 'Rohit', 'Singh', 'rohit.singh@example.com', '7549023456', '2024-02-18'),
(4, 'Sneha', 'Patil', 'sneha.patil@example.com', '8901234500', '2024-03-05'),
(5, 'Karan', 'Saxena', 'karan.saxena@example.com', '9012345678', '2024-03-14'),
(6, 'Fatima', 'Khan', 'fatima.khan@example.com', '7801234567', '2024-03-20'),
(7, 'Vikram', 'Joshi', 'vikram.joshi@example.com', '9902348765', '2024-04-02'),
(8, 'Anita', 'Mehta', 'anita.mehta@example.com', '7689012345', '2024-04-08'),
(9, 'Ravi', 'Yadav', 'ravi.yadav@example.com', '9801456789', '2024-04-15'),
(10, 'Sunita', 'Ghosh', 'sunita.ghosh@example.com', '9609876543', '2024-04-21'),
(11, 'Arjun', 'Nair', 'arjun.nair@example.com', '7890654321', '2024-05-02'),
(12, 'Meera', 'Shetty', 'meera.shetty@example.com', '9765432180', '2024-05-09'),
(13, 'Yash', 'Kapoor', 'yash.kapoor@example.com', '7654321890', '2024-05-18'),
(14, 'Reema', 'Chopra', 'reema.chopra@example.com', '8451236789', '2024-06-01'),
(15, 'Abhay', 'Thakur', 'abhay.thakur@example.com', '9543126800', '2024-06-15'),
(16, 'Tara', 'Menon', 'tara.menon@example.com', '9987456123', '2024-07-01'),
(17, 'Sanjay', 'Das', 'sanjay.das@example.com', '9876543000', '2024-07-10'),
(18, 'Kriti', 'Rawat', 'kriti.rawat@example.com', '9098765432', '2024-07-21'),
(19, 'Harsh', 'Gupta', 'harsh.gupta@example.com', '7800456123', '2024-08-05'),
(20, 'Divya', 'Jain', 'divya.jain@example.com', '8945123678', '2024-08-20');


-- Table: Orders

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATETIME,
    ShippedDate DATETIME,
    TotalAmount DECIMAL(10,2),
    Status VARCHAR(20),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders (OrderID, CustomerID, OrderDate, ShippedDate, TotalAmount, Status) VALUES
(101, 1, '2024-01-15 10:34', '2024-01-18', 12000, 'Shipped'),
(102, 3, '2024-02-05 14:20', '2024-02-07', 22000, 'Shipped'),
(103, 5, '2024-02-15 09:45', '2024-02-17', 8000, 'Delivered'),
(104, 2, '2024-03-01 11:50', '2024-03-04', 18000, 'Delivered'),
(105, 4, '2024-03-12 16:10', '2024-03-16', 9500, 'Shipped'),
(106, 1, '2024-03-20 12:00', '2024-03-23', 4500, 'Delivered'),
(107, 7, '2024-04-01 08:25', '2024-04-03', 31000, 'Shipped'),
(108, 6, '2024-04-09 10:45', '2024-04-12', 2200, 'Delivered'),
(109, 8, '2024-04-14 17:00', '2024-04-16', 15600, 'Shipped'),
(110, 9, '2024-04-21 09:30', '2024-04-24', 7600, 'Delivered'),
(111, 10, '2024-05-03 11:10', '2024-05-06', 9800, 'Delivered'),
(112, 12, '2024-05-10 13:40', '2024-05-13', 12500, 'Delivered'),
(113, 13, '2024-05-19 15:10', '2024-05-21', 34000, 'Shipped'),
(114, 14, '2024-06-02 08:30', '2024-06-06', 23000, 'Delivered'),
(115, 15, '2024-06-17 18:45', '2024-06-19', 4200, 'Delivered'),
(116, 16, '2024-07-03 12:20', '2024-07-06', 15000, 'Shipped'),
(117, 17, '2024-07-11 14:00', '2024-07-14', 21500, 'Delivered'),
(118, 18, '2024-07-22 09:10', '2024-07-25', 1800, 'Delivered'),
(119, 19, '2024-08-10 16:05', '2024-08-13', 8500, 'Shipped'),
(120, 20, '2024-08-22 10:50', '2024-08-24', 26000, 'Delivered');


--Table: Payments

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    OrderID INT,
    PaymentDate DATETIME,
    PaymentMethod VARCHAR(20),
    Amount DECIMAL(10,2),
    Status VARCHAR(20),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO Payments (PaymentID, OrderID, PaymentDate, PaymentMethod, Amount, Status) VALUES
(5001, 101, '2024-01-15 10:40', 'UPI', 12000, 'Success'),
(5002, 102, '2024-02-05 14:25', 'CreditCard', 22000, 'Success'),
(5003, 103, '2024-02-15 09:47', 'Cash', 8000, 'Success'),
(5004, 104, '2024-03-01 11:55', 'NetBanking', 18000, 'Success'),
(5005, 105, '2024-03-12 16:12', 'CreditCard', 9500, 'Success'),
(5006, 106, '2024-03-20 12:02', 'UPI', 4500, 'Success'),
(5007, 107, '2024-04-01 08:30', 'DebitCard', 31000, 'Success'),
(5008, 108, '2024-04-09 10:50', 'Cash', 2200, 'Success'),
(5009, 109, '2024-04-14 17:02', 'UPI', 15600, 'Success'),
(5010, 110, '2024-04-21 09:35', 'NetBanking', 7600, 'Success'),
(5011, 111, '2024-05-03 11:12', 'UPI', 9800, 'Success'),
(5012, 112, '2024-05-10 13:43', 'CreditCard', 12500, 'Success'),
(5013, 113, '2024-05-19 15:12', 'DebitCard', 34000, 'Success'),
(5014, 114, '2024-06-02 08:35', 'UPI', 23000, 'Success'),
(5015, 115, '2024-06-17 18:47', 'Cash', 4200, 'Success'),
(5016, 116, '2024-07-03 12:23', 'CreditCard', 15000, 'Success'),
(5017, 117, '2024-07-11 14:05', 'NetBanking', 21500, 'Success'),
(5018, 118, '2024-07-22 09:15', 'UPI', 1800, 'Success'),
(5019, 119, '2024-08-10 16:07', 'Cash', 8500, 'Success'),
(5020, 120, '2024-08-22 10:55', 'CreditCard', 26000, 'Success');


-- Table: OrderItems
CREATE TABLE OrderItems (
    ItemID INT PRIMARY KEY,
    OrderID INT,
    ProductName VARCHAR(100),
    Quantity INT,
    Price DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO OrderItems (ItemID, OrderID, ProductName, Quantity, Price) VALUES
(1, 101, 'Laptop Bag', 1, 12000),
(2, 102, 'Smartphone', 1, 22000),
(3, 103, 'Keyboard', 2, 4000),
(4, 104, 'Office Chair', 1, 18000),
(5, 105, 'Bluetooth Speaker', 1, 9500),
(6, 106, 'Notebook', 3, 1500),
(7, 107, 'LED Monitor', 1, 31000),
(8, 108, 'USB Cable', 2, 1100),
(9, 109, 'Router', 1, 15600),
(10, 110, 'Headphones', 1, 7600),
(11, 111, 'Keyboard', 1, 9800),
(12, 112, 'Mouse', 2, 6250),
(13, 113, 'Smartwatch', 1, 34000),
(14, 114, 'Hard Disk', 2, 11500),
(15, 115, 'Phone Case', 5, 840),
(16, 116, 'Tablet', 1, 15000),
(17, 117, 'SSD', 1, 21500),
(18, 118, 'Pen Drive', 3, 600),
(19, 119, 'Backpack', 1, 8500),
(20, 120, 'Printer', 1, 26000);

SELECT * FROM Customers;
SELECT * FROM Orders;
SELECT * FROM Payments;
SELECT * FROM OrderItems;

