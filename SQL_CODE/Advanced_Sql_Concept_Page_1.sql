USE WhereClause
GO

-- How Do you find the last id in a SQL
SELECT * FROM Employee;

SELECT MAX(ID) AS Last_Id FROM Employee;
-- This Query select the maxmimu (largest) value.  
SELECT * FROM Employee WHERE ID = (SELECT MAX(ID) AS Last_Id FROM Employee) ;

SELECT TOP 1 ID FROM Employee ORDER BY ID DESC;


-- How Do you remove the duplicates from a table
-- Using DISTINCT
SELECT * FROM dbo.tblOrder;

SELECT DISTINCT * FROM dbo.tblOrder;
-- This Will retrive distinct row from the table based on all column.
