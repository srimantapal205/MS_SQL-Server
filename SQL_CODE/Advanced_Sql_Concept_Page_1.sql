USE WhereClause
GO

-- 1. How Do you find the last id in a SQL
SELECT * FROM Employee;

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


 


