USE WhereClause
GO

-- How Do you find the last id in a SQL
SELECT * FROM Employee;

SELECT MAX(ID) AS Last_Id FROM Employee;
-- This Query select the maxmimu (largest) value.  
SELECT * FROM Employee WHERE ID = (SELECT MAX(ID) AS Last_Id FROM Employee) ;

SELECT TOP 1 ID FROM Employee ORDER BY ID DESC;