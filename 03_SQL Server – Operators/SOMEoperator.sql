-- The SOME operator in SQL Server is used to compare a value to a set of values returned by a subquery. It is similar to the ANY operator and returns TRUE if the comparison is true for at least one value in the subquery.

-- expression operator SOME (subquery)

-- expression: The value or column being compared.
-- operator: A comparison operator such as =, !=, >, <, >=, <=.
-- subquery: A subquery that returns a single column of values.

USE WhereClause
GO

SELECT * FROM Employee WHERE Salary > SOME(SELECT Salary FROM Employee WHERE DepartmentID = 3)
