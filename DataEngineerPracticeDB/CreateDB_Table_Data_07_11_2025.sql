-- Create Database
CREATE DATABASE DataEngineerPracticeDB;
GO

--
USE DataEngineerPracticeDB;
GO



----Create Table----------

-- Table 1: Departments
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY IDENTITY(1,1),
    DepartmentName NVARCHAR(100)
);

--Table 2: Employees
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    EmpName NVARCHAR(100),
    Email NVARCHAR(100),
    Salary DECIMAL(10,2),
    JoiningDate DATE,
    DepartmentID INT FOREIGN KEY REFERENCES Departments(DepartmentID),
    ManagerID INT NULL
);

--Table 3: Customers
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    CustomerName NVARCHAR(100),
    Region NVARCHAR(50),
    Email NVARCHAR(100)
);

--Table 4: Products
CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName NVARCHAR(100),
    CategoryID INT,
    Price DECIMAL(10,2)
);

--Table 5: Orders
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    OrderDate DATE,
    ShippedDate DATE,
    TotalAmount DECIMAL(10,2)
);

--Table 6: Sales
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    SalesAmount DECIMAL(10,2),
    Quantity INT,
    Region NVARCHAR(50)
);

--Table 7: Attendance
CREATE TABLE Attendance (
    EmpID INT FOREIGN KEY REFERENCES Employees(EmployeeID),
    AttendanceDate DATE
);

--Table 8: Transactions
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY IDENTITY(1,1),
    AccountID INT,
    TransactionDate DATE,
    Amount DECIMAL(10,2)
);

--Table 9: ProductPriceHistory
CREATE TABLE ProductPriceHistory (
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    Price DECIMAL(10,2),
    EffectiveDate DATE
);


-- Table 10: Bookings
CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY IDENTITY(1,1),
    RoomID INT,
    StartDate DATE,
    EndDate DATE
);

-- Table 11: EmployeeHistory
CREATE TABLE EmployeeHistory (
    EmpID INT,
    DepartmentID INT,
    ChangeDate DATE
);

-- Table 12: ETL_AuditLog
CREATE TABLE ETL_AuditLog (
    AuditID INT PRIMARY KEY IDENTITY(1,1),
    LastLoadDate DATETIME
);

-- Table 13: DimCustomer
CREATE TABLE DimCustomer (
    CustomerKey INT PRIMARY KEY,
    CustomerName NVARCHAR(100),
    StartDate DATE,
    EndDate DATE,
    IsCurrent BIT
);


-- Departments
INSERT INTO Departments (DepartmentName)
VALUES 
('HR'), ('Finance'), ('IT'), ('Marketing'), ('Operations');

-- Employees
INSERT INTO Employees (EmpName, Email, Salary, JoiningDate, DepartmentID, ManagerID)
VALUES
('Amit Sharma', 'amit@corp.com', 70000, '2019-04-10', 3, NULL),
('Priya Das', 'priya@corp.com', 50000, '2021-06-12', 1, 1),
('Ravi Kumar', 'ravi@corp.com', 55000, '2020-08-01', 2, 1),
('Neha Verma', 'neha@corp.com', 80000, '2018-01-20', 3, NULL),
('Karan Mehta', 'karan@corp.com', 40000, '2022-09-15', 4, 2),
('Anjali Roy', 'anjali@corp.com', 60000, '2023-03-10', 5, 3);

-- Customers
INSERT INTO Customers (CustomerName, Region, Email)
VALUES
('John Doe', 'North', 'john@xyz.com'),
('Mary Jane', 'South', 'mary@xyz.com'),
('Peter Parker', 'East', 'peter@xyz.com'),
('Tony Stark', 'West', 'tony@xyz.com'),
('Natasha Romanoff', 'North', 'natasha@xyz.com');

-- Products
INSERT INTO Products (ProductName, CategoryID, Price)
VALUES
('Laptop', 1, 90000),
('Mouse', 1, 800),
('Keyboard', 1, 1200),
('Mobile', 2, 25000),
('Tablet', 2, 30000),
('Charger', 3, 700);

-- Orders
INSERT INTO Orders (CustomerID, OrderDate, ShippedDate, TotalAmount)
VALUES
(1, '2024-01-10', '2024-01-15', 90000),
(2, '2024-02-12', '2024-02-18', 25000),
(3, '2024-03-01', '2024-03-05', 30800),
(4, '2024-04-10', '2024-04-25', 60000),
(5, '2024-05-20', '2024-05-28', 45000);


INSERT INTO Orders (CustomerID, OrderDate, ShippedDate, TotalAmount)
VALUES
(1, '2024-06-05', '2024-06-10', 78000),
(2, '2024-07-11', '2024-07-14', 52000),
(3, '2024-08-03', '2024-08-09', 15000),
(4, '2024-09-22', '2024-09-30', 67000),
(5, '2024-10-10', '2024-10-18', 35000),

(1, '2024-11-01', '2024-11-06', 92000),
(2, '2024-12-15', '2024-12-20', 43000),
(3, '2024-01-25', '2024-01-30', 28000),
(4, '2024-02-07', '2024-02-12', 54000),
(5, '2024-03-18', '2024-03-25', 39000),

(1, '2024-04-05', '2024-04-12', 81000),
(2, '2024-05-16', '2024-05-20', 27000),
(3, '2024-06-22', '2024-06-27', 36000),
(4, '2024-07-09', '2024-07-14', 72000),
(5, '2024-08-28', '2024-09-02', 51000),

(1, '2024-09-13', '2024-09-19', 88000),
(2, '2024-10-17', '2024-10-23', 33000),
(3, '2024-11-21', '2024-11-27', 29500),
(4, '2024-12-02', '2024-12-07', 64000),
(5, '2024-12-28', '2025-01-03', 72000);


