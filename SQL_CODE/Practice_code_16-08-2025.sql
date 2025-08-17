USE [tutorial]
GO

CREATE TABLE Employees
(
  EmployeeID int,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  ManagerID int 
)


INSERT INTO Employees VALUES (1, 'Harper', 'Westbrook', NULL);
INSERT INTO Employees VALUES (2, 'Liam', 'Carrington', 1);
INSERT INTO Employees VALUES (3, 'Evelyn', 'Radcliffe', 1);
INSERT INTO Employees VALUES (4, 'Mason', 'Albright', 2);
INSERT INTO Employees VALUES (5, 'Isla', 'Whitman', 2);
INSERT INTO Employees VALUES (6, 'Noah', 'Sterling', 3);
INSERT INTO Employees VALUES (7, 'Ruby', 'Lennox', 3);
INSERT INTO Employees VALUES (8, 'Caleb', 'Winslow', 5);
INSERT INTO Employees VALUES (9, 'Avery', 'Sinclair', 6);
INSERT INTO Employees VALUES (10, 'Oliver', 'Beckett', 6);


-- The code below will generate a result containing information about an employee and his manager.
SELECT * FROM Employees;

WITH cteReports (EmployeeID, FirstName, LastName, ManagerID, EmpLevel) AS 
	(
		SELECT 
			EmployeeID, 
			FirstName, 
			LastName, 
			ManagerID, 1 
		FROM 
			Employees 
		WHERE 
			ManagerID IS NULL 
		UNION 
			ALL 
		SELECT 
			e.EmployeeID, 
			e.FirstName, 
			e.LastName, 
			e.ManagerID, 
			r.EmpLevel + 1 
		FROM 
			Employees e 
		INNER JOIN 
			cteReports r 
		ON 
			e.ManagerID = r.EmployeeID
)
SELECT 
    r.FirstName + ' ' + r.LastName AS FullName,
    r.EmpLevel,
    m.FirstName + ' ' + m.LastName AS Manager
FROM cteReports r
LEFT JOIN Employees m ON r.ManagerID = m.EmployeeID
ORDER BY r.EmpLevel, r.ManagerID;

--  CTE to generate a date dimension table:
/*
WITH dates (Date) AS (
	SELECT 
		CAST('2024-01-01' as date) AS Date, 
		DATEPART('year', cast('2024-01-01' as date)) as year, 
		DATEPART('month', cast('2024-01-01' as date)) as month
	UNION ALL
	SELECT 
		DATEADD(Date, INTERVAL 1 day), 
		date('year', date_add(Date, INTERVAL 1 day)) AS year,
		date_part('month', date_add(Date, INTERVAL 1 day)) AS month
	FROM dates
	WHERE Date < '2025-12-31'
)
SELECT * FROM dates
*/


WITH dates AS (
    SELECT 
        CAST('2024-01-01' AS date) AS DateVal,
        DATEPART(YEAR, CAST('2024-01-01' AS date)) AS YearVal,
        DATEPART(MONTH, CAST('2024-01-01' AS date)) AS MonthVal
    UNION ALL
    SELECT 
        DATEADD(DAY, 1, DateVal),
        DATEPART(YEAR, DATEADD(DAY, 1, DateVal)),
        DATEPART(MONTH, DATEADD(DAY, 1, DateVal))
    FROM dates
    WHERE DateVal < '2025-12-31'
)
SELECT *
FROM dates
OPTION (MAXRECURSION 0);  -- needed to go beyond 100 recursion limit

