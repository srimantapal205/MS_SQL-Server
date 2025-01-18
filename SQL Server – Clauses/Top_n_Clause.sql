USE WhereClause;
-- In SQL Server, the TOP clause is used to limit the number of rows returned in a query result. It is particularly useful when you need to retrieve a specific subset of rows, such as the top-performing records, most recent entries, or a sample of data.

-- SELECT TOP (n) column1, column2, ...
-- FROM table_name
-- WHERE condition
-- ORDER BY column_name;
-------------------------------------------------------
-- SELECT TOP (top_value) [PERCENT] [WITH TIES]
-- Expressions
-- FROM Tables
-- [WHERE Conditions]
-- [ORDER BY Expression [ASC | DESC]];

-- n:

-- Represents the number of rows to return.
-- Can be a literal value or an expression that evaluates to an integer.
-- PERCENT (optional):

-- Fetches a percentage of the total rows rather than an exact count.
-- Useful for retrieving a representative subset of data.
-- WITH TIES (optional):

-- Ensures that additional rows are included if they match the value of the last row in the result set based on the ORDER BY clause.
-- This is used to prevent missing tied rows.
-- ORDER BY:

-- Determines the order in which rows are selected and returned. Without ORDER BY, the rows are returned arbitrarily.

SELECT * FROM [dbo].[Employee]

-- Using TOP keyword
SELECT TOP(3) * FROM Employee  WHERE GenderID = 1 ORDER BY ID ;

-- Using TOP and PERCENT keyword

SELECT TOP(60) PERCENT * FROM Employee WHERE GenderID = 1 ORDER BY ID;

-- Select query using tom with ties
SELECT TOP (9) Name FROM Employee ORDER BY Name;

SELECT TOP(3) WITH TIES Name FROM Employee ORDER BY Name;

SELECT TOP(5) WITH TIES Name FROM Employee ORDER BY Name ASC;

------
SELECT TOP(20) PERCENT Name FROM Employee ORDER BY Name ASC;

--------
SELECT TOP (20) PERCENT WITH TIES Name FROM Employee ORDER BY Name ASC; 

