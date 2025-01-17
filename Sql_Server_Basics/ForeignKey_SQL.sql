USE TestTempDB;
-- Foreigen Key Constraint in SQL
--
-- A foreign key is a column or a combination of columns whose values match a primary key in a primary key table or a unique key in a unique key table.

-- Foreign key constraints are used to enforce referential integrity. This means that the foreign key column values must match values in the primary key column to ensure that the relationship between the tables is valid.

-- A foreign key can be a column or a combination of columns. A foreign key can reference a primary key or a unique key in the same table or a different table.


-- -- Creating a Foreign Key Constraint

CREATE TABLE Dept
(
	Dno INT PRIMARY KEY,
	Dname VARCHAR(30),
	Dloc CHAR(40)
);

GO

INSERT Dept VALUES(10, '.NET', 'HYD');
INSERT Dept VALUES(20, 'JAVA', 'PUNE');
INSERT Dept VALUES(30, 'Python', 'NCR');
GO


-- Create a table with a foreign key constraint
CREATE TABLE EmployeeDetails (
	EId INT PRIMARY KEY,
	Ename VARCHAR(30),
	Salary MONEY,
	Dno INT FOREIGN KEY REFERENCES Dept(Dno) 
)

--Insert a record in the table
INSERt INTO EmployeeDetails VALUES(101, 'Raj', 10000, 10);
INSERt INTO EmployeeDetails VALUES(102, 'Rajesh', 20000, 20);
INSERt INTO EmployeeDetails VALUES(103, 'Rajeev', 30000, 30);
--This statement has been terminated. This INSERT statement conflicted with the FOREIGN KEY constraint.
INSERT INTO EmployeeDetails VALUES(104, 'Rakesh', 40000, 40);


-- Create Foreign key constraint in SQL Server at the column level
CREATE TABLE EmployeeDetails_v1 (
    EId INT PRIMARY KEY,
    Ename VARCHAR(30),
    Job VARCHAR(30),
    Salary MONEY,
    DepyNo INT CONSTRAINT deptno_fk  REFERENCES Dept(Dno)
)

-- Foreign key Constraint in SQL Server at table level
CREATE TABLE EmployeeDetails_v2 (
    EId INT PRIMARY KEY,
    Ename VARCHAR(30),
    Job VARCHAR(30),
    Salary MONEY,
    DeptNo INT,
    CONSTRAINT deptno_fk FOREIGN KEY(DeptNo) REFERENCES Dept(Dno)
)

-- What is the difference between Primary Key and Foreign Key?
-- Primary Key	Foreign Key
-- Primary key uniquely identifies each row in a table.	Foreign key is a column or a combination of columns whose values match a primary key in a primary key table or a unique key in a unique key table.
    -- Primary key does not allow NULL values.	Foreign key allows NULL values.
    -- Primary key does not allow duplicate values.	Foreign key allows duplicate values.
    -- Primary key can not be modified or deleted.	Foreign key can be modified or deleted.
    -- Primary key can be only one in a table.	Foreign key can be more than one in a table.
    -- Primary key can be a composite key.	Foreign key can be a composite key.
    -- Primary key can be a foreign key.	Foreign key can not be a primary key.

