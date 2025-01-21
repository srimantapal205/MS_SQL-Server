--Logical Operators in SQL 

USE WhereClause
GO

SELECT * FROM Employee 
GO

-- AND - TRUE if both Boolean expressions are TRUE.
SELECT * FROM Employee WHERE Salary >= 30000 AND Salary<= 70000;

-- OR - TRUE if either Boolean expression is TRUE.
SELECT * FROM Employee WHERE DepartmentID = 1 OR DepartmentID = 3;

-- NOT - Reverses the value of any other Boolean operator.

SELECT * FROM Employee WHERE NOT City = 'MUMBAI';

-- Nested Logical Operators in SQL Server:
SELECT * FROM Employee WHERE (Salary >= 30000 AND Salary <60000) OR (DepartmentID = 1 OR DepartmentID=3)  AND NOT (City = 'MUMBAI' OR  City= 'BANGALORE')

 