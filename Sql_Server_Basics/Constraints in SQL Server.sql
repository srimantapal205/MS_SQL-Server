--Constraints in SQL Server
USE TestTempDB;


CREATE TABLE Employee (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255) DEFAULT 'Mumbai',
    DateOfBirth date DEFAULT GETDATE(),
    Salary   DECIMAL (18, 2) DEFAULT 5000.00
)

SELECT * FROM Employee;

CREATE TABLE customer 
( 
    id    INT NOT NULL, 
    name  VARCHAR(30) NOT NULL, 
    mobno CHAR(10) NOT NULL 
) 

INSERT customer VALUES (101, 'AA', '1111111111')--ALLOWED 
INSERT customer VALUES (101, 'AA', '2222222222')--ALLOWED 
INSERT customer VALUES (NULL, NULL, NULL)--NOTALLOWED


SELECT * FROM customer;

CREATE TABLE CustomerV2
( 
    Id      INT UNIQUE, 
    NAME    VARCHAR(30) UNIQUE, 
    Emailid VARCHAR(100) UNIQUE 
)

INSERT CustomerV2  VALUES (10,  "AA",  "pranayakumar777@gmail.com")

INSERT CustomerV2 VALUES (NULL, NULL, NULL)--ALLOWED 
INSERT CustomerV2 VALUES (11, 'BB', 'pranayakumar7@gmail.com')--ALLOWED 
INSERT CustomerV2 VALUES (NULL,  NULL, NULL) -- NOT ALLOWED )
-- Imposing Constraint on Column Level:
CREATE TABLE customerV3 
( 
    Id      INT CONSTRAINT cid_unique UNIQUE, 
    NAME    VARCHAR(30), 
    Emailid VARCHAR(100) CONSTRAINT email_unique UNIQUE 
) 

CREATE TABLE customerv4
( 
    Id      INT, 
    NAME    VARCHAR(30), 
    Emailid VARCHAR(100),
    CONSTRAINT cid_unique UNIQUE(Id), 
    CONSTRAINT email_unique UNIQUE(Emailid)
) 
-- Composite Constraints in SQL Server
CREATE TABLE BranchDetails 
( 
    City           VARCHAR(50), 
    Branchcode     VARCHAR(10), 
    Branchlocation VARCHAR (30), 
    CONSTRAINT city_bc_unique UNIQUE(City, Branchcode) 
)

Insert into BranchDetails (City, Branchcode, Branchlocation) values('Mumbai', 'xyz','abc') -- Allowed
Insert into BranchDetails (City, Branchcode, Branchlocation) values('Mumbai', 'abc','pqr') -- Allowed
Insert into BranchDetails (City, Branchcode, Branchlocation) values('Mumbai', 'xyz','pqr') --Not Allowed


-- Check Constraint in SQL Server:

CREATE TABLE EmployeeV2 
( 
    Emp_id       INT NOT NULL CHECK(Emp_id BETWEEN 0 AND 1000), 
    Emp_name     VARCHAR(30) NOT NULL, 
    Entered_date DATETIME NOT NULL CHECK(Entered_date <= CURRENT_TIMESTAMP), 
    Dept_no      INT CHECK(Dept_no > 0 AND Dept_no < 100) 
) 

INSERT INTO EmployeeV2  (Emp_id, Emp_name, Entered_date, Dept_no) 
VALUES      (1, 
             'Pranaya', 
             '2018-04-28 12:18:46.813', 
             10) -- Allowed 
INSERT INTO EmployeeV2 (Emp_id, Emp_name, Entered_date, Dept_no) 
VALUES      (1001, 
             'Pranaya', 
             '2018-04-28 12:18:46.813', 
             20) --Not Allowed

