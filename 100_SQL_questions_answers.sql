USE WhereClause
GO

SELECT * FROM Employee;

-- 1. How to retrieve the second-highest salary of an employee?
SELECT MAX(Salary) second_highest_salary FROM Employee WHERE Salary < (SELECT MAX(Salary) FROM Employee)

-- 2. How to get the nth highest salary in ?
WITH RankSalary AS (SELECT Id, Salary, DENSE_RANK() OVER (ORDER BY Salary) AS SalaryRank FROM Employee)
SELECT * FROM  RankSalary 
SELECT *, RANK() OVER (ORDER BY Salary) AS Rank_Salary FROM Employee
SELECT *, DENSE_RANK() OVER (ORDER BY Salary) AS Salary_DENES_Rank FROM Employee

-- 3. How do you fetch all employees whose salary is greater than the average salary?
SELECT ID, Name, Salary  FROM Employee  WHERE Salary > (SELECT AVG(Salary) FROM Employee) ; 

-- 4. Write a query to display the current date and time in .
SELECT CURRENT_TIMESTAMP AS Date_Time;

-- 5. How to find duplicate records in a table?
SELECT COUNT(*) duplicate_email_id  FROM Employee GROUP BY EmailID HAVING COUNT(*) > 1;

-- 6. How can you delete duplicate rows in ?
WITH CTE AS(SELECT Id, ROW_NUMBER() OVER(PARTITION BY Id ORDER BY Id) AS row_num FROM Employee)
DELETE FROM CTE WHERE row_num > 1



