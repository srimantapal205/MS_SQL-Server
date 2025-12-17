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


/*
Nth_VALUE() WINDOW FUNCTION:
The NTH_VALUE() window function allows you to retrieve the value from a specific row, based on its position, within a window or partition. It is useful when you need to access not just the first or last value, but any specific row in the dataset.

*/

SELECT employee_id, name, sales,
NTH_VALUE(sales, 3) OVER (ORDER BY sales DESC
ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS third_highest_sale
FROM sales_data

-- get Duplicate Value
/*SELECT column1, column2, COUNT(*)
FROM table_name
GROUP BY column1, column2
HAVING COUNT(*) > 1;*/

-- Remove the duplicate Value
WITH removeDuplicate AS (
SELECT * , ROW_NUMBER() OVER(PARTITION BY NAME ORDER BY ID) AS rn FROM Employee
)
DELETE FROM remveDuplicate WHERE rn>1

/*
# Define window partition
window_spec = Window.partitionBy("id").orderBy(df["timestamp_column"].desc())

# Add row number
df_with_row = df.withColumn("row_num", row_number().over(window_spec))

# Keep only first row (latest record per id)
latest_df = df_with_row.filter("row_num = 1").drop("row_num")



window_spec = Window.partitionBy("id").orderBy(df["last_updated"].desc())
df = df.withColumn("row_num", row_number().over(window_spec))
df = df.filter("row_num = 1").drop("row_num")


USE [sql_exercise]
GO

SELECT * FROM Employee
SELECT * FROM Employees
SELECT * FROM employees_table
*/

SELECT * FROM Employee

SELECT 
	ID, 
	Name, 
	Salary,
	AVG(Salary) OVER(PARTITION BY DepartmentID) AS AVG_Salay_Dept_Wise
FROM 
	Employee


SELECT 
	ID,
	Name,
	Salary,
	MIN(Salary) OVER(PARTITION BY DepartmentID) AS Min_Salary_By_dept_wise,
	MAX(Salary) OVER(PARTITION BY DepartmentID) AS Max_Salary_By_depet_Wise
FROM
	Employee

SELECT 
	ID,
	Name,
	Salary,
	DepartmentID,
	AVG(Salary) OVER(PARTITION BY DepartmentID) AS AVG_Salay_Dept_Wise,
	MIN(Salary) OVER(PARTITION BY DepartmentID) AS Min_Salary_By_dept_wise,
	MAX(Salary) OVER(PARTITION BY DepartmentID) AS Max_Salary_By_depet_Wise
FROM
	Employee 

SELECT COUNT(*) FROM Employee;
SELECT DISTINCT( DepartmentID), COUNT(*) OVER(PARTITION BY DepartmentID) AS Depart_Wise_Emp  FROM Employee;


SELECT 
	ID, 
	Name, 
	DepartmentID, 
	Salary, 
ROW_NUMBER() OVER(PARTITION BY DepartmentID ORDER BY Salary) AS RowNumber FROM Employee


SELECT 
	ID, 
	DepartmentID, 
	Salary, 
	RANK() OVER(PARTITION BY DepartmentID ORDER BY Salary ) AS Rank_No_RANK,
	DENSE_RANK() OVER(PARTITION BY DepartmentID ORDER BY Salary) AS Rank_No_DenseRank
FROM 
	Employee


USE sql_exercise
GO

SELECT * FROM Employees
SELECT * FROM employee_salaries
SELECT * FROM employees_table


SELECT DISTINCT(Name) FROM Employee


CREATE TABLE EmployeeSalary (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),         -- Unique ID for each employee
    FirstName NVARCHAR(50) NOT NULL,                  -- Employee first name
    LastName NVARCHAR(50) NOT NULL,                   -- Employee last name
    Department NVARCHAR(50) NOT NULL,                 -- Department name
    Designation NVARCHAR(50) NOT NULL,                 -- Role/Title
    Salary DECIMAL(10, 2) NOT NULL,                   -- Monthly salary
    Bonus DECIMAL(10, 2) NULL,                        -- Optional bonus
    SalaryMonth DATE NOT NULL,                        -- Salary payment month (1st of month)
    PaymentDate DATETIME NOT NULL DEFAULT GETDATE(),  -- Actual payment date/time
    Status NVARCHAR(20) NOT NULL CHECK (Status IN ('Paid', 'Pending', 'On Hold')) -- Payment status
);


