-- EXCEPT and INTERSECT operators

USE TestTempDB
GO

CREATE DATABASE EmployeeDB
GO

USE EmployeeDB
GO

CREATE TABLE EmployeeIndia
(
  ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Gender VARCHAR(10),
  Department VARCHAR(50)
)
GO

INSERT INTO EmployeeIndia VALUES(1, 'Pranaya', 'Male','IT')
INSERT INTO EmployeeIndia VALUES(2, 'Priyanka', 'Female','IT')
INSERT INTO EmployeeIndia VALUES(3, 'Preety', 'Female','HR')
INSERT INTO EmployeeIndia VALUES(4, 'Subrat', 'Male','HR')
INSERT INTO EmployeeIndia VALUES(5, 'Anurag', 'Male','IT')
GO

CREATE TABLE EmployeeUK
(
  ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Gender VARCHAR(10),
  Department VARCHAR(50)
)
GO

INSERT INTO EmployeeUK VALUES(1, 'James', 'Male','IT')
INSERT INTO EmployeeUK VALUES(2, 'Priyanka', 'Female','IT')
INSERT INTO EmployeeUK VALUES(3, 'Sara', 'Female','HR')
INSERT INTO EmployeeUK VALUES(4, 'Subrat', 'Male','HR')
INSERT INTO EmployeeUK VALUES(5, 'Pam', 'Female','HR')
GO


SELECT * FROM EmployeeIndia;
SELECT * FROM EmployeeUK;


-- EXCEPT 

SELECT * FROM EmployeeIndia EXCEPT SELECT * FROM EmployeeUK;

SELECT * FROM EmployeeIndia WHERE ID NOT IN (SELECT * FROM EmployeeUK); --Only one expression can be specified in the select list when the subquery is not introduced with EXISTS.

--INTERSECT

SELECT ID, Name FROM EmployeeIndia INTERSECT SELECT ID, Name FROM EmployeeUK;