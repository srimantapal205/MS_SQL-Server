-- Cascading Referential Integrity Constraint
USE TestTempDB;

-- Cascading Referential Integrity Constraints in SQL Server help maintain the consistency of related data in parent and child tables. These constraints dictate the actions SQL Server performs when a row in the parent table is updated or deleted, ensuring the child table reflects those changes appropriately.

--Example of Cascading Referential Integrity Constraints
CREATE TABLE Gender (
    Id INT PRIMARY KEY,
    Gender NVARCHAR(30)
);

--Insert item 
INSERT INTO Gender VALUES(1, 'Male');
INSERT INTO Gender VALUES(2, 'Female');
INSERT INTO Gender VALUES(3, 'Unknown');

CREATE TABLE Gender2 (
    Id INT PRIMARY KEY,
    Gender NVARCHAR(30)
);

--Insert item 
INSERT INTO Gender2 VALUES(1, 'Male');
INSERT INTO Gender2 VALUES(2, 'Female');
INSERT INTO Gender2 VALUES(3, 'Unknown');

--Create Person table
CREATE TABLE Person(
    Id INT PRIMARY KEY,
    PName VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    GenderId INT NULL
)

--Alter table Person
ALTER TABLE Person ADD CONSTRAINT Person_Gender_FK FOREIGN KEY (GenderId) REFERENCES Gender(Id)

--Insert some test data in Person Table
Insert into Person values (1, 'abc','abc@gmail.com',1)
Insert into Person values (2, 'pqr','pqr@gmail.com',2)
Insert into Person values (3, 'xyz','xyz@gmail.com',3)

CREATE TABLE Person_v2(
    Id INT PRIMARY KEY,
    PName VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    GenderId INT CONSTRAINT Gender_FK FOREIGN KEY (GenderId) REFERENCES Gender2(Id)
	ON DELETE CASCADE
	ON UPDATE CASCADE
)
DROP TABLE Person_v2;
--Insert some test data in Person Table
Insert into Person_v2 values (1, 'abc','abc@gmail.com',1)
Insert into Person_v2 values (2, 'pqr','pqr@gmail.com',2)
Insert into Person_v2 values (3, 'xyz','xyz@gmail.com',3)

Insert into Person_v2 values (4, 'pranaya','pranaya@g.com',4) 

--The DELETE statement conflicted with the REFERENCE constraint "Person_Gender_FK". The conflict occurred in database "TestTempDB",
DELETE FROM Gender WHERE Id = 3;

DELETE FROM Gender2 WHERE Id = 3;


--Update the Gender2 table 
UPDATE Gender2 SET ID = 3 WHERE Gender = 'Unknown';

-- CREATE TABLE Employee 
-- ( 
--     EmpID  INT CONSTRAINT EmpID_PK PRIMARY KEY, 
--     Ename  VARCHAR(50) NOT NULL, 
--     Job    VARCHAR(50), 
--     ManagerID    INT CONSTRAINT ManagerID_FK REFERENCES Employee(EmpID), 
--     Salary MONEY DEFAULT 3000 CONSTRAINT Salary_CK CHECK (Salary BETWEEN 5000 AND 15000) 
-- ) 