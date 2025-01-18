-- Primary key for table 'KeyConstraint'
--Primary key is a constraint that is used to uniquely identify each record in a table. A table can have only one primary key. Primary key can be created using CREATE TABLE or ALTER TABLE command. 

CREATE TABLE Branches (
	Bcode INT PRIMARY KEY,
	Bname VARCHAR(40),
	Bloc Char(40)
)

-- Inser record in the table
INSERT Branches VALUES(101, 'SBI', 'SRNAGAR');

-- Inserting NULL in Primary Key Coulmn
INSERT Branches VALUES(NULL, 'SBI', 'SRNAGAR');


-- Inserting Duplicate value in Primary Key Column
INSERT Branches VALUES(101, 'SBI', 'SRNAGAR');

-- Composit Primary Key in SQL Server 
-- A composite primary key is a combination of two or more columns in a table that uniquely identify each record in a table.
-- A table can have only one composite primary key. Composite primary key can be created using CREATE TABLE or ALTER TABLE command.

CREATE TABLE Branch_Details(
	City VARCHAR(40),
	Bcode INT,
	Bloc VARCHAR(30),
	PRIMARY KEY (City, Bcode)
)

--Inser a new statemet
INSERT INTO Branch_Details(City,Bcode,Bloc) VALUES('Mumbai', 101, 'Gorehaon')

--  Cannot insert duplicate key in object 'Branch_Details'. The duplicate key value is (Mumbai, 101).

INSERT INTO Branch_Details(City,Bcode,Bloc) VALUES('Mumbai', 101, 'Malad')

-- Inser more record
INSERT INTO Branch_Details(City,Bcode,Bloc) VALUES('Mumbai', 102, 'Malad')
INSERT INTO Branch_Details(City,Bcode,Bloc) VALUES('Hydrabad', 102, 'SR Nagar')


INSERT INTO Branch_Details(City,Bcode,Bloc) VALUES('Hydrabad', 102, 'Begumpet')


-- The primary key also called a candidate key, is a column or a set of columns that uniquely identifies each row in a table.

--Primary key has the following features:
    -- Primary key uniquely identifies each row in a table.
    -- Primary key does not allow NULL values.
    -- Primary key does not allow duplicate values.
    -- It can not be modified or deleted. 

-- What is the diffrence between Primary Key and Unique Key?
    -- Primary Key	Unique Key
    -- Primary key uniquely identifies each row in a table.	Unique key uniquely identifies each row in a table.
    -- Primary key does not allow NULL values.	Unique key allows only one NULL value.
    -- Primary key does not allow duplicate values.	Unique key allows only one NULL value.
    -- Primary key can not be modified or deleted.	Unique key can be modified or deleted.
    -- Primary key can be only one in a table.	Unique key can be more than one in a table.
    -- Primary key can be a composite key.	Unique key can be a composite key.
    -- Primary key can be a foreign key.	Unique key can not be a foreign key.
