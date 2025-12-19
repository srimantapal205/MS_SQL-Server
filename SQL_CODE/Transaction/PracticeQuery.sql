USE RetailPaymentDB;
GO

SELECT * FROM Customers;

SELECT * FROM Orders;

SELECT * FROM Payments;

SELECT * FROM OrderItems;

WITH combineTable AS (
	SELECT 
        o.OrderID, 
        o.CustomerID, 
        p.PaymentID, 
        o.OrderDate, 
        o.TotalAmount,        
        p.PaymentDate, 
        p.PaymentMethod, 
        p.Amount AS PaidAmount, 
        p.Status AS PaymentStatus
    FROM 
        Orders AS o 
    JOIN 
        Payments AS p 
    ON 
        o.OrderID = p.OrderID
),
transactions AS(
    SELECT CustomerID, PaymentDate, PaidAmount FROM combineTable
)
--SELECT * FROM transactions


/*Year-Month-Day-Hour-wise - Minute-wise --  Second-wise 

-- Yearly Transactions 
SELECT 
    DATEPART(YEAR, PaymentDate) AS YearOfYear,
    COUNT(*) AS Txn_Count,
    SUM(PaidAmount) AS Total_Amount
FROM 
    transactions
GROUP BY 
    DATEPART(YEAR, PaymentDate)
ORDER BY 
    YearOfYear;

-- Month Transactions 
SELECT
    DATEPART(YEAR, PaymentDate) AS YearOfYear,
    DATEPART(MONTH, PaymentDate) AS YearOfMonth,
    COUNT(*) AS Txn_Count,
    SUM(PaidAmount) AS Total_Amount
FROM 
    transactions
GROUP BY 
    DATEPART(YEAR, PaymentDate),
    DATEPART(MONTH, PaymentDate)
ORDER BY 
    YearOfYear,YearOfMonth;

-- Daly Transactions (1 - Daybasis)
SELECT
    DATEPART(YEAR, PaymentDate) AS YearOfYear,
    DATEPART(MONTH, PaymentDate) AS YearOfMonth,
    DATEPART(DAY, PaymentDate) AS MonthOfDay,
    COUNT(*) AS txn_count,
    SUM(PaidAmount) AS Total_Amount
FROM 
    transactions
GROUP BY
    DATEPART(YEAR, PaymentDate),
    DATEPART(MONTH, PaymentDate),
    DATEPART(DAY, PaymentDate)
ORDER BY
    YearOfYear, YearOfMonth, MonthOfDay;

-- Hourly Transactions (24-hour basis)
SELECT
    DATEPART(YEAR, PaymentDate) AS YearOfYear,
    DATEPART(MONTH, PaymentDate) AS YearOfMonth,
    DATEPART(DAY, PaymentDate) AS MonthOfDay,
    DATEPART(HOUR, PaymentDate) AS HourOfDay,
    COUNT(*) AS txn_count,
    SUM(PaidAmount) AS Total_Amount
FROM 
    transactions
GROUP BY 
    DATEPART(YEAR, PaymentDate),
    DATEPART(MONTH, PaymentDate),
    DATEPART(HOUR, PaymentDate)
    DATEPART(DAY, PaymentDate)
ORDER BY 
    YearOfYear, YearOfMonth, MonthOfDay, HourOfDay;

-- Minute-wise Transactions
SELECT
    DATEPART(YEAR, PaymentDate) AS YearOfYear,
    DATEPART(MONTH, PaymentDate) AS YearOfMonth,
    DATEPART(DAY, PaymentDate) AS MonthOfDay,
    DATEPART(HOUR, PaymentDate) AS HourOfDay,
    DATEPART(MINUTE, PaymentDate) AS MinuteOfHour,
    Count(*) AS txn_count,
    SUM(PaidAmount) AS Total_Count
FROM 
    transactions
GROUP BY 
    DATEPART(YEAR, PaymentDate),
    DATEPART(MONTH, PaymentDate),
    DATEPART(HOUR, PaymentDate),
    DATEPART(MINUTE, PaymentDate),
    DATEPART(DAY, PaymentDate)
ORDER BY
    YearOfYear, YearOfMonth, MonthOfDay, HourOfDay, MinuteOfHour;
*/
--Second-wise Transactions
SELECT
    DATEPART(YEAR, PaymentDate) AS YearOfYear,
    DATEPART(MONTH, PaymentDate) AS YearOfMonth,
    DATEPART(DAY, PaymentDate) AS MonthOfDay,
    DATEPART(HOUR, PaymentDate) AS HourOfDay,
    DATEPART(MINUTE, PaymentDate) AS MinuteOfHour,
    DATEPART(SECOND, PaymentDate) AS SecondOfMinute,
    COUNT(*) AS txn_count,
    SUM(PaidAmount) AS Total_Amount
