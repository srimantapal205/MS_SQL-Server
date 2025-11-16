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



-------------------------------------------
SELECT * FROM MuseumVisits;
/*
ExhibitID INT,
    ExhibitName VARCHAR(100),
    VisitorID INT,
    VisitDate DATE
*/

SELECT 
	ExhibitID, 
	ExhibitName,
	COUNT(DISTINCT VisitorID) AS TotalVisitor 
FROM 
	MuseumVisits
GROUP BY ExhibitID, ExhibitName
ORDER BY TotalVisitor ASC


SELECT 
	ExhibitID, 
	ExhibitName,
	--COUNT(DISTINCT VisitorID) AS TotalVisitor,
	VisitDate,
	/*CASE
		WHEN MONTH(VisitDate) BETWEEN 1 AND 3 THEN 'Q1'
		WHEN MONTH(VisitDate) BETWEEN 4 AND 6 THEN 'Q2'
		WHEN MONTH(VisitDate) BETWEEN 7 AND 9 THEN 'Q3'
		WHEN MONTH(VisitDate) BETWEEN 10 AND 12 THEN 'Q4'
	END AS Quarterly,*/
	CONCAT('Q', DATEPART(QUARTER, VisitDate), '-', YEAR(VisitDate)) AS QuarterlyYear,
	CONCAT('Q', DATEPART(QUARTER, VisitDate)) AS Quarterly

FROM 
	MuseumVisits
--GROUP BY ExhibitID, ExhibitName, Quarterly
--ORDER BY TotalVisitor ASC

WITH VisitorQuaterlyColumn AS (
	SELECT *,
		CONCAT('Q', DATEPART(QUARTER, VisitDate), '-', YEAR(VisitDate)) AS QuarterlyYear,
		CONCAT('Q', DATEPART(QUARTER, VisitDate)) AS Quarterly,
		YEAR(VisitDate) AS VisitYear

	FROM 
		MuseumVisits
),
VisitorCountColumn AS(
	SELECT  
		*,
		COUNT(ExhibitID) OVER(PARTITION BY QuarterlyYear) AS QuaterlyCount
	FROM 
		VisitorQuaterlyColumn
)
SELECT 
	ExhibitID, 
	ExhibitName,
	QuaterlyCount,
	QuarterlyYear,
	Quarterly,
	VisitYear
FROM VisitorCountColumn
WHERE VisitYear = 2025 
GROUP BY 
	ExhibitID, 
	ExhibitName,
	QuaterlyCount,
	QuarterlyYear,
	Quarterly,
	VisitYear
ORDER BY
	QuaterlyCount, Quarterly;

----------------------------------------------------------------------------------
-- 16. Find cumulative sales per customer
SELECT 
	*
FROM
	Orders;
SELECT 
	CustomerID,
	OrderDate,
	SUM(TotalAmount) OVER (PARTITION BY CustomerID ORDER BY OrderDate) AS CumulativeSales
FROM
	Orders;

-- 17. Rank top customers by sales
SELECT 
	CustomerID,
	SUM(TotalAmount) AS TotalSales,
	RANK() OVER(ORDER BY SUM(TotalAmount) DESC) AS SalesRank
FROM
	Orders
GROUP BY
	CustomerID;


-- 18. Get month-over-month sales growth
