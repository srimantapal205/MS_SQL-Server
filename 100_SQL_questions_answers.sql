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



--------------------------------------------------------

SELECT DISTINCT Salary FROM Employee ORDER BY Salary DESC OFFSET 2 ROWS FETCH NEXT 1 ROW ONLY;


------------------------------

WITH Heighest_Salary AS (SELECT*,  ROW_NUMBER() OVER(ORDER BY Salary DESC) AS Rank_Item FROM Employee )
SELECT Salary FROM Heighest_Salary WHERE Rank_Item = 3

--SELECT ID, Salary, NTH_VALUE(salary, 3) OVER(ORDER BY Salary DESC) AS third_highest_salary FROM Employee; 

--7. How to get the common records from two tables?

SELECT * FROM Employee INTERSECT SELECT * FROM Department;


-- 8. How to retrieve the last 10 records from a table?
SELECT TOP 10 * FROM Employee ORDER BY ID  DESC;

-- 9. How do you fetch the top 5 employees with the highest salaries?
SELECT TOP 5 * FROM Employee ORDER BY Salary DESC

-- 10 How to calculate the total salary of all employees?
SELECT SUM(Salary) AS Total_Salary__All_Employee FROM Employee;

-- 11. How to write a query to find all employees who joined in the year 2020?
--SELECT * FROM Employee WHERE YEAR(join_date) = 2020

-- 12. Write a query to find employees whose name starts with 'A'.
SELECT * FROM Employee WHERE Name LIKE  'A%';

-- 14. How to find the department with the highest number of employees?
SELECT DepartmentID, COUNT(*) AS Higest_No_Emp FROM Employee GROUP BY DepartmentID ORDER BY  COUNT(*) DESC OFFSET 0 ROWS FETCH NEXT 1 ROW ONLY
-- 15. How to get the count of employees in each department?
SELECT DepartmentID AS ID,D.Name AS Department_Name, COUNT(*) AS No_Employe FROM Employee INNER JOIN Department AS D ON DepartmentID = D.ID GROUP BY DepartmentID, D.Name ORDER BY COUNT(*) DESC 




