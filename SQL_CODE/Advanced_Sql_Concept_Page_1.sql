USE WhereClause
GO

-- 1. How Do you find the last id in a SQL
SELECT * FROM Employee;
SELECT * FROM Department;
SELECT * FROM Gender;
SELECT * FROM Positions;
SELECT * FROM Projects;

SELECT MAX(ID) AS Last_Id FROM Employee;
-- This Query select the maxmimu (largest) value.  
SELECT * FROM Employee WHERE ID = (SELECT MAX(ID) AS Last_Id FROM Employee) ;

SELECT TOP 1 ID FROM Employee ORDER BY ID DESC;


-- 2. How Do you remove the duplicates from a table
-- Using DISTINCT
SELECT * FROM dbo.tblOrder;

SELECT DISTINCT * FROM dbo.tblOrder;
-- This Will retrive distinct row from the table based on all column.


-- 3. Apply join in between the table

--Inner Join
SELECT E.Name AS Employee_Name, E.EmailID AS Email, E.Salary, E.City, D.Name AS Department FROM Employee as E INNER JOIN Department as D ON  E.DepartmentID = D.ID;

--Left Join

SELECT E.Name AS Employee_Name, E.EmailID, E.Salary, D.Name AS Departmernt  FROM Employee AS E LEFT JOIN Department AS D ON E.DepartmentID = D.ID

-- Right Join

SELECT  E.Name AS Employee_Name, E.EmailID, E.Salary, D.Name AS Departmernt FROM Employee AS E RIGHT JOIN Department AS D ON E.DepartmentID = D.ID;

 -- FULL JOIN
 SELECT * FROM Employee FULL OUTER JOIN  Department ON Employee.DepartmentID = Department.ID FULL OUTER JOIN Gender ON Employee.GenderID = GenderID;
 
 SELECT DISTINCT Employee.ID, Employee.*, Department.*, Gender.* FROM Employee FULL OUTER JOIN Department ON Employee.DepartmentID = Department.ID FULL OUTER JOIN Gender ON Employee.GenderID = Gender.ID WHERE Employee.ID  IS NOT NULL AND Employee.PositionsId IS NOT NULL; 


 -- O4 What is the difference between HAVING and WHERE in SQL?
 /*
 The Group by clause is used to group rows thar have the same values in specified columns into summary rows, like categories.
 
 It is often used in conjuction with aggregate function (e.g. COUNT, SUM, AVG, MAX, MIN) to perform calculation on each group of rows

 */

 --SELECT Employee.Name AS Employee_Name, Department.Name AS Department, AVG(Employee.Salary) FROM Employee LEFT OUTER JOIN  Department ON Employee.DepartmentID = Department.ID GROUP BY Department.Name;


  SELECT Employee.DepartmentID, AVG(Salary) AS AVG_Salary FROM Employee GROUP BY DepartmentID;

-- Having Clause
-- The having clause is used to filter the result of a Group By query based on specified condition

SELECT Employee.DepartmentID, AVG(Employee.Salary) AS Avg_Salary FROM Employee GROUP BY DepartmentID HAVING AVG(Employee.Salary)>50000;


/*
5. Explain about Auto increment in SQL?

In sql the auto increment feature is often used to generate unique sequential numeric values automatically for a column.
This is tipically used for primary key column to ensure each row has a unic identifier.

*/
CREATE TABLE test_example_table(
	Id INT CONSTRAINT test_exTb_pk PRIMARY KEY IDENTITY(1,1),
	TName VARCHAR(30)
)

INSERT INTO test_example_table (TName) 
	VALUES ('John Doe'),
		('Jane Smith'),
		('Chris Johnson');

SELECT * FROM test_example_table;

CREATE TABLE test_example_job_table(
	jobId INT CONSTRAINT job_pk PRIMARY KEY IDENTITY(1,1),
	jobName VARCHAR(30)
)

INSERT INTO test_example_job_table(jobName) 
	VALUES('Manager'),
('Senior Developer'),
('HR Specialist'),
('Finance Analyst'),
('Team Lead'),
('Marketing Head'),
('Sales Manager');

SELECT * FROM test_example_job_table;

/*
Explain about the set operator in sql.
In SQL provides several set operators that allow you to combine the result of multiple queries or tables. the main set operators include UNION, UNION ALL, INTERSECT, and MINUS(EXCEPT in some database system)

*/
--UNION: Union and Union all operator combines the result set of two or more select statement . How ever it's does not remove duplicate rows it's include all row from each query.

SELECT * FROM test_example_table UNION SELECT * FROM test_example_job_table;
SELECT * FROM test_example_table UNION ALL SELECT * FROM test_example_job_table;

-- INTERSECT : The INTERSECT operator is used to retrive the common row that apper in both result set of two SELECT statement.
SELECT * FROM test_example_job_table 
INTERSECT SELECT * FROM test_example_table;

SELECT * FROM Employee WHERE Salary= (SELECT MAX(Salary) FROM Employee) 
/*
7. Give SQL query to retrive nth record from an employee table.

*/
-- Method 1 - Using LIMIT and OFFSET
SELECT * FROM Employee ORDER BY Salary DESC OFFSET 2 ROWS FETCH NEXT 1 ROWS ONLY; 
-- ORDER BY It is specified the column based order
-- OFFSET <Number of Row> ROW: It is skip the number of rows so starting point is your requried row.
-- FETCH NEXT 1 ROWS Only: It retrives the next 1 row after the offset.

