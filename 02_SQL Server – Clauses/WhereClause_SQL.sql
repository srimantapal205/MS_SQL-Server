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


-- Create Projects Table
CREATE TABLE Projects (
    ProjectId INT PRIMARY KEY IDENTITY(1, 1),
    Title VARCHAR(200) NOT NULL,
    ClientId INT,
    EmployeeId INT,
    StartDate DATETIME,
    EndDate DATETIME,
    FOREIGN KEY (EmployeeId) REFERENCES Employee(ID)
);
ALTER TABLE Projects ADD CONSTRAINT employee_id_fk FOREIGN KEY (EmployeeId) REFERENCES Employee(ID);
Go
-- Populate Projects Table
INSERT INTO Projects (Title, ClientId, EmployeeId, StartDate, EndDate) VALUES 
('Develop new WordPress plugin for my business website', 2, 7, GETDATE(), (Getdate() + 85)),
('Migrate web application and database to new server', 2, 4, GETDATE(), (Getdate() + 95)),
('Android Application development', 4, 2, GETDATE(), (Getdate() + 60)),
('Hosting account is not working', 3, 2, GETDATE(), (Getdate() + 70)),
('MySQL database from my desktop application', 4, 1, GETDATE(), (Getdate() + 80)),
('Develop new WordPress plugin for my business website', 2, 3, GETDATE(), (Getdate() + 90)),
('Develop ecommerse website from scratch', 1, 2, GETDATE(), (Getdate() + 35)),
('WordPress website for our company', 1, 4, GETDATE(), (Getdate() + 45)),
('Manage our company servers', 2, 3, GETDATE(), (Getdate() + 55)),
('MySQL database from my desktop application', 4, 3, GETDATE(), (Getdate() + 75)),
('Hosting account is not working', 3, 4, GETDATE(), (Getdate() + 65));

SELECT * FROM Projects;

CREATE TABLE Positions (
ID INT NOT NULL IDENTITY(1,1),
MTitle VARCHAR(50),
EmployeeId INT,  
CONSTRAINT pk_position PRIMARY KEY (ID),
CONSTRAINT fk_pos_employeeid FOREIGN KEY(EmployeeId) REFERENCES Employee(ID)
)

DROP TABLE Positions;


INSERT INTO Positions (MTitle, EmployeeId)
VALUES
('Manager', 1),
('Senior Developer', 2),
('HR Specialist', 3),
('Finance Analyst', 4),
('Team Lead', 8),
('Marketing Head', 6),
('Sales Manager', 7);


SELECT * FROM Positions;

ALTER TABLE Employee ADD PositionsId INT CONSTRAINT fk_emp_Position FOREIGN KEY REFERENCES Positions(ID);
SELECT * FROM Employee;
UPDATE Employee 
SET PositionsId =
    CASE 
        WHEN ID = 1 THEN 1  
        WHEN ID = 2 THEN 6  
        WHEN ID = 3 THEN 7  
        WHEN ID = 4 THEN 8  
        WHEN ID = 6 THEN 9  
        WHEN ID = 7 THEN 10 
        WHEN ID = 8 THEN 11
		WHEN ID = 11 THEN 1  
        WHEN ID = 12 THEN 6  
        WHEN ID = 13 THEN 7  
        WHEN ID = 14 THEN 8  
        WHEN ID = 16 THEN 9  
        WHEN ID = 17 THEN 10 
        WHEN ID = 18 THEN 11
		WHEN ID = 21 THEN 1  
        WHEN ID = 22 THEN 6  
        WHEN ID = 23 THEN 7  
        WHEN ID = 24 THEN 8  
        WHEN ID = 26 THEN 9  
        WHEN ID = 27 THEN 10 
    END;
