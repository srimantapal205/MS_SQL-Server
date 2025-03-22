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


--CTEs
WITH TopSalaries AS(SELECT Name, Salary FROM Employee WHERE Salary > 50000 )
--SELECT * FROM TopSalaries ORDER BY Name;
SELECT * FROM TopSalaries WHERE Name LIKE 'C%';

--Window Function

SELECT *, SUM(Salary) OVER(ORDER BY Salary) AS RuningTotal FROM  Employee ORDER BY RuningTotal;

--SQL MERGE Statement

--MERGE INTO Employee E USING Department D ON E.DepartmentID = D.ID

SELECT * FROM Employee ORDER BY Salary DESC;

-- Write a query to find the second-highest salary of an employee in a table
SELECT MAX(Salary) As SecondHighestSalary FROM Employee WHERE Salary < (SELECT MAX(Salary) FROM Employee) ;
SELECT DISTINCT Salary AS SecondHighestSalary FROM Employee ORDER BY Salary DESC OFFSET 1 ROWS FETCH NEXT 1 ROW ONLY;

-- Write a query to find the Third-highest salary of an employee in a table
SELECT MAX(Salary) As ThirdHighestSalary FROM Employee 
	WHERE Salary < (SELECT MAX(Salary) FROM Employee 
		WHERE Salary < (SELECT MAX(Salary) FROM Employee)
	);

SELECT DISTINCT Salary AS ThirdHighestSalary FROM Employee ORDER BY Salary DESC OFFSET 2 ROWS FETCH NEXT 1 ROW ONLY;

-- Write a query to retrieve employees who earn more than the average salary.

SELECT * FROM Employee WHERE Salary > (SELECT AVG(Salary) FROM Employee);

--Write a query to fetch the duplicate values from a column in a table.

SELECT Salary , COUNT(*) AS No_Of_Times FROM Employee GROUP BY Salary HAVING COUNT(*)>1;


--Write a query to find the employees who joined in the last 30 days.

--SELECT * FROM Employee WHERE JoinIngDate > DATE_SUB(CURDATE(), INTERVAL 30 DAY)

--Write a query to fetch top 3 earning employees.

SELECT TOP 3 * FROM Employee ORDER BY Salary DESC;


--- Write a query to fetch common records from two tables.

SELECT * FROM Employee INNER JOIN Department ON Employee.DepartmentID = Department.ID; 

SELECT * FROM Employee INNER JOIN Department ON Employee.DepartmentID = Department.ID ORDER BY Employee.ID OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;

SELECT TOP 5 * FROM Employee INNER JOIN Department ON Employee.DepartmentID = Department.ID;


-- Write a query to fetch employees whose names start and end with ‘A’.

SELECT * FROM Employee WHERE Name LIKE 'A%' AND Name LIKE '%A';
SELECT * FROM Employee WHERE Name LIKE 'A%' AND Name LIKE '%';
SELECT * FROM Employee WHERE Name LIKE '%' AND Name LIKE '%A';


--Write a query to display all departments along with the number of employees in each

SELECT DepartmentID, COUNT(*) AS TOTAL_Employee FROM Employee GROUP BY DepartmentID ;

SELECT DepartmentID, D.Name, COUNT(*)AS TOTAL_Employee FROM Employee  INNER JOIN Department AS D ON Employee.DepartmentID = D.ID GROUP BY DepartmentID, D.Name;


-- Write a query to find employees who do not have managers.

-- SELECT * FROM Employee WHERE MAnagerID IS NULL

--Write a query to fetch the 3rd and 4th highest salaries.

SELECT Salary FROM Employee ORDER BY Salary DESC OFFSET 2 ROWS FETCH NEXT 2 ROWS ONLY;




