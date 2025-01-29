/*
A Self Join is a type of join in SQL Server where a table is joined with itself. This is useful when you need to compare rows within the same table. Since a table cannot be directly joined with itself in a meaningful way, aliases are used to treat it as two separate tables.

When to Use a Self Join?
Self Joins are typically used for:

Hierarchical data relationships (e.g., employee-manager relationships in an organization).
Finding duplicate records within a table.
Comparing rows within the same table based on certain conditions.

SELECT A.column1, B.column2
FROM TableName A
JOIN TableName B
ON A.common_column = B.common_column;



*/

USE WhereClause
GO

SELECT * FROM Employee;
SELECT * FROM Projects;
SELECT * FROM Department;
SELECT * FROM Gender;
SELECT * FROM Positions;

SELECT * FROM Employee 
	JOIN Positions ON Positions.ID = Employee.PositionsId