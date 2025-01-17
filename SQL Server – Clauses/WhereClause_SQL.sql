-- In SQL, clauses are building blocks of SQL statements that define how queries or operations should be executed. They provide instructions on selecting, filtering, grouping, or ordering data within a database.

-- Need for Clauses in SQL:
    -- Filtering Data: Narrow down query results to match specific conditions.
    -- Sorting Data: Arrange query results in a desired order.
    -- Aggregating Data: Perform calculations on grouped data.
    -- Manipulating Data: Update or delete specific rows based on conditions.


-- Different Types of Clauses in SQL 
    -- SELECT Clause: Specifies the columns to retrieve from a table.
    -- FROM Clause: Specifies the table(s) to retrieve data from.

    -- WHERE Clause: Filters records based on specific conditions.
    -- GROUP BY Clause: Groups rows with the same values in specified columns.
    -- HAVING Clause: Filters groups based on aggregate functions.
    -- ORDER BY Clause: Specifies the order of rows in the result set.
    -- Top n clause (Fetching top n records)

    -- JOIN Clause: Combines rows from multiple tables.
    -- UNION Clause: Combines results of two or more SELECT statements.

--Understanding the WHERE Clause
    -- The WHERE clause is used to filter rows in a table based on specified conditions. It evaluates each row against the condition and includes only those rows that satisfy the condition.

    -- SELECT column1, column2 FROM table_name WHERE condition;

-- It is used with SELECT, UPDATE, and DELETE statements.
-- Supports operators like =, <, >, <=, >=, <>, and logical operators like AND, OR, and NOT.
-- Supports conditions based on expressions, ranges, patterns, or NULL checks.

CREATE DATABASE WhereClause; 

USE WhereClause;
GO
CREATE TABLE Gender(
	ID INT PRIMARY KEY  IDENTITY(1,1),
	Gender VARCHAR (30)
)


Create TABLE Department(
	ID INT PRIMARY KEY IDENTITY(1,1),
	Name Varchar(60)
)

CREATE TABLE Employee(
	ID INT PRIMARY KEY IDENTITY(1,1),
	Name VARCHAR(100),
	EmailID VARCHAR(40),
	GenderID INT,
	DepartmentID INT,
	Salary INT,
	Age INT,
	City Varchar(100)
)

ALTER TABLE Employee ADD CONSTRAINT employee_genderId_fk FOREIGN KEY (GenderID) REFERENCES Gender(ID);
GO

ALTER TABLE Employee ADD CONSTRAINT employee_department_fk FOREIGN KEY (DepartmentID) REFERENCES Department(ID);
Go



-- Insert sample data into the Gender table
INSERT INTO Gender (Gender) VALUES
('Male'),
('Female'),
('Non-binary'),
('Other'),
('Prefer not to say');
-- Insert sample data into the Department table
INSERT INTO Department (Name) VALUES
('Human Resources'),
('Finance'),
('Information Technology'),
('Marketing'),
('Operations'),
('Research and Development'),
('Customer Service'),
('Sales'),
('Administration'),
('Legal');
-- Insert sample data into the Employee table
INSERT INTO Employee (Name, EmailID, GenderID, DepartmentID, Salary, Age, City) VALUES
('John Doe', 'john.doe@example.com', 1, 3, 75000, 28, 'New York'),
('Jane Smith', 'jane.smith@example.com', 2, 4, 68000, 32, 'San Francisco'),
('Alex Taylor', 'alex.taylor@example.com', 3, 5, 72000, 25, 'Los Angeles'),
('Chris Johnson', 'chris.johnson@example.com', 1, 2, 85000, 40, 'Chicago'),
('Taylor Morgan', 'taylor.morgan@example.com', 4, 1, 60000, 29, 'Austin'),
('Jordan Lee', 'jordan.lee@example.com', 3, 7, 70000, 35, 'Seattle'),
('Morgan Brown', 'morgan.brown@example.com', 2, 8, 82000, 30, 'Boston'),
('Casey White', 'casey.white@example.com', 4, 6, 90000, 27, 'Denver'),
('Jamie Fox', 'jamie.fox@example.com', 1, 3, 65000, 31, 'New York'),
('Avery Scott', 'avery.scott@example.com', 2, 5, 72000, 26, 'New York'),
('Riley Hunter', 'riley.hunter@example.com', 3, 4, 68000, 29, 'New York');

SELECT * FROM Employee;

-- Where clause with Single Condition
SELECT * FROM Employee WHERE City ='New York';

SELECT * FROM Employee WHERE Salary <= 72000;

-- Where clause using AND condition
SELECT * FROM Employee WHERE GenderID = 1 AND Salary >= 27000;

-- Using Where clause select column and USe OR condition
SELECT Name, EmailID, Salary FROM Employee WHERE GenderID = 1 OR Salary >=30000; 

-- Where clause usinf AND & OR Condition 
SELECT * FROM Employee WHERE (City = 'New York' AND GenderID = 1) OR (DepartmentID =2);

-- Using where clause with update the 

UPDATE Employee SET Salary = 72000 WHERE DepartmentID = 4;

-- Where Clause with Delete Stetement
DELETE FROM Employee WHERE City = 'Austin';