INSERT INTO EmployeeSalary (FirstName, LastName, Department, Designation, Salary, Bonus, SalaryMonth, PaymentDate, Status)
VALUES
('John', 'Doe', 'IT', 'Software Engineer', 70000, 5000, '2025-01-01', '2025-01-05', 'Paid'),
('Jane', 'Smith', 'HR', 'HR Manager', 65000, NULL, '2025-01-01', '2025-01-06', 'Paid'),
('Michael', 'Brown', 'Finance', 'Accountant', 55000, 3000, '2025-02-01', '2025-02-05', 'Paid'),
('Emma', 'Wilson', 'IT', 'Data Engineer', 80000, 10000, '2025-02-01', '2025-02-04', 'Paid'),
('Liam', 'Taylor', 'Sales', 'Sales Executive', 45000, 2000, '2025-02-01', '2025-02-07', 'Pending'),
('Sophia', 'Johnson', 'Finance', 'Financial Analyst', 60000, NULL, '2025-03-01', '2025-03-05', 'Paid'),
('Noah', 'Anderson', 'IT', 'DevOps Engineer', 75000, 8000, '2025-03-01', '2025-03-06', 'On Hold'),
('Olivia', 'Thomas', 'Sales', 'Sales Manager', 90000, 12000, '2025-03-01', '2025-03-05', 'Paid');


SELECT * FROM EmployeeSalary;


SELECT 
	SalaryMonth, 
	Salary,
	LAG(Salary) OVER(ORDER BY SalaryMonth) AS Previous_Month_Salary, -- LAG() function allows you to get the data from the following Previous row 
	LEAD(Salary) OVER(ORDER BY SalaryMonth) AS Next_Month_Salary -- LEAD() function allows you to get the data from the following next row  
FROM 
	EmployeeSalary



SELECT 
	EmployeeID, 
	(FirstName + ' ' + LastName ) AS EmployeeName, 
	Salary,
	FIRST_VALUE(Salary) OVER (ORDER BY Salary DESC) AS Highest_Salary
FROM 
	EmployeeSalary

SELECT 
	EmployeeID, 
	(FirstName + ' ' + LastName ) AS EmployeeName, 
	Salary,
	FIRST_VALUE(Salary) OVER (ORDER BY Salary DESC) AS Highest_Salary,
	LAST_VALUE (Salary) OVER (ORDER BY Salary DESC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS Last_Salary
FROM 
	EmployeeSalary

SELECT 
	EmployeeID,
	(FirstName + ' ' + LastName ) AS EmployeeName,
	Department,
	Salary, 
	MAX(Salary) OVER(PARTITION BY Department ORDER BY Department ASC ) AS Dept_By_High_Sal
FROM 
	EmployeeSalary;


WITH DisplyOnlyHighestSalaryEmploye AS (
	SELECT 
		EmployeeID,
		(FirstName + ' ' + LastName ) AS EmployeeName,
		Department,
		Salary, 
		MAX(Salary) OVER(PARTITION BY Department ORDER BY Department ASC ) AS Dept_By_High_Sal
	FROM 
		EmployeeSalary
	)
SELECT * FROM DisplyOnlyHighestSalaryEmploye WHERE Salary = Dept_By_High_Sal

SELECT * FROM Employee ORDER BY DepartmentID ASC, Salary DESC ;
WITH  RnkedBasedHighSalary AS(
	SELECT 
		ID,
		Name AS EmployeeName,
		DepartmentID,
		Salary,
		-- DENSE_RANK() OVER (ORDER BY Salary DESC) AS Rank_Number
		DENSE_RANK() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS Rank_Number

	FROM Employee
)
--SELECT * FROM RnkedBasedHighSalary  WHERE Rank_Number = 1 ORDER BY Salary DESC;
SELECT e.ID,
	e.EmployeeName, 
	e.Salary, 
	d.Name AS Department_name 
FROM RnkedBasedHighSalary AS e 
	INNER JOIN Department AS d
	ON e.DepartmentID = d.ID
WHERE Rank_Number = 1 ORDER BY Salary DESC;

SELECT * FROM [dbo].[Department];
