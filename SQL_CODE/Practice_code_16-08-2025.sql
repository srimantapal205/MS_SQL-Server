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


/*
WITH cteReports (EmployeeID, FirstName, LastName, MgrID, EmpLevel) AS (
    SELECT 
        EmployeeID, 
        FirstName, 
        LastName, 
        ManagerID, 
        1 AS EmpLevel
    FROM Employees 
    WHERE ManagerID IS NULL
    
    UNION ALL 
    
    SELECT 
        e.EmployeeID, 
        e.FirstName, 
        e.LastName, 
        e.ManagerID, 
        r.EmpLevel + 1
    FROM Employees e
    INNER JOIN cteReports r ON e.ManagerID = r.EmployeeID
)
SELECT 
    r.FirstName + ' ' + r.LastName AS FullName,
    r.EmpLevel,
    m.FirstName + ' ' + m.LastName AS Manager
FROM cteReports r
LEFT JOIN Employees m ON r.MgrID = m.EmployeeID
ORDER BY r.EmpLevel, r.MgrID;

*/

