USE WhereClause
GO

/*
OVER Clause in SQL Server
The OVER clause in SQL Server is used with window functions to perform calculations across a specific set of rows related to the current row. Unlike aggregate functions (which collapse multiple rows into one), the OVER clause allows functions to retain individual row values while computing aggregates like running totals, rankings, or moving averages.

Syntax: 
function_name() OVER (
    [PARTITION BY column_name]
    [ORDER BY column_name]
)

PARTITION BY (Optional) → Divides the result set into partitions (groups) for calculations.
ORDER BY (Optional) → Defines the order of rows within each partition.

*/

SELECT * FROM Department;

SELECT * FROM Employee;

SELECT DepartmentID, D.Name, COUNT(*) No_Employee, SUM(Salary) AS Total_Salary, AVG(Salary) AS AvgSalary, MIN(Salary) AS Min_Salary, MAX(Salary) AS Max_Salary FROM Employee LEFT JOIN Department AS D ON D.ID = Employee.DepartmentID  GROUP BY Employee.DepartmentID, D.Name ORDER BY DepartmentID ASC ;

-- Using the over clause with PARTITION by clause
SELECT 
	E.Name, 
	E.Salary, 
	E.DepartmentID,
	D.Name AS DepartName,

	COUNT(E.DepartmentID) OVER(PARTITION BY E.DepartmentID) AS DepartmentTotal,
	SUM(E.Salary) OVER(PARTITION BY E.DepartmentID) AS TotalSalary,
	AVG(E.Salary) OVER(PARTITION BY E.DepartmentID) ASAvgSalary,
	MIN(E.Salary) OVER(PARTITION BY E.DepartmentID) AS MinSalary,
	MAX(E.Salary)OVER(PARTITION BY E.DepartmentID) AS MaxSalary	
	FROM Employee AS E
	INNER JOIN Department AS D
	ON E.DepartmentID = D.ID
	ORDER BY E.DepartmentID
