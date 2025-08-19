USE [sql_exercise];
GO

-- Drop if already exists
IF OBJECT_ID('MangrEmployee', 'U') IS NOT NULL
    DROP TABLE MangEmployee;
GO

-- Create Employee table with self-referencing FK
CREATE TABLE MangrEmployee (
    EmplId INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    salary INT NOT NULL,
    MangrId INT NULL,
    CONSTRAINT FK_Manager FOREIGN KEY (MangrId) REFERENCES MangrEmployee(EmplId)
);
GO

-- Insert sample data
INSERT INTO MangrEmployee (EmplId, name, salary, MangrId) VALUES
(1, 'Alice',   90000, NULL),   -- CEO
(2, 'Bob',     80000, 1),      -- Reports to Alice
(3, 'Charlie', 70000, 1),      -- Reports to Alice
(4, 'David',   60000, 2),      -- Reports to Bob
(5, 'Eve',     60000, 2),      -- Reports to Bob
(6, 'Frank',   55000, 3),      -- Reports to Charlie
(7, 'Grace',   50000, 3),      -- Reports to Charlie
(8, 'Heidi',   45000, 4),      -- Reports to David
(9, 'Ivan',    65000, 5),      -- Reports to Eve
(10, 'Judy',   60000, 6);      -- Reports to Frank


SELECT * FROM MangrEmployee;
/*
Write a solution to find the employees who earn more than their managers.

Return the result table in any order.
*/
SELECT E.EmplId, E.name AS Employee_Name, E.salary AS Employee_Salary, M.EmplId As Manager_ID, M.name AS Manager_name, M.salary AS Manager_Salary FROM MangrEmployee E JOIN  MangrEmployee M ON E.MangrId = M.EmplId Where E.salary > M.salary

-- Get Non Manager employee using CTE
WITH 
	ManagerTable AS (
		SELECT DISTINCT m.EmplId as ManagerId, m.name, m.salary FROM MangrEmployee as m JOIN MangrEmployee e ON m.EmplId = e.MangrId
	)
SELECT * FROM MangrEmployee WHERE  EmplId NOT IN (SELECT ManagerId FROM ManagerTable)

-- Count number of employee for each manger
SELECT MangrId,  COUNT(*) Each_Manager_Employee FROM MangrEmployee GROUP BY MangrId;