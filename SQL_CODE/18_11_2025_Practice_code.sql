USE MarketPlace_v2;
Go

SELECT * FROM Product;
SELECT * FROM Customer;
SELECT * FROM Purchases;
SELECT * FROM Transactions;



SELECT 
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH,
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Transactions';


INSERT INTO Transactions (TransactionID, PurchaseID, Amount, PaymentMethod) VALUES
-- Additional requested rows (Cash, cash, CASH, Card)
(2006, 1006, 79.99, 'Cash'),
(2007, 1007, 129.99, 'cash'),
(2008, 1008, 19.99, 'CASH'),
(2009, 1009, 299.99, 'Card'),
(2010, 1010, 899.49, 'Debit Card'),
(2011, 1011, 1499.00, 'Credit Card'),
(2012, 1012, 59.00, 'Card'),
(2013, 1013, 35.50, 'Cash');

INSERT INTO Transactions (TransactionID, PurchaseID, Amount, PaymentMethod) VALUES
-- Additional requested rows (Cash, cash, CASH, Card)
(2014, 1006, 79.99, 'Cash'),
(2015, 1003, 79.99, 'Credit Card');



SELECT PurchaseID, PaymentMethod FROM Transactions;

WITH singleTMethod AS(
    SELECT 
        TransactionID,
        PurchaseID, 
        PaymentMethod,
        COUNT(PaymentMethod) OVER (PARTITION BY PurchaseID ) AS countPyM,
        DENSE_RANK() OVER(ORDER BY  PaymentMethod) AS PaMRnk
    FROM
        Transactions

)   
SELECT * FROM singleTMethod ORDER BY PurchaseID;

SELECT 
        PurchaseID, 
        PaymentMethod,
         COUNT(PaymentMethod) OVER (PARTITION BY PurchaseID ) AS countPyM
FROM Transactions
GROUP BY PurchaseID, PaymentMethod
HAVING COUNT(DISTINCT LOWER(PaymentMethod)) = 1
   AND LOWER(MAX(PaymentMethod)) = 'cash';