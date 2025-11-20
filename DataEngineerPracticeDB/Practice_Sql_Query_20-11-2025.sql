USE DataEngineerPracticeDB;
GO

SELECT *
FROM DataEngineerPracticeDB.INFORMATION_SCHEMA.TABLES;

SELECT * FROM Employees;

-- 11. Retrieve employees hired in the same year
SELECT YEAR(JoiningDate) AS JoiningYear, Count(*) As Hires FROM Employees GROUP BY YEAR(JoiningDate);


--12. Get product details whose price is between 100 and 500
SELECT * FROM Products WHERE Price BETWEEN 100 AND 500;

--13. Find departments without any employees
Select d.DepartmentID, d.DepartmentName FROM Departments d LEFT JOIN Employees e ON d.DepartmentID  = e.DepartmentID WHERE e.EmployeeID IS NULL;

-- 14. Show employees who report to a specific manager
SELECT * FROM Employees WHERE ManagerID = 101;

-- 15. Find the oldest and newest employees
SELECT
	(SELECT TOP 1 EmpName FROM Employees ORDER BY JoiningDate ASC ) AS OldestEmployee,
	(SELECT TOP 1 EmpName FROM Employees ORDER BY JoiningDate DESC ) AS NewEmploye;
	

-- 16. Find cumulative sales per customer

SELECT 
	*
FROM Orders;

SELECT 
	CustomerID,
	OrderDate,
	SUM(TotalAmount) OVER(PARTITION BY CustomerID Order BY OrderDate) AS CumulativeSales
FROM Orders;

SELECT 
	CustomerID,
	SUM(TotalAmount)  AS TotalSalesAmount
FROM Orders
	Group BY CustomerID;

-- 17. Rank top customers by sales
SELECT 
	CustomerID,
	SUM(TotalAmount) AS TotalSalesAmount,
	DENSE_RANK() OVER(ORDER BY SUM(TotalAmount) DESC) AS SalesRank
FROM Orders
GROUP BY CustomerID;
