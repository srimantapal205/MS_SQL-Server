--IN BETWEEN and LIKE Operators

USE WhereClause
GO

SELECT * FROM Employee 
GO

--BETWEEN Operator in SQL Server:
SELECT * FROM Employee WHERE Age BETWEEN 25 AND 27;
--NOT BETWEEN Operator in SQL Server:
SELECT * FROM Employee WHERE Age NOT BETWEEN 25 AND 27;
--IN Operator in SQL Server:
SELECT * FROM Employee WHERE DepartmentID  IN (1,2)
--NOT IN Operator in SQL Server:
SELECT * FROM Employee WHERE DepartmentID NOT IN (1,2)
--LIKE Operator Using ‘%’ wildcard SQL Server:

SELECT * FROM Employee WHERE Name LIKE 'P%';
--
SELECT * FROM Employee WHERE Name LIKE '%a';
--
SELECT * FROM Employee WHERE Name LIKE '%am%';
--
SELECT * FROM Employee WHERE Name LIKE '___';
--
SELECT * FROM Employee WHERE Name LIKE '%A%';
--
SELECT * FROM Employee WHERE Name LIKE 'P%A';
--
SELECT * FROM Employee WHERE Name LIKE '[j,k,h,u]';
SELECT * FROM Employee WHERE Name LIKE '[J,K,H,U]';
--
SELECT * FROM Employee WHERE Name LIKE '[A-Z]%';
SELECT * FROM Employee WHERE Name LIKE '%[A-Z]';
SELECT * FROM Employee WHERE Name LIKE '%[A-Z]%';
SELECT * FROM Employee WHERE Name NOT LIKE '[A-Z]%';
--
SELECT * FROM Employee WHERE Name NOT LIKE '[A-E-I-O-U]%';
--



