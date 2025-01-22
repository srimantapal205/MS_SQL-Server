-- The EXISTS operator in SQL Server is used to check whether a subquery returns any rows. It returns TRUE if the subquery returns at least one row and FALSE if the subquery returns no rows.

-- This operator is typically used in conjunction with a WHERE clause to test for the existence of records in a subquery.

-- SELECT column_name(s) FROM table_name WHERE EXISTS (subquery);

USE WhereClause
GO


-- SELECT STATEMENT Using EXISTS statement
SELECT * FROM Employee WHERE EXISTS (SELECT * FROM Department WHERE Employee.DepartmentID = Department.ID) ORDER BY DepartmentID;
SELECT * FROM Department; 

-- Select statement NOT Exits statement
SELECT * FROM Employee WHERE NOT EXISTS(SELECT * FROM Department WHERE Employee.DepartmentID = Department.ID) ORDER BY DepartmentID; 

SELECT * FROM Department WHERE NOT EXISTS(SELECT * FROM Employee WHERE Employee.DepartmentID = Department.ID) ORDER BY ID; 