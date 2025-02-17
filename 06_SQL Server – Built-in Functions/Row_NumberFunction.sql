USE WhereClause
GO
/*
ROW_NUMBER() Function in SQL Server
The ROW_NUMBER() function is a window function in SQL Server that assigns a unique sequential integer to rows within a result set. It is often used for ranking, pagination, and removing duplicates.

Syntax:

ROW_NUMBER() OVER (PARTITION BY column_name ORDER BY column_name)

Understanding PARTITION BY and ORDER BY in ROW_NUMBER()
	+ PARTITION BY Clause
		- Divides the dataset into groups, and the row numbers reset for each partition.
		- If omitted, the numbering runs continuously across all rows.
	+ ORDER BY Clause
		- Determines the sequence in which numbers are assigned within each partition.

Using ROW_NUMBER() With and Without PARTITION BY
	+  ROW_NUMBER() Without PARTITION BY

	SELECT 
    EmployeeID, 
    Name, 
    Department, 
    Salary,
    ROW_NUMBER() OVER (ORDER BY Salary DESC) AS RowNum
FROM Employees;



*/


-- RoW_NUMBER function without Partition BY:

SELECT Name, DepartmentID, Salary, ROW_NUMBER() OVER(ORDER BY DepartmentID) AS RowNumber FROM Employee;


-- RoW_NUMBER function with Partition BY: 
-- It's can create specific group using partition
SELECT Name, DepartmentID, Salary, ROW_NUMBER() OVER(PARTITION BY DepartmentID ORDER BY DepartmentID) AS RowNumber FROM Employee

SELECT Name, DepartmentID, Salary, ROW_NUMBER() OVER(PARTITION BY DepartmentID ORDER BY DepartmentID) AS RowNumber FROM Employee    WHERE DepartmentID = 2;

-- Delete the duplicate record from the employee table

WITH DeleteDuplicateCTE AS (
	SELECT * , ROW_NUMBER() OVER(PARTITION BY ID ORDER BY ID) AS RowNumber FROM Employee
)

DELETE FROM DeleteDuplicateCTE WHERE RowNumber>1