-- Sales
INSERT INTO Sales (OrderID, ProductID, SalesAmount, Quantity, Region)
VALUES
(1, 1, 90000, 1, 'North'),
(2, 4, 25000, 1, 'South'),
(3, 3, 2400, 2, 'East'),
(3, 2, 1600, 2, 'East'),
(4, 5, 60000, 2, 'West'),
(5, 6, 45000, 3, 'North');

-- Attendance
INSERT INTO Attendance (EmpID, AttendanceDate)
VALUES
(1, '2024-10-01'), (1, '2024-10-02'), (1, '2024-10-03'),
(2, '2024-10-02'), (2, '2024-10-04'),
(3, '2024-10-01'), (3, '2024-10-02'), (3, '2024-10-03');

-- Transactions
INSERT INTO Transactions (AccountID, TransactionDate, Amount)
VALUES
(1, '2024-01-01', 5000),
(1, '2024-01-03', -1000),
(1, '2024-01-05', 2000),
(2, '2024-02-01', 10000),
(2, '2024-02-10', -3000);

-- ProductPriceHistory
INSERT INTO ProductPriceHistory (ProductID, Price, EffectiveDate)
VALUES
(1, 85000, '2023-01-01'),
(1, 90000, '2024-01-01'),
(2, 700, '2023-06-01'),
(2, 800, '2024-03-01');

-- Bookings
INSERT INTO Bookings (RoomID, StartDate, EndDate)
VALUES
(101, '2024-01-01', '2024-01-05'),
(101, '2024-01-04', '2024-01-07'),
(102, '2024-02-01', '2024-02-03');

-- EmployeeHistory
INSERT INTO EmployeeHistory (EmpID, DepartmentID, ChangeDate)
VALUES
(1, 3, '2020-01-01'),
(1, 2, '2023-01-01'),
(2, 1, '2021-01-01');

-- ETL_AuditLog
INSERT INTO ETL_AuditLog (LastLoadDate)
VALUES ('2024-05-01');

-- DimCustomer
INSERT INTO DimCustomer (CustomerKey, CustomerName, StartDate, EndDate, IsCurrent)
VALUES
(1, 'John Doe', '2023-01-01', NULL, 1),
(2, 'Mary Jane', '2023-01-01', NULL, 1);

CREATE TABLE MuseumVisits (
    ExhibitID INT,
    ExhibitName VARCHAR(100),
    VisitorID INT,
    VisitDate DATE
);

INSERT INTO MuseumVisits VALUES
(1, 'Dinosaur Fossils',   101, '2024-01-05'),
(1, 'Dinosaur Fossils',   102, '2024-02-10'),
(1, 'Dinosaur Fossils',   103, '2024-04-15'),
(2, 'Ancient Egypt',      104, '2024-03-12'),
(2, 'Ancient Egypt',      105, '2024-04-20'),
(2, 'Ancient Egypt',      106, '2024-05-11'),
(3, 'Space Exploration',  107, '2024-04-01'),
(3, 'Space Exploration',  108, '2024-04-05'),
(4, 'Modern Art Gallery', 109, '2023-12-25'),
(4, 'Modern Art Gallery', 110, '2024-04-10'),
(5, 'Marine Life',        111, '2024-04-12'),
(5, 'Marine Life',        112, '2024-04-14'),
(5, 'Marine Life',        113, '2024-06-02');


INSERT INTO MuseumVisits (ExhibitID, ExhibitName, VisitorID, VisitDate) VALUES
(1, 'Dinosaur Fossils', 101, '2025-01-05'),
(1, 'Dinosaur Fossils', 102, '2025-01-10'),
(1, 'Dinosaur Fossils', 103, '2025-03-15'),

(2, 'Ancient Egypt', 201, '2025-01-12'),
(2, 'Ancient Egypt', 202, '2025-02-20'),

(3, 'Modern Art',    301, '2025-01-18'),

(4, 'Space Exhibit', 401, '2024-12-25'),  -- previous quarter
(4, 'Space Exhibit', 402, '2024-12-28'),

(5, 'Marine Life',   501, '2025-02-05'),
(5, 'Marine Life',   502, '2025-02-06'),
(5, 'Marine Life',   503, '2025-02-10');

INSERT INTO MuseumVisits (ExhibitID, ExhibitName, VisitorID, VisitDate) VALUES
-- Q1 (Jan–Mar)
(1, 'Dinosaur Fossils', 101, '2025-01-05'),
(1, 'Dinosaur Fossils', 102, '2025-02-12'),
(2, 'Ancient Egypt',    201, '2025-03-10'),
(3, 'Modern Art',       301, '2025-03-15'),

-- Q2 (Apr–Jun)
(1, 'Dinosaur Fossils', 103, '2025-04-10'),
(2, 'Ancient Egypt',    202, '2025-04-15'),
(2, 'Ancient Egypt',    203, '2025-05-20'),
(4, 'Space Exhibit',    401, '2025-06-25'),

-- Q3 (Jul–Sep)
(1, 'Dinosaur Fossils', 104, '2025-08-05'),
(5, 'Marine Life',      501, '2025-08-15'),
(5, 'Marine Life',      502, '2025-09-05'),

-- Q4 (Oct–Dec) → This is “last quarter” if today is early 2025
(1, 'Dinosaur Fossils', 105, '2024-10-10'),
(2, 'Ancient Egypt',    204, '2024-11-20'),
(5, 'Marine Life',      503, '2024-12-02'),
(3, 'Modern Art',       302, '2024-12-12');

