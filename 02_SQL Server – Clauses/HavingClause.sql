USE WhereClause;


-- HAVING Clause and its Need
-- The HAVING clause is used in SQL to filter records based on aggregated data. Unlike the WHERE clause, which filters rows before grouping, the HAVING clause filters groups of data after aggregation (e.g., SUM, COUNT, MIN, MAX, AVG).

-- Need for HAVING Clause: When working with aggregated data in SQL queries (using GROUP BY), you can't use the WHERE clause to filter aggregated results. The HAVING clause fills this gap by allowing conditions on aggregate functions.

-- Parameters or Arguments of the HAVING Clause
-- Aggregate Functions: Conditions in the HAVING clause often involve aggregate functions like SUM(), COUNT(), AVG(), MIN(), and MAX().

-- Conditions: The HAVING clause can use comparison operators (=, <, >, >=, <=, !=) and logical operators (AND, OR, NOT) to define filtering rules.

-- Column/Expressions: You can use columns or expressions that appear in the SELECT statement, provided they are part of the grouped or aggregated results.

-- SELECT column_name, aggregate_function(column_name)
-- FROM table_name
-- GROUP BY column_name
-- HAVING condition;

SELECT * FROM Employee;

--Filtering rows using WHERE clause
SELECT City, Sum(Salary) AS Total_Salary FROM Employee WHERE City = 'MUMBAI' GROUP BY City;

--Filtering groups using the HAVING clause, after all, aggregations take place.
SELECT City, SUM(Salary) AS Total_Salary FROM Employee GROUP BY City HAVING City = 'MUMBAI';

-- Combine Where and Having
SELECT City,  SUM(Salary) AS Total_Salary FROM Employee WHERE GenderID = 1 GROUP BY City HAVING City = 'MUMBAI';
SELECT City, SUM(Salary) AS Total_Salary FROM Employee WHERE GenderID = 1 OR GenderID = 2 GROUP BY City HAVING City = 'MUMBAI';

-- Having Clause Using SUM Function
SELECT DepartmentID, SUM(Salary) AS Total_Salary FROM Employee GROUP BY DepartmentID HAVING SUM(Salary) > 140000; 

-- Having Clause Using COUNT Function:
SELECT City, COUNT(*) AS NumberOfEmployee FROM Employee GROUP BY City HAVING COUNT(*)>2;
--Having Clause Using MIN Function:
SELECT DepartmentID, MIN(Salary) AS LOwestSalary FROM Employee GROUP BY DepartmentID HAVING MIN(Salary)> 25000;
--Having Clause Using MAX Function:
SELECT DepartmentID, MAX(Salary) AS LOwestSalary FROM Employee GROUP BY DepartmentID HAVING MAX(Salary)> 70000;
--Having Clause Using AVG Function:
SELECT DepartmentID, AVG(Salary) AS LOwestSalary FROM Employee GROUP BY DepartmentID HAVING AVG(Salary)> 29000;
