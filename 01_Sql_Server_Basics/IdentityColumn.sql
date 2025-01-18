USE TestTempDB;
-- Identity Column in SQL
--An Identity in SQL Server is a property of a column that generates auto-incrementing values. It is commonly used for primary key columns to ensure unique row identification. The identity column automatically assigns a unique integer value for each new row added to the table.

-- Syntax and Example of Identity Column in SQL Server

-- CREATE TABLE TableName (
--     ColumnName DataType IDENTITY(Seed, Increment),
--     OtherColumn DataType
-- );

-- Explicitly Supply Values for Identity Column in SQL 

CREATE TABLE Person_v10 (
	PersonId INT IDENTITY(1,1),
	PName NVARCHAR(29)
)
INSERT INTO Person_v10 VALUES('Bob');
INSERT INTO Person_v10 VALUES('John');



--An explicit value for the identity column in table 'Person_v10' can only be specified when a column list is used and IDENTITY_INSERT is ON.
INSERT INTO Person_v10 VALUES(1, 'Mark');

INSERT INTO Person_v10 VALUES('Mark');

SELECT * FROM Person_v10;

DELETE FROM Person_v10 WHERE PersonId='3';

-- Using Alter Command 
CREATE TABLE Person_v11
(
	PersonId INT,
	PName NVARCHAR(30)
)

-- Drop Column
ALTER TABLE Person_v11 DROP COLUMN PersonId

-- Alter Column
ALTER TABLE Person_11 ADD PersonId INT IDENTITY(1, 1)
GO

-- Explicity supply values for Identity
-- * First turn on the Identity isert 
SET Identity_Insert Person_v10 ON;
-- Insert the value
-- * Secondly, you need to specify the identity column name
INSERT INTO  Person_v10(PersonId, PName) VALUES(3,'Sara')
SELECT * FROM Person_v10;

-- Explicit value must be specified for identity column in table 'Person_v10' either when IDENTITY_INSERT is set to ON or when a replication user is inserting into a NOT FOR REPLICATION identity column.
INSERT INTO Person_v10 VALUES('Smith');

-- If you want to off the set identity for insert Run Below query
SET Identity_Insert Person_v10 OFF;


--TRUNCATE Table Person_v10;



--  Get the Last Generated Identity Column Value
-- Built in function
SELECT SCOPE_IDENTITY()

-- User define 
SELECT @@IDENTITY
SELECT IDENT_CURRENT('Person_v10')