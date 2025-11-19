USE [CommonPracticDB];
GO

CREATE TABLE Employees (
    Emp_ID   INT PRIMARY KEY,
    Emp_Name VARCHAR(100),
    Mang_ID  INT NULL   -- Manager ID (foreign key to Emp_ID)
);


INSERT INTO Employees VALUES
(1, 'CEO',        NULL),    -- Top-level
(2, 'Director A', 1),
(3, 'Director B', 1),

(4, 'Manager A1', 2),
(5, 'Manager A2', 2),

(6, 'Lead A1_1', 4),
(7, 'Lead A1_2', 4),

(8, 'Manager B1', 3),
(9, 'Engineer B1_1', 8),
(10,'Engineer B1_2', 8);


SELECT * FROM Employees;


/*
CEO
 ├── Director A
 │      ├── Manager A1
 │      │       ├── Lead A1_1
 │      │       └── Lead A1_2
 │      └── Manager A2
 └── Director B
        └── Manager B1
                ├── Engineer B1_1
                └── Engineer B1_2

*/


-- Query: Full Employee Hierarchy (Recursive CTE)

WITH EmpHierarchy AS (
    SELECT 
        Emp_ID,
        Emp_Name,
        Mang_ID,
        0 AS Level
    FROM 
        Employees
    WHERE Mang_ID IS NULL -- Top Boss (CEO)

    UNION ALL

    SELECT 
        e.Emp_ID,
        e.Emp_Name,
        e.Mang_ID,
        eh.Level + 1
    FROM 
        Employees e
    INNER JOIN
        EmpHierarchy eh
    ON
        e.Mang_ID = eh.Emp_ID
)
SELECT * FROM EmpHierarchy ORDER BY Level, Mang_ID;


-- Query: Get Hierarchy for a Specific Employee (Input Parameter)

DECLARE @Emp_id INT = 1;

WITH EmpHierarchy_v2 AS (
    SELECT 
        Emp_ID,
        Emp_Name,
        Mang_ID,
        0 As Level
    FROM 
        Employees
    WHERE Emp_ID = @Emp_id

    UNION ALL

    SELECT
        e.Emp_ID,
        e.Emp_Name,
        e.Mang_ID,
        eh.Level + 1
    FROM
       Employees e
    INNER JOIN
        EmpHierarchy_v2 eh
    ON
        e.Mang_ID = eh.Emp_ID
)
SELECT * FROM EmpHierarchy_v2



-- Show Reporting Chain (Upwards)
DECLARE @EmpID INT = 9;

WITH ReportingChain AS (
    SELECT 
        Emp_ID,
        Emp_Name,
        Mang_ID
    FROM 
        Employees
    WHERE Emp_ID = @EmpID

    UNION ALL

    SELECT
        e.Emp_ID,
        e.Emp_Name,
        e.Mang_ID
    FROM 
        Employees e
    INNER JOIN
        ReportingChain rc
    ON
        e.Emp_ID = rc.Mang_ID
)
SELECT * FROM ReportingChain;


