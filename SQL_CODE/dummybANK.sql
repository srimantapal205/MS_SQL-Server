CREATE DATABASE DummyBank
GO

-- Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name NVARCHAR(100),
    email NVARCHAR(100),
    country NVARCHAR(50),
    created_at DATE
);

-- Accounts Table
CREATE TABLE Accounts (
    account_id INT PRIMARY KEY,
    customer_id INT,
    account_type NVARCHAR(50),
    opened_date DATE,
    status NVARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Transactions Table
CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT,
    transaction_date DATE,
    amount DECIMAL(18,2),
    transaction_type NVARCHAR(50),
    inserted_at DATETIME,
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
);

-- MonthlyBalances Table
CREATE TABLE MonthlyBalances (
    customer_id INT,
    month DATE,
    balance DECIMAL(18,2),
    PRIMARY KEY (customer_id, month)
);

-- Portfolio Table
CREATE TABLE Portfolio (
    portfolio_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    product_name NVARCHAR(100),
    portfolio_value DECIMAL(18,2),
    quarter NVARCHAR(10),
    revenue DECIMAL(18,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Customers
INSERT INTO Customers VALUES
(1, 'Alice Dsouza', 'alice@socgen.com', 'India', '2023-02-01'),
(2, 'Bob Martin', 'bob@socgen.com', 'France', '2022-08-15'),
(3, 'Claire Zhang', 'claire@socgen.com', 'Singapore', '2021-01-20');

-- Accounts
INSERT INTO Accounts VALUES
(101, 1, 'Savings', '2023-02-10', 'Active'),
(102, 1, 'Checking', '2023-03-01', 'Active'),
(201, 2, 'Savings', '2022-09-10', 'Closed'),
(301, 3, 'Investment', '2021-02-01', 'Active');

-- Transactions
INSERT INTO Transactions VALUES
(1, 101, '2025-01-01', 1500.00, 'Deposit', '2025-01-01 10:00'),
(2, 101, '2025-01-01', 20000.00, 'Deposit', '2025-01-01 10:10'),
(3, 101, '2025-01-01', 18000.00, 'Deposit', '2025-01-01 10:15'),
(4, 101, '2025-01-01', 25000.00, 'Deposit', '2025-01-01 10:20'),
(5, 101, '2025-01-01', 11000.00, 'Deposit', '2025-01-01 10:25'),
(6, 101, '2025-01-01', 13000.00, 'Deposit', '2025-01-01 10:30'),
(7, 102, '2025-02-10', -300.00, 'Withdrawal', '2025-02-11 09:10'),
(8, 201, '2024-12-01', 500.00, 'Deposit', '2024-12-02 14:00'),
(9, 301, '2025-03-01', 70000.00, 'Investment', '2025-03-01 16:00'),
(10, 301, '2025-03-05', -5000.00, 'Withdrawal', '2025-07-01 14:00'); -- Late inserted

-- MonthlyBalances
INSERT INTO MonthlyBalances VALUES
(1, '2025-01-01', 75000.00),
(1, '2025-02-01', 79000.00),
(1, '2025-03-01', 81000.00),
(2, '2025-01-01', 60000.00),
(2, '2025-02-01', 62000.00),
(2, '2025-03-01', 63000.00);

-- Portfolio
INSERT INTO Portfolio VALUES
(1, 1, 101, 'Equity Fund', 150000.00, 'Q1-2025', 1200.00),
(2, 1, 102, 'Debt Fund', 80000.00, 'Q1-2025', 700.00),
(3, 2, 201, 'Real Estate', 60000.00, 'Q1-2025', 400.00),
(4, 3, 301, 'Gold ETF', 95000.00, 'Q1-2025', 950.00);
