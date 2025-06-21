USE WhereClause
GO

SELECT * FROM Employee
-- AVG() Window Function

SELECT ID, 
	Name, 
	Salary,
	DepartmentID,
	AVG(Salary) OVER(PARTITION BY  DepartmentID) AS Avg_Dept_Salary
FROM Employee ORDER BY DepartmentID

-- MIN() and MAX() WINDOW FUNCTION

SELECT ID, 
	NAME,
	DepartmentID,
	Salary,
	MIN(Salary) OVER (PARTITION BY DepartmentID) AS MIN_Dept_Salary,
	MAX(Salary) OVER (PARTITION BY DepartmentID) AS MAX_Dept_Salary
FROM Employee 
	ORDER BY DepartmentID;

SELECT
    DepartmentID,
    MIN(Salary) AS MIN_Dept_Salary,
    MAX(Salary) AS MAX_Dept_Salary
FROM Employee
GROUP BY DepartmentID;

-- COUNT() WINDOW FUNCTION:
SELECT COUNT(*) FROM Employee;
SELECT ID, 
	NAME,
	DepartmentID,
	Salary,
	COUNT(*) OVER(PARTITION BY DepartmentId) AS COUNT_Dept
FROM Employee;

--ROW_NUMBER() WINDOW FUNCTION

SELECT ID, 
	NAME,
	DepartmentID,
	Salary,
	ROW_NUMBER() OVER(PARTITION BY DepartmentID ORDER BY Salary) AS ROW_ID_NUMBER
FROM Employee;

-- RANK() WINDOW FUNCTION:

SELECT ID, 
	NAME,
	DepartmentID,
	Salary,
	RANK() OVER (PARTITION BY DepartmentId ORDER BY Salary) AS rnk_salary
FROM Employee

-- DENSE_RANK() WINDOW FUNCTION:

SELECT ID, 
	NAME,
	DepartmentID,
	Salary,
	RANK() OVER(PARTITION BY DepartmentId ORDER BY Salary) AS rnk_salary,
	DENSE_RANK() OVER(PARTITION BY DepartmentId ORDER BY Salary) AS DENSE_RANK_Emp
FROM Employee

WITH RNKD_Salary AS (
SELECT ID, 
	NAME,
	DepartmentID,
	Salary,
	RANK() OVER(PARTITION BY DepartmentId ORDER BY Salary) AS rnk_salary,
	DENSE_RANK() OVER( ORDER BY Salary DESC) AS DENSE_RANK_Emp
FROM Employee
)
SELECT * FROM RNKD_Salary WHERE DENSE_RANK_Emp = 3

WITH RankedSalaries AS(
	SELECT Salary, DENSE_RANK() OVER (ORDER BY Salary DESC) AS rnk FROM Employee 
)
SELECT Salary FROM RankedSalaries WHERE rnk = 2

-- GET Duplicate Value
SELECT
    Name,
    DepartmentID,
    Salary,
    COUNT(*) AS duplicate_count
FROM Employee
GROUP BY
    Name,
    DepartmentID,
    Salary
HAVING COUNT(*) > 1;



-- 

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    CustomerID INT,
    TransactionDate DATE,
    Amount DECIMAL(10, 2)
);
INSERT INTO Transactions (TransactionID, CustomerID, TransactionDate, Amount) VALUES
(101, 1, '2024-09-25', 500),
(102, 1, '2024-09-20', 200),
(103, 2, '2024-09-21', 700),
(104, 2, '2024-09-19', 100),
(105, 1, '2024-09-22', 300);

SELECT * FROM Transactions ORDER BY TransactionDate DESC;

-- You have a table of sales transactions, and you want to assign a unique row number to each transaction per customer, ordered by the date of the transaction (newest first).

SELECT 
	TransactionID, 
	CustomerID, 
	TransactionDate, 
	Amount,
	ROW_NUMBER() OVER(PARTITION BY CustomerID ORDER BY TransactionDate DESC) AS rn_code
FROM Transactions --The ROW_NUMBER() function is used to assign a unique row number to each sales transaction, partitioned by the CustomerID.

-- PERCENT_RANK() Works:
/*The PERCENT_RANK() window function calculates the relative rank of a row as a percentage between 0 and 1 within its result set or partition. It is used to find the percentile ranking of a row compared to other rows.*/

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    Score INT
);

INSERT INTO Students (StudentID, StudentName, Score) VALUES
(1, 'Alice', 85),
(2, 'Bob', 95),
(3, 'Charlie', 85),
(4, 'David', 70),
(5, 'Eve', 90),
(6, 'Frank', 75);

SELECT StudentID, StudentName, Score FROM Students;


SELECT 
	StudentID, 
	StudentName, 
	Score, 
	PERCENT_RANK() OVER(ORDER BY Score DESC) AS Percent_rank 
FROM Students;


/*NTILE() WINDOW FUNCTION:
The NTILE() window function divides rows into a specified number of roughly equal-sized groups or buckets, assigning each row a "bucket number." This is useful for distributing data evenly into groups, like quartiles or percentiles.*/


SELECT 
	StudentID, 
	StudentName, 
	Score, 
	NTILE(3) OVER(ORDER BY Score DESC) AS grade_group
FROM Students;
-------------------------------------------------------
CREATE TABLE Deptdf (
    deptid INT PRIMARY KEY,
    deptname VARCHAR(100)
);
INSERT INTO Deptdf (deptid, deptname) VALUES
(1, 'Sales'),
(2, 'Engineering'),
(3, 'HR');

CREATE TABLE Empdf (
    empid INT PRIMARY KEY,
    empname VARCHAR(100),
    gender VARCHAR(10),
    salary DECIMAL(10, 2),
    deptid INT,
    FOREIGN KEY (deptid) REFERENCES Deptdf(deptid)
);

INSERT INTO Empdf (empid, empname, gender, salary, deptid) VALUES
(101, 'Alice', 'F', 60000, 2),
(102, 'Bob', 'M', 55000, 1),
(103, 'Charlie', 'M', 62000, 2),
(104, 'Diana', 'F', 50000, 3),
(105, 'Eve', 'F', 70000, 2);



SELECT * FROM Empdf e INNER JOIN Deptdf d ON e.deptid = d.deptid

SELECT d.deptname, e.salary FROM Empdf e INNER JOIN Deptdf d ON e.deptid = d.deptid  WHERE e.salary = (SELECT  MAX(salary) FROM Empdf)

WITH CombineTable AS (SELECT empid, empname, gender, salary, deptname, d.deptid FROM Empdf e INNER JOIN Deptdf d ON e.deptid = d.deptid)
SELECT  
	deptname, 
	MAX(salary) AS Max_Salary 
FROM CombineTable GROUP BY deptname




