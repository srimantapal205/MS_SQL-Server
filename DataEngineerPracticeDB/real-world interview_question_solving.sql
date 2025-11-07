USE DataEngineerPracticeDB;
GO

-- 1. Retrieve all employee details
SELECT * FROM [dbo].[Employees];

-- 2. Find employees who joined after 2022

SELECT * FROM Employees WHERE JoiningDate > '2022-01-01';


-- 3. Count number of employees by department

SELECT DepartmentID, COUNT(EmployeeID) AS Dept_Emp_count FROM Employees GROUP BY DepartmentID;

-- 4. Get the total sales per region

SELECT * FROM [dbo].[Sales]

SELECT Region, SUM(SalesAmount) AS Total_Sales FROM Sales GROUP BY Region;

-- 5. Find all customers who have not placed any order

SELECT * FROM [dbo].[Orders];
SELECT * FROM [dbo].[Customers];

SELECT c.CustomerID, c.CustomerName FROM Customers c LEFT JOIN Orders o ON c.CustomerId = o.CustomerId WHERE o.OrderId IS NULL;

-- 6. Retrieve employees whose names start with ‘A’
SELECT * FROM Employees  WHERE EmpName LIKE 'A%';

-- 7. Find top 5 highest-paid employees

SELECT TOP 5 EmpName, Salary FROM Employees ORDER BY Salary DESC;

-- 8. Show department-wise average salary
SELECT DepartmentID, AVG(Salary) AS Avg_Salary FROM Employees GROUP BY DepartmentID;

-- 9. Get total revenue for the current year
SELECT * FROM Sales;

SELECT * FROM Orders

SELECT SUM(TotalAmount) AS YearlyRevenue FROM Orders WHERE YEAR(OrderDate) = YEAR(GETDATE());

-- 10  Find duplicate employee email IDs

SELECT Email, COUNT(Email) AS Email_count FROM Employees GROUP BY  Email HAVING COUNT(*) > 1











