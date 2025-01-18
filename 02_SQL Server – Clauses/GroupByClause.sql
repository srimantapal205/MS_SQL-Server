USE WhereClause;
-- The GROUP BY clause in SQL Server is used to group rows that have the same values in specified columns into summary rows, like totals or counts. It is typically used in conjunction with aggregate functions such as COUNT, SUM, AVG, MAX, or MIN to perform calculations on each group of data.

-- SELECT column1, column2, AGGREGATE_FUNCTION(column3)
-- FROM table_name
-- WHERE condition
-- GROUP BY column1, column2
-- HAVING condition_on_aggregate_function
-- ORDER BY column1, column2;


-- --------------------------
-- SELECT expression1, expression2, expression_n, 
--        aggregate_function (expression)
-- FROM tables
-- [WHERE conditions]
-- GROUP BY expression1, expression2, expression_n;

-- -----------------------------------------------------
SELECT COUNT(*) AS TotelEmployee FROM Employee;

SELECT * FROM Employee;
--Find the number of employee working in each department in the company

SELECT DepartmentID , COUNT(*) AS TotalEmployee FROM Employee GROUP BY DepartmentID;

--Find the total SALARY in each departmentof the ORGANIZATION.
SELECT DepartmentId, TotalSalary = SUM(Salary) FROM Employee GROUP BY DepartmentID;

-- Find The Highest Salary in each Departme in the Organization
SELECT DepartmentId, MaxSalary = MAX(Salary) FROM Employee GROUP BY DepartmentID;

--To Get the employees working in each Gender per Depertment
SELECT DepartmentId, GenderId, EmployeeCount = COUNT(*) FROM Employee GROUP BY DepartmentID, GenderID ORDER BY GenderID;

--To get the gender wise count and total salary.
SELECT GenderId, Total_Salary = SUM(Salary), Gender_Count = COUNT(*) FROM Employee GROUP BY GenderID; 

SELECT MAX(Salary) As Max_Salary , MIN(Salary) As Min_Salary FROM Employee;

--Total salary by the city
SELECT City, SUM(Salary) AS Total_Salary FROM Employee GROUP BY City 

-- Retrive total Salary by city and by gender
SELECT City, GenderId, SUM(Salary)  AS Total_Salary FROM Employee GROUP BY City, GenderId ORDER BY City;

--Retrive total salary and total number of employees by City by gender

SELECT City, GenderId, SUM(Salary) AS TotalSalary, COUNT(ID) AS TotalEmployees FROM Employee GROUP BY City, GenderID;

--The highest salary of each department alog with the name of the employee
SELECT DepartmentId, MAX(Salary) AS Salary, Name FROM Employee GROUP BY  DepartmentID -- Invavalid;


SELECT DepartmentId, MAX(Salary) as Salary, Name FROM Employee GROUP BY DepartmentId -- Invalid 

SELECT DepartmentId, MAX(SALARY), GETDATE() AS DateTime FROM Employee  GROUP BY DepartmentId --Valid

SELECT DepartmentId, GenderId, MAX(Salary) AS Max_Salary, 'Hello' as FixedValue FROM Employee GROUP BY DepartmentId, GenderId --Valid