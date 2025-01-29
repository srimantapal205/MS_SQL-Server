/*
A Cross Join in SQL Server returns the Cartesian product of two tables. This means every row from the first table is combined with every row from the second table, resulting in a large dataset.

Key Points:
It does not require a JOIN condition.
The result set size is (rows in Table A) × (rows in Table B).
It can be useful for generating combinations of data (e.g., all possible employee-department assignments).
It can lead to large result sets, so use it carefully

SELECT * 
FROM TableA, TableB; -- (Implicit Cross Join)


*/

USE WhereClause
GO

SELECT * FROM Employee;
SELECT * FROM Projects;
SELECT * FROM Department;
SELECT * FROM Gender;
SELECT * FROM Positions;

SELECT * FROM Employee 
	CROSS JOIN Gender
	CROSS JOIN Department
	CROSS JOIN Positions;

