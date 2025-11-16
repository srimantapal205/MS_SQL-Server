-- =====================================================
-- Step 1: Create Database
-- =====================================================
CREATE DATABASE RetailManagementDB;
GO

USE RetailManagementDB;
GO

-- =====================================================
-- Step 2: Create Tables
-- =====================================================

-- 1️⃣ Customer Table
CREATE TABLE Customer (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Email NVARCHAR(100),
    Phone NVARCHAR(15),
    RegionID INT,
    CreatedDate DATE,
    IsActive BIT
);

-- 2️⃣ Region Table
CREATE TABLE Region (
    RegionID INT IDENTITY(1,1) PRIMARY KEY,
    RegionName NVARCHAR(50),
    Country NVARCHAR(50),
    State NVARCHAR(50),
    City NVARCHAR(50),
    PostalCode NVARCHAR(10),
    CreatedDate DATE,
    ManagerName NVARCHAR(50)
);

-- 3️⃣ Product_Category Table
CREATE TABLE Product_Category (
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,
    CategoryName NVARCHAR(100),
    Description NVARCHAR(255),
    IsActive BIT,
    CreatedDate DATE,
    UpdatedDate DATE,
    AddedBy NVARCHAR(50),
    ParentCategoryID INT NULL
);

-- 4️⃣ Product Table
CREATE TABLE Product (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName NVARCHAR(100),
    CategoryID INT,
    Price DECIMAL(10,2),
    StockQuantity INT,
    WarehouseID INT,
    SKU NVARCHAR(50),
    CreatedDate DATE,
    FOREIGN KEY (CategoryID) REFERENCES Product_Category(CategoryID)
);

-- 5️⃣ Product_Warehouse Table
CREATE TABLE Product_Warehouse (
    WarehouseID INT IDENTITY(1,1) PRIMARY KEY,
    WarehouseName NVARCHAR(100),
    RegionID INT,
    Capacity INT,
    Manager NVARCHAR(50),
    ContactNumber NVARCHAR(15),
    CreatedDate DATE,
    Status NVARCHAR(20)
);

-- 6️⃣ Purchase Table
CREATE TABLE Purchase (
    PurchaseID INT IDENTITY(1,1) PRIMARY KEY,
    ProductID INT,
    SupplierName NVARCHAR(100),
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    TotalAmount AS (Quantity * UnitPrice) PERSISTED,
    PurchaseDate DATE,
    WarehouseID INT,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (WarehouseID) REFERENCES Product_Warehouse(WarehouseID)
);

-- 7️⃣ Sales Table
CREATE TABLE Sales (
    SaleID INT IDENTITY(1,1) PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    TotalAmount AS (Quantity * UnitPrice) PERSISTED,
    SaleDate DATE,
    RegionID INT,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (RegionID) REFERENCES Region(RegionID)
);

-- =====================================================
-- Step 3: Insert Sample Data
-- =====================================================

-- 🌍 Region
INSERT INTO Region (RegionName, Country, State, City, PostalCode, CreatedDate, ManagerName) VALUES
('North Zone', 'India', 'Delhi', 'New Delhi', '110001', '2024-01-10', 'Amit Sharma'),
('South Zone', 'India', 'Karnataka', 'Bangalore', '560001', '2024-01-11', 'Priya Menon'),
('East Zone', 'India', 'West Bengal', 'Kolkata', '700001', '2024-01-12', 'Ravi Singh'),
('West Zone', 'India', 'Maharashtra', 'Mumbai', '400001', '2024-01-13', 'Neha Patil'),
('Central Zone', 'India', 'Madhya Pradesh', 'Bhopal', '462001', '2024-01-14', 'Ankit Verma');

-- 👥 Customer
INSERT INTO Customer (FirstName, LastName, Email, Phone, RegionID, CreatedDate, IsActive) VALUES
('Rahul', 'Mehta', 'rahul.mehta@example.com', '9991112233', 1, '2024-01-10', 1),
('Sneha', 'Patel', 'sneha.patel@example.com', '8882223344', 2, '2024-01-11', 1),
('Ankit', 'Singh', 'ankit.singh@example.com', '7773334455', 3, '2024-01-12', 1),
('Pooja', 'Reddy', 'pooja.reddy@example.com', '6664445566', 2, '2024-01-13', 1),
('Ramesh', 'Iyer', 'ramesh.iyer@example.com', '9995556677', 4, '2024-01-14', 1),
('Divya', 'Sharma', 'divya.sharma@example.com', '8886667788', 1, '2024-01-15', 1),
('Karan', 'Das', 'karan.das@example.com', '7778889990', 3, '2024-01-16', 0),
('Aisha', 'Khan', 'aisha.khan@example.com', '9990001122', 5, '2024-01-17', 1),
('Vikram', 'Roy', 'vikram.roy@example.com', '8881112233', 4, '2024-01-18', 1),
('Ritu', 'Nair', 'ritu.nair@example.com', '7772223344', 2, '2024-01-19', 1);

