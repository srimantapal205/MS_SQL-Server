USE WhereClause;
-- The ORDER BY clause in SQL Server is used to sort the rows of a result set based on one or more columns. By default, the sorting is in ascending order, but you can specify descending order if required.

-- SELECT column1, column2, ...
-- FROM table_name
-- ORDER BY column1 [ASC|DESC], column2 [ASC|DESC], ...;

-- Parameters or Arguments Used with ORDER BY Clause
-- Column Name or Alias: Specify the column(s) or column aliases to sort by.
-- Sort Order:
-- ASC (Ascending): Default order.
-- DESC (Descending): Reverse order.
-- Expressions: You can use expressions (e.g., calculated columns) for sorting.
-- Relative Position: Use the column's position in the SELECT statement (e.g., ORDER BY 1 for the first column).

--  Data in Ascending and Descending Order 


--  Sort Data by Relative Position



-- Both ASC and DESC in a Single Query


-- Understanding OFFSET and FETCH in the ORDER BY Clause



SELECT * FROM Gender;


INSERT INTO Employee VALUES('PRANAYA','PRANAYA@G.COM',1, 3, 25000, 30,'MUMBAI')
INSERT INTO Employee VALUES('TARUN','TARUN@G.COM',1, 2, 30000, 27,'ODISHA')
INSERT INTO Employee VALUES('PRIYANKA','PRIYANKA@G.COM',2, 3, 27000, 25,'BANGALORE')
INSERT INTO Employee VALUES('PREETY','PREETY@G.COM',2, 1, 35000, 26,'BANGALORE')
INSERT INTO Employee VALUES('RAMESH','RAMESH@G.COM',1,3, 26000, 27,'MUMBAI')
INSERT INTO Employee VALUES('PRAMOD','PRAMOD@G.COM',1,1, 29000, 28,'ODISHA')
INSERT INTO Employee VALUES('ANURAG','ANURAG@G.COM',1, 2, 27000, 26,'ODISHA')
INSERT INTO Employee VALUES('HINA','HINA@G.COM',2,1, 26000, 30,'MUMBAI')
INSERT INTO Employee VALUES('SAMBIT','HINA@G.COM',1,2, 30000, 25,'ODISHA')
GO

SELECT * FROM Employee;

-- Sortind record using ASC/DESC 
SELECT * FROM Employee ORDER BY Name;

SELECT * FROM Employee ORDER BY Name ASC;

SELECT * FROM Employee ORDER BY Name DESC;

-- Sorting Descending order using order by DESC keyword
SELECT * FROM Employee WHERE GenderID = 1 ORDER BY Name;

--Sort the data by the Relative Position
SELECT Name, EmailID, Salary FROM Employee WHERE Salary>26000 ORDER BY 1 DESC; 


SELECT Name, EmailID, Salary FROM Employee WHERE Salary>26000 ORDER BY Name DESC; 

-- Use ASC and DESC in a Single Select Statement
SELECT Name, EmailID, Salary, GenderID FROM Employee WHERE Salary >50000 ORDER BY GenderID DESC, Name ASC;

--The OFFSET and FETCH Option Used in the Order By Clause 

SELECT * FROM Employee ORDER BY Name ASC OFFSET 5 ROWS;
-- 
SELECT * FROM Employee ORDER BY ID ASC OFFSET 3 ROWS FETCH NEXT 4 ROWS ONLY;

SELECT * FROM Employee ORDER BY ID ASC OFFSET 0 ROWS FETCH NEXT 4 ROWS ONLY;