FROM 
    transactions
GROUP BY
    DATEPART(YEAR, PaymentDate),
    DATEPART(MONTH, PaymentDate),
    DATEPART(HOUR, PaymentDate),
    DATEPART(MINUTE, PaymentDate),
    DATEPART(SECOND, PaymentDate),
    DATEPART(DAY, PaymentDate)
ORDER BY
    YearOfYear, YearOfMonth, MonthOfDay, HourOfDay, MinuteOfHour, SecondOfMinute; 

-- Quarterly Summary
-- (Q1 = Jan - Mar, Q2 = Apr - Jun, Q3 = Jul - Sep, Q4 = Oct - Dec)

WITH combineTable AS (
	SELECT 
        o.OrderID, 
        o.CustomerID, 
        p.PaymentID, 
        o.OrderDate, 
        o.TotalAmount,        
        p.PaymentDate, 
        p.PaymentMethod, 
        p.Amount AS PaidAmount, 
        p.Status AS PaymentStatus
    FROM 
        Orders AS o 
    JOIN 
        Payments AS p 
    ON 
        o.OrderID = p.OrderID
),
transactions AS(
    SELECT CustomerID, PaymentDate, PaidAmount FROM combineTable
)
--SELECT * FROM transactions
SELECT 
      DATEPART(YEAR, PaymentDate)  AS Year_By,
      CONCAT('Q',DATEPART(QUARTER, PaymentDate)) AS QuarterlyBy_3_Txn,
      COUNT(*) AS Txn_count,
      SUM(PaidAmount) AS Total_Amount
FROM 
    transactions
GROUP BY 
    DATEPART(YEAR, PaymentDate),
    CONCAT('Q',DATEPART(QUARTER, PaymentDate))
ORDER BY 
    Year_By DESC,
    QuarterlyBy_3_Txn;


-- Half-Yearly Summary
-- Half-year groups: H1 = Jan�Jun, H2 = Jul�Dec

WITH combineTable AS (
	SELECT 
        o.OrderID, 
        o.CustomerID, 
        p.PaymentID, 
        o.OrderDate, 
        o.TotalAmount,        
        p.PaymentDate, 
        p.PaymentMethod, 
        p.Amount AS PaidAmount, 
        p.Status AS PaymentStatus,
        CASE
        WHEN
            DATEPART(MONTH, p.PaymentDate) BETWEEN 1 AND 6 THEN 'H1'
        ELSE
            'H2'
    END AS Hals_year_Txn
    FROM 
        Orders AS o 
    JOIN 
        Payments AS p 
    ON 
        o.OrderID = p.OrderID
),
transactions AS(
    SELECT CustomerID, PaymentDate, PaidAmount, Hals_year_Txn FROM combineTable
)
-- SELECT * FROM transactions;
SELECT 
    DATEPART(YEAR, PaymentDate) AS Txn_Year,
    COUNT(*) AS Count_Txn,
    SUM(PaidAmount) AS Total_amount, 
    Hals_year_Txn
FROM 
    transactions
GROUP BY
    DATEPART(YEAR, PaymentDate),
    Hals_year_Txn
ORDER BY
    Txn_Year, Hals_year_Txn;