USE WhereClause
GO

-- What is Inner Join?
-- An Inner Join in SQL is used to retrieve records that have matching values in both tables being joined. It combines rows from two or more tables based on a related column between them. If there is no match, the rows are excluded from the result.

-- Implement Inner Join in SQL Server?
-- In SQL Server, the INNER JOIN clause is used to combine rows from multiple tables. The basic syntax is:

    -- SELECT columns
    -- FROM table1
    -- INNER JOIN table2
    -- ON table1.column = table2.column;

-- Need to Use Inner JOIN
-- Use an Inner Join:

    -- When you want to return only the rows with matching data between two or more tables.
    -- For scenarios like combining data from related tables in normalized databases.
    -- For filtering out unrelated records.

SELECT * FROM Employee;
SELECT * FROM Projects;
SELECT * FROM Department;
SELECT * FROM Gender;

SELECT Employee.ID AS Employee_ID, Employee.Name AS Emmployee_Name, Employee.Salary, Department.Name AS Department_Name FROM Employee INNER JOIN Department ON Employee.DepartmentID = Department.ID ;
-- Inner Joi with all column
SELECT * FROM Employee 
	INNER JOIN Department ON Employee.DepartmentID = Department.ID 
	INNER JOIN Gender ON Employee.GenderID = Gender.ID
	INNER JOIN Projects ON Projects.EmployeeId = Employee.ID;

--Inner join with Selective column
SELECT e.Name, e.EmailID, e.Salary, e.City, g.Gender, d.Name, p.Title, p.StartDate, p.EndDate FROM Employee AS e
	INNER JOIN Department AS d ON e.DepartmentID = d.ID 
	INNER JOIN Gender AS g ON e.GenderID = g.ID
	INNER JOIN Projects AS P ON e.ID= p.EmployeeId;

-- Inner join selective column with where clause
SELECT e.Name, e.EmailID, e.Salary, e.City, g.Gender, d.Name, p.Title, p.StartDate, p.EndDate FROM Employee AS e
	INNER JOIN Department AS d ON e.DepartmentID = d.ID 
	INNER JOIN Gender AS g ON e.GenderID = g.ID
	INNER JOIN Projects AS P ON e.ID= p.EmployeeId WHERE e.City='Chicago';

--Inner join And Left Join with Selective column
SELECT e.Name, e.EmailID, e.Salary, e.City, g.Gender, d.Name, p.Title, p.StartDate, p.EndDate FROM Employee AS e
	INNER JOIN Department AS d ON e.DepartmentID = d.ID 
	INNER JOIN Gender AS g ON e.GenderID = g.ID
	LEFT JOIN Projects AS P ON e.ID= p.EmployeeId;