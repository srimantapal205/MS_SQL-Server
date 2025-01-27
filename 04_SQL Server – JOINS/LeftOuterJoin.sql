/*
What is Left Outer Join?
A Left Outer Join (commonly referred to as just Left Join) in SQL Server retrieves all records from the left table (the table mentioned first) and the matching records from the right table. If there is no match in the right table, the result will include NULL values for the right table's columns.

Syntax for Left Outer Join

SELECT columns
FROM table1
LEFT JOIN table2
ON table1.column = table2.column;


When to Use Left Outer Join?
You should use a Left Join:

+ When you need all rows from the left table, regardless of whether there is a matching record in the right table.
+ For scenarios like finding unmatched records (e.g., customers without orders).


*/

------
USE WhereClause
GO

SELECT * FROM Employee;
SELECT * FROM Projects;
SELECT * FROM Department;
SELECT * FROM Gender;

-- JOIN two table using left table.
SELECT * FROM Employee LEFT JOIN Projects ON Projects.EmployeeId = Employee.ID;

-- Left Join selective column 
SELECT e.Name AS Employee_Name, e.EmailID, e.Salary, p.Title AS Project_Name FROM Employee AS e
	LEFT JOIN Projects AS p ON e.ID = p.EmployeeId;

-- LEFT JOIN on Multiple Table
SELECT e.Name AS Employee_Name, e.EmailID, e.City, p.title AS Project_Name, d.Name AS Department_Name FROM Employee AS e 
LEFT JOIN Projects as P ON e.ID = p.EmployeeId 
LEFT JOIN Department AS d ON d.ID = e.DepartmentID ;

-- LEFT JOIN on Multiple Table with IS NOT NULL operator
SELECT e.Name AS Employee_Name, e.EmailID, e.City, p.title AS Project_Name, d.Name AS Department_Name FROM Employee AS e 
LEFT JOIN Projects as P ON e.ID = p.EmployeeId 
LEFT JOIN Department AS d ON d.ID = e.DepartmentID WHERE p.Title IS NOT NULL;


-- LEFT JOIN on Multiple Table with IS  NULL operator
SELECT e.ID AS Employee_ID, e.Name AS Employee_Name, e.EmailID, e.City, p.title AS Project_Name, d.Name AS Department_Name FROM Employee AS e 
LEFT JOIN Projects as P ON e.ID = p.EmployeeId 
LEFT JOIN Department AS d ON d.ID = e.DepartmentID WHERE p.Title IS  NULL;