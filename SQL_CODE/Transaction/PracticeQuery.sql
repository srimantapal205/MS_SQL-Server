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
/*Hour-wise - Minute-wise --  Second-wise */
--SELECT * FROM transactions
SELECT 
    DATEPART(HOUR, PaymentDate) AS HourOfDay,
    COUNT(*) AS txn_count,
    SUM(PaidAmount) AS Total_Amount
FROM 
    transactions
GROUP BY DATEPART(HOUR, PaymentDate)
ORDER BY HourOfDay;