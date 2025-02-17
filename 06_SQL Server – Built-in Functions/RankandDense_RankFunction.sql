USE WhereClause
GO

/*
Difference Between RANK and DENSE_RANK in SQL Server
Both RANK() and DENSE_RANK() are window functions in SQL Server used for ranking rows based on a specified column's values. The main difference between them lies in how they handle duplicate values.

RANK()

 Assigns a unique rank to each row within a partition.
 If there are duplicate values, the next rank is skipped.
 The ranking sequence has gaps when duplicates exist.

DENSE_RANK()

 Assigns a unique rank to each row within a partition.
 If there are duplicate values, they receive the same rank.
 The ranking sequence remains continuous, with no gaps.

*/
-- Rank function without partition by clause
SELECT Name, Salary, DepartmentID,  Rank() OVER(ORDER BY Salary DESC) AS [Rank] FROM Employee;

-- Rank function with partition by clause
SELECT  Name, DepartmentID, Salary, RANK() OVER(PARTITION BY DepartmentId ORDER BY Salary Desc) AS [Rank] FROM Employee;


--DENSE_RANK
--Without out partition by 
SELECT Name, DepartmentID, Salary, DENSE_RANK() OVER(ORDER By Salary DESC) AS [Rank] FROM Employee

--With out partition by 
SELECT Name, DepartmentID, Salary, DENSE_RANK() OVER(PARTITION BY DepartmentID ORDER BY Salary DESC) AS [DENSE RANK] FROM Employee

-- FETCh the 2nd highest salary using the rank function

WITH EmployeeCTEv1 AS (
	SELECT Salary, RANK() OVER (ORDER BY Salary DESC ) AS Rank_Salary FROM Employee
)

SELECT TOP 1 Salary FROM EmployeeCTEv1 WHERE Rank_Salary = 3


-- Fetch the 2nd Highest Salary using DENSE_RANK Function:
WITH EemployeeCTEv2 AS (
	SELECT Name,  Salary, DENSE_Rank() OVER(ORDER BY Salary DESC) AS DenseRank_Salary FROM Employee
)
SELECT  * FROM EemployeeCTEv2 WHERE DenseRank_Salary = 3


-- Example to find the Highest Salary Department wise:
WITH EmployeeCTEv3 AS(
	SELECT E.Name, E.Salary, E.DepartmentId,  DENSE_RANK() OVER(PARTITION BY DepartmentID ORDER BY Salary DESC ) AS Salary_Rank FROM Employee AS E 
)
--SELECT *, D.Name FROM EmployeeCTEv3 LEFT JOIN Department AS D ON EmployeeCTEv3.DepartmentID = D.ID    WHERE D.Name = 'Human Resources' ;
--SELECT *, D.Name FROM EmployeeCTEv3 LEFT JOIN Department AS D ON EmployeeCTEv3.DepartmentID = D.ID    WHERE D.Name = 'Finance' ;
--SELECT *, D.Name FROM EmployeeCTEv3 LEFT JOIN Department AS D ON EmployeeCTEv3.DepartmentID = D.ID    WHERE D.Name = 'Information Technology' ;
--SELECT *, D.Name FROM EmployeeCTEv3 LEFT JOIN Department AS D ON EmployeeCTEv3.DepartmentID = D.ID    WHERE D.Name = 'Marketing' ;
SELECT *, D.Name FROM EmployeeCTEv3 LEFT JOIN Department AS D ON EmployeeCTEv3.DepartmentID = D.ID    WHERE D.Name = 'Customer Service' ;
/*
Human Resources
Finance
Information Technology
Marketing
Operations
Research and Development
Customer Service
Sales
*/

--SELECT *, D.Name FROM EmployeeCTEv3 LEFT JOIN Department AS D ON EmployeeCTEv3.DepartmentID = D.ID    WHERE Salary_Rank = 1  AND D.Name = 'Research and Development' 

