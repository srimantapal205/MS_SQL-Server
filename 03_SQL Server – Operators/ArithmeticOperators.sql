-- Addition Operator
SELECT 100 + 100 AS Addition;

-- Minus Operator
SELECT 100 - 105 AS Minus;

-- Multiplication
SELECT 100*5 AS Multiply;

--Division Operator
SELECT 100/5 AS Division;

-- Moduler Operator
SELECT 21%4  AS Module;

USE WhereClause
Go

SELECT * FROM Employee;

-- Calculation Employee salary after the addition 10%
SELECT ID, Name, DepartmentID, Salary, Salary*1.1 AS Calculated_Aslary FROM Employee;

SELECT TOP(5) *, Salary*0.11 / 2.54 + 27.36 AS Calculated_Salary FROM Employee  

-- Provide the order precendence the simply use round brackets as shown. 

SELECT TOP(5) *, Salary*0.11 / (2.54+27.36) AS Calculated_Salary FROM Employee


-- Arithmetic Operation on Date value

SELECT GETDATE() +1 AS "CurrentDate_+_1";

SELECT GETDATE() -1 AS "CurrentDate_-_1";

SELECT GETDATE() * 5 AS "CurrentDate_*_5"; --Implicit conversion from data type datetime to int is not allowed.
SELECT GETDATE() / 5 AS "CurrentDate_*_5"; --Implicit conversion from data type datetime to int is not allowed.

