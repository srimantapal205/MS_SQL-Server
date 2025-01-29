/*
What is Full Outer Join?
A Full Outer Join in SQL Server combines the results of both Left Outer Join and Right Outer Join. It retrieves:

    All records from the left table.
    All records from the right table.
    Matching records from both tables.
    Non-matching records from both tables, with NULL values in columns where no match is found.
Syntax for Full Outer Join in SQL Server

    SELECT columns
    FROM table1
    FULL OUTER JOIN table2
    ON table1.column = table2.column;

When to Use Full Outer Join?
Use a Full Outer Join:

    When you need to retrieve all records from both tables, regardless of whether they match.
    For scenarios like comparing datasets to identify differences and similarities.

*/


USE WhereClause
GO

SELECT * FROM Employee;
SELECT * FROM Projects;
SELECT * FROM Department;
SELECT * FROM Gender;

SELECT * From Employee FULL JOIN Projects ON Projects.EmployeeId = Employee.ID;
SELECT * From Employee FULL JOIN Projects ON Projects.EmployeeId = Employee.ID WHERE Projects.EmployeeId IS NOT NULL;
SELECT * From Employee FULL JOIN Projects ON Projects.EmployeeId = Employee.ID WHERE Projects.EmployeeId IS NULL;

-- Use full join on all table
SELECT * FROM Employee 
	FULL JOIN Projects ON Projects.EmployeeId = Employee.ID
	FULL JOIN Department ON Employee.DepartmentID = Department.ID
	FULL JOIN Gender ON Employee.GenderID = Gender.ID

-- Use full join with all other join
SELECT * FROM Employee
	FULL JOIN Projects ON Projects.EmployeeId = Employee.ID
	RIGHT JOIN Gender ON Employee.GenderID = Gender.ID
	LEFT JOIN Department ON Department.ID = Employee.DepartmentID;