-- 🏢 Product_Category
INSERT INTO Product_Category (CategoryName, Description, IsActive, CreatedDate, UpdatedDate, AddedBy, ParentCategoryID) VALUES
('Electronics', 'Electronic gadgets and devices', 1, '2024-01-05', '2024-01-05', 'Admin', NULL),
('Home Appliances', 'Appliances for household use', 1, '2024-01-06', '2024-01-06', 'Admin', NULL),
('Furniture', 'Home and office furniture', 1, '2024-01-07', '2024-01-07', 'Admin', NULL),
('Mobile Phones', 'Smartphones and accessories', 1, '2024-01-08', '2024-01-08', 'Admin', 1),
('Computers', 'Laptops and desktop computers', 1, '2024-01-09', '2024-01-09', 'Admin', 1),
('Kitchenware', 'Cooking and kitchen equipment', 1, '2024-01-10', '2024-01-10', 'Admin', 2),
('Outdoor', 'Garden and outdoor furniture', 1, '2024-01-11', '2024-01-11', 'Admin', 3);

-- 🏭 Product_Warehouse
INSERT INTO Product_Warehouse (WarehouseName, RegionID, Capacity, Manager, ContactNumber, CreatedDate, Status) VALUES
('Delhi Warehouse', 1, 10000, 'Rohit Kapoor', '9998887771', '2024-01-10', 'Active'),
('Bangalore Warehouse', 2, 8000, 'Priya Rao', '8887776662', '2024-01-11', 'Active'),
('Kolkata Warehouse', 3, 7000, 'Ravi Das', '7776665553', '2024-01-12', 'Active'),
('Mumbai Warehouse', 4, 12000, 'Neha Kulkarni', '6665554444', '2024-01-13', 'Active'),
('Bhopal Warehouse', 5, 6000, 'Ankit Soni', '9990001115', '2024-01-14', 'Inactive');

-- 📦 Product
INSERT INTO Product (ProductName, CategoryID, Price, StockQuantity, WarehouseID, SKU, CreatedDate) VALUES
('iPhone 14', 4, 79999, 50, 1, 'APL-IP14', '2024-01-10'),
('Samsung Galaxy S23', 4, 74999, 40, 2, 'SMS-S23', '2024-01-10'),
('Dell Inspiron 15', 5, 59999, 30, 2, 'DLL-IN15', '2024-01-11'),
('HP Pavilion', 5, 64999, 25, 1, 'HP-PAV', '2024-01-11'),
('LG Refrigerator', 2, 45000, 20, 4, 'LG-RF45', '2024-01-12'),
('Sony TV 55"', 1, 70000, 15, 4, 'SNY-TV55', '2024-01-13'),
('Wooden Dining Table', 3, 25000, 10, 3, 'WDN-TBL', '2024-01-14'),
('Microwave Oven', 6, 12000, 25, 5, 'MW-OV12', '2024-01-15'),
('Garden Chair', 7, 4000, 30, 5, 'GD-CHR', '2024-01-15'),
('Office Desk', 3, 18000, 18, 3, 'OFF-DSK', '2024-01-15');

-- 🛒 Purchase
INSERT INTO Purchase (ProductID, SupplierName, Quantity, UnitPrice, PurchaseDate, WarehouseID) VALUES
(1, 'Apple India Pvt Ltd', 20, 70000, '2024-02-01', 1),
(2, 'Samsung Electronics', 25, 65000, '2024-02-02', 2),
(3, 'Dell India', 15, 52000, '2024-02-03', 2),
(4, 'HP India', 10, 58000, '2024-02-04', 1),
(5, 'LG India', 12, 40000, '2024-02-05', 4),
(6, 'Sony India', 10, 60000, '2024-02-06', 4),
(7, 'Wood Works Ltd', 8, 20000, '2024-02-07', 3),
(8, 'Philips India', 15, 10000, '2024-02-08', 5),
(9, 'Garden Decor Ltd', 20, 3000, '2024-02-09', 5),
(10, 'Office Supplies Co', 10, 15000, '2024-02-10', 3);

-- 💰 Sales
INSERT INTO Sales (ProductID, CustomerID, Quantity, UnitPrice, SaleDate, RegionID) VALUES
(1, 1, 1, 79999, '2024-03-01', 1),
(2, 2, 1, 74999, '2024-03-02', 2),
(3, 3, 1, 59999, '2024-03-03', 3),
(4, 4, 1, 64999, '2024-03-04', 2),
(5, 5, 1, 45000, '2024-03-05', 4),
(6, 6, 1, 70000, '2024-03-06', 1),
(7, 7, 1, 25000, '2024-03-07', 3),
(8, 8, 1, 12000, '2024-03-08', 5),
(9, 9, 2, 4000, '2024-03-09', 4),
(10, 10, 1, 18000, '2024-03-10', 2),
(1, 2, 1, 79999, '2024-03-11', 2),
(5, 3, 1, 45000, '2024-03-12', 3),
(7, 4, 1, 25000, '2024-03-13', 2),
(9, 5, 3, 4000, '2024-03-14', 4),
(6, 6, 1, 70000, '2024-03-15', 1);
