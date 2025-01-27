/*
What is Right Outer Join?
A Right Outer Join (commonly referred to as Right Join) in SQL Server retrieves all records from the right table (the table mentioned second) and the matching records from the left table. If there is no match in the left table, the result will include NULL values for the left table's columns.

Syntax for Right Outer Join in SQL Server

SELECT columns
FROM table1
RIGHT JOIN table2
ON table1.column = table2.column;

When to Use Right Outer Join?
Use a Right Join:

When you need all rows from the right table, regardless of whether there is a match in the left table.
To find unmatched records from the left table in relation to the right table.

*/

USE WhereClause
GO

SELECT * FROM Employee;
SELECT * FROM Projects;
SELECT * FROM Department;
SELECT * FROM Gender;


----------------
--Right JOIN With single Table
SELECT * FROM Employee RIGHT JOIN Projects ON Employee.ID = Projects.EmployeeId;
SELECT * FROM Employee RIGHT JOIN Department ON  Department.ID = Employee.DepartmentID;

--- Right join with Multipe join
SELECT e.Name AS Employee_Name, e.EmailID, e.Salary, e.City, p.Title, d.Name,g.Gender FROM Employee AS e
RIGHT JOIN Projects AS p ON p.EmployeeId = e.ID
RIGHT JOIN Department AS d ON d.ID = e.DepartmentID
RIGHT JOIN Gender AS g ON g.ID = e.GenderID;


--- Right join with Multipe join AND Using There Inner Join and Left join without null value
SELECT e.Name AS Employee_Name, e.EmailID, e.Salary, e.City, p.Title AS Project, d.Name,g.Gender FROM Employee AS e
INNER JOIN Projects AS p ON p.EmployeeId = e.ID
RIGHT JOIN Department AS d ON d.ID = e.DepartmentID
LEFT JOIN Gender AS g ON g.ID = e.GenderID 
WHERE p.Title IS NOT NULL;

--- Right join with Multipe join AND Using There Inner Join and Left join get only  null value
SELECT e.Name AS Employee_Name, e.EmailID, e.Salary, e.City, p.Title AS Project, d.Name,g.Gender FROM Employee AS e
INNER JOIN Projects AS p ON p.EmployeeId = e.ID
RIGHT JOIN Department AS d ON d.ID = e.DepartmentID
LEFT JOIN Gender AS g ON g.ID = e.GenderID 
WHERE p.Title IS  NULL;


