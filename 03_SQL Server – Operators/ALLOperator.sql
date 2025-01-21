-- The ALL operator in SQL Server is used to compare a value with all the values in a subquery. It returns TRUE if the condition holds true for all values in the subquery. It is typically used with comparison operators such as >, <, >=, <=, = or !=.

-- SELECT column_name(s) FROM table_name WHERE expression operator ALL (subquery);
-- expression: The value or column to compare.
-- operator: A comparison operator (>, <, >=, <=, =, !=).
-- subquery: A subquery that returns a set of values.

USE WhereClause
Go

-- Create table 
CREATE TABLE PermanentEmployee(
	EmployeeId INT,
	Name VARCHAR(50),
	Gender VARCHAR(50),
	Department varchar(50),
	Age INT
)
GO
--Insert Rows into PermanentEmployee Table
INSERT INTO PermanentEmployee VALUES (1,'Pranaya','Male','IT',20)
INSERT INTO PermanentEmployee VALUES (2,'Priyanka','Female','IT',22)
INSERT INTO PermanentEmployee VALUES (3,'Sudhanshu','Male','HR',25)
INSERT INTO PermanentEmployee VALUES (4,'Subrat','Male','Sales',60)
INSERT INTO PermanentEmployee VALUES (5,'Tarun','Male','Sales',54)
INSERT INTO PermanentEmployee VALUES (6,'Lipika','Female','HR',27)
INSERT INTO PermanentEmployee VALUES (7,'Smita','Female','IT',40)
INSERT INTO PermanentEmployee VALUES (8,'Smith','Male','HR',29)
GO

-- Create ContractEmployee Table
CREATE TABLE ContractEmployee
(
  EmployeeId INT,
  Name VARCHAR(50),
  Gender VARCHAR(50),
  Department varchar(50),
  Age INT
)
GO

--Insert rows into ContractEmployee Table
INSERT INTO ContractEmployee VALUES (9,'Anurag','Male','IT',33)
INSERT INTO ContractEmployee VALUES (10,'Sara','Female','IT',15)
INSERT INTO ContractEmployee VALUES (11,'Sambit','Male','HR',29)
INSERT INTO ContractEmployee VALUES (12,'James','Male','Sales',37)
INSERT INTO ContractEmployee VALUES (13,'Pam','Female','Sales',25)
GO

-- All Operator In SQl
SELECT * FROM PermanentEmployee WHERE Age> (SELECT MAX(Age) FROM ContractEmployee); -- Without All operator

SELECT * FROM PermanentEmployee WHERE Age > All(SELECT Age FROM ContractEmployee); -- With All Operator

CREATE TABLE #TEMP_TABLE(ID INT);
INSERT INTO #TEMP_TABLE VALUES(1),(2),(3);
SELECT * FROM #TEMP_TABLE;

IF 4> ALL(SELECT * FROM #TEMP_TABLE)
	PRINT 'Returnd TRUE'
ELSE
	PRINT 'Returnd FALSE'


IF 3> ALL(SELECT ID FROM #TEMP_TABLE)
	PRINT 'Returnd TRUE'
ELSE
	PRINT 'Returnd FALSE'