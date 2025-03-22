SELECT name, database_id, create_date FROM sys.databases;
GO

USE WhereClause;

SELECT name FROM sys.tables

SELECT * FROM Employee;

-- Using Case

SELECT ID, Name,
	CASE
		WHEN Salary > 70000 THEN 'High'
		WHEN Salary BETWEEN 45000 AND 70000 THEN 'Medium'
		ELSE 'LOW'
	END AS SalaryLevel
FROM Employee


SELECT *, COALESCE(NULL, NULL, 'Default Value') AS Result FROM Employee;

SELECT ID, Name, NVL2(Salary, 0) AS AdjustSalary FROM Employee

SELECT ID, Name, Salary, RANK() OVER(ORDER BY Salary DESC) AS Rank FROM Employee;  -- Using RANK() function it will skip the rank number if get the ties value

SELECT ID, Name, Salary, DENSE_RANK() OVER(ORDER BY Salary DESC) AS DenseRank FROM Employee; -- Using DENSE_RANK() function provide rank sequencialy without any skip or gap. 

SELECT Salary, DENSE_RANK() OVER(ORDER BY Salary DESC) AS DenseRank FROM Employee GROUP BY Salary;  

SELECT ID, Name, Salary, DENSE_RANK() OVER(ORDER BY Salary DESC) As Emp_Rank, ROW_NUMBER() OVER(ORDER BY ID) AS Emp_Row_Number FROM Employee; -- USING Row number and rank to compare 
