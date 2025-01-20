USE WhereClause;

-- Assignment Operator 
SELECT * FROM Employee;

--Without using Compound  Assignment Operators
DECLARE @MYVarible INT
SET @MYVarible = 10
SET @MyVarible = @MYVarible * 5
SELECT @MYVarible As MyResult;
--
--Compound Assignment Operators
DECLARE @Myvarible2 INT 
SET @Myvarible2 = 10
SET @Myvarible2  *= 5
SELECT @Myvarible2 AS MYResult
GO