-- Method 2 - Using Row number
SELECT * FROM (SELECT *, ROW_NUMBER() OVER (ORDER BY Salary DESC) AS RowNum FROM Employee) AS SUB WHERE RowNum = 3

-- Method 3 - Using Row number
WITH RankedSalary AS(SELECT *, ROW_NUMBER() OVER (ORDER BY Salary DESC) AS rnk FROM Employee)
SELECT * FROM RankedSalary WHERE rnk = 3

WITH cte AS (SELECT Employee.ID, Employee.Name, ROW_NUMBER() OVER(PARTITION BY Employee.ID, Employee.Name ORDER BY Employee.ID) AS row_num FROM Employee )
SELECT * FROM cte Where row_num = 1;
 
--SELECT ID, Name, Salary FROM cte WHERE row_num = 1;


SELECT * FROM Employee ORDER BY ID OFFSET 8 ROWS FETCH NEXT 1 ROWS ONLY;
SELECT * FROM Employee ORDER BY ID OFFSET 8 ROWS FETCH NEXT 1 ROWS ONLY;

SELECT * FROM Employee ORDER BY Salary DESC OFFSET 2 ROWS FETCH NEXT 1 ROWS ONLY;

SELECT ID, Name, Salary FROM ( SELECT *, DENSE_RANK() OVER (ORDER BY Salary DESC) as rank FROM Employee) WHERE rank = 3;

SELECT * FROM Employee WHERE Salary= (SELECT MAX(Salary) FROM Employee) ORDER BY  Salary OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY

-- 8. Explain how to get unique records without using the DISTINCT keyword.


-- 9. How to select all even or all odd records in a table ? 

-- All even 
SELECT * FROM Employee WHERE ID %2 = 0;

-- Odd even
SELECT * FROM Employee WHERE ID %2  != 0;
--or--
SELECT * FROM Employee WHERE ID % 2 <> 0 ;

-- 11. Explain about non clusterd index?
CREATE NONCLUSTERED INDEX NIX_Name ON Employee (Name ASC)


SELECT City, COUNT(*) AS City_Emp_COUNT FROM Employee  WHERE City IN ('New York', 'BANGALORE') GROUP BY City



CREATE TABLE InputData(
	Date DATE,
	Customer VARCHAR(10),
	Price INT
)

INSERT INTO InputData(Date, Customer, Price) VALUES
('2023-01-01', 'C1', 20),
('2023-01-01', 'C2', 20),
('2023-01-02', 'C2', 50),
('2023-01-02', 'C3', 12),
('2023-01-03', 'C4', 20),
('2023-01-03', 'C5', 100),
('2023-01-03', 'C1', 123);


WITH FirstOccurrence AS (
    SELECT 
        Date,
        Customer,
        Price,
        ROW_NUMBER() OVER (PARTITION BY Customer ORDER BY Date) AS rn
    FROM InputData
)
SELECT 
    Date,
    COUNT(*) AS Price_Count
FROM FirstOccurrence
WHERE rn = 1  -- Only include the first occurrence of each customer
GROUP BY Date
ORDER BY Date;

/*
OUT PUT
Date	Price_Count
1/1/2023	2
1/2/2023	1
1/3/2023	2


*/


SELECT DISTINCT(Customer) FROM InputData

SELECT Date, Count(DISTINCT(Customer)) AS Price_Count FROM InputData GROUP BY Date

SELECT * FROM InputData;
SELECT Date, COUNT(DISTINCT Customer) AS Price_Coun 
FROM InputData
GROUP BY Date
ORDER BY Date;



CREATE TABLE A(
col1 VARCHAR(5)
)

CREATE TABLE B(
col1 VARCHAR(5)
)

INSERT INTO A (Col1) VALUES 
(1), (1), (NULL);

INSERT INTO B (Col1) VALUES
(1),(1),(1),(null),('')                                                                                                        

DROP TABLE A;
DROP TABLE B;

SELECT * FROM A;
SELECT * FROM B;

SELECT A.Col1 AS Col_A, B.Col1 AS Col_B FROM A INNER JOIN B ON A.Col1 = B.Col1;
SELECT A.Col1 AS A_Col1, B.Col1 AS B_Col1 FROM A LEFT JOIN B ON A.Col1 = B.Col1;

SELECT A.Col1 AS A_Col1, B.Col1 AS B_Col1 FROM A RIGHT JOIN B ON A.Col1 = B.Col1;

SELECT A.Col1 AS A_Col1, B.Col1 AS B_Col1 FROM A FULL OUTER JOIN B ON A.Col1 = B.Col1;

SELECT TOP 3  * FROM Employee ORDER BY Salary DESC;

-- second_Highest_Salary
SELECT  MAX(Salary) AS second_Highest_Salary FROM Employee WHERE Salary < (SELECT MAX(Salary) FROM Employee); 

-- Third_Highest_Salary
SELECT  
	MAX(Salary) AS Third_Highest_Salary 
FROM 
	Employee 
WHERE 
	Salary < (
		SELECT 
			MAX(Salary) 
		FROM 
			Employee 
		WHERE Salary < (
			SELECT 
			MAX(Salary) 
		FROM 
			Employee
		)
	); 


SELECT  DISTINCT Salary  FROM Employee ORDER BY Salary DESC OFFSET 3 ROWS FETCH NEXT 1 ROWS ONLY;