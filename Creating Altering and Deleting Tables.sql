USE TestTempDB;

--Creating Altering and Deleting Tables in SQL

-- DDL (5 commands- create, alter, sp_rename, drop, truncate)
-- DML (3 commands- Insert, Update, Delete).
-- DQL/ DRL (1 command- select).
-- TCL (3 commands- commit, rollback, savepoint)
-- DCL (2 commands- Grant, Revoke).



--Creating : CREATE command is used to create a new database object in a database such as tables, views, functions, etc.

CREATE TABLE student(
	studid INT,
	sname VARCHAR(max),
	salary DECIMAL(6,2)
);



--Altering : This command is used to change or modify the structure of a table. In SQL Server.
ALTER TABLE student ADD email varchar(30);
ALTER TABLE student ADD branch varchar(30);
--ALTER TABLE - RENAME COLUMN
EXEC sp_rename 'student.sname', 'stu_first_name','COLUMN';

--Change datatype of an exiting column
ALTER TABLE student ALTER COLUMN stu_first_name NVARCHAR(100);

-- Chenging NULL to NOT NULL
ALTER TABLE student ALTER COLUMN studid INT NOT NULL;

-- Chenging NOT NULL to  NULL
ALTER TABLE student ALTER COLUMN studid INT NULL;
--Deleting Column in SQL Server
ALTER TABLE student DROP COLUMN branch;


-- To change a table name from the old table name to a new name.
EXEC sp_rename 'student ', 'studentDetails';

---Truncate Command in SQL : Whenever you want to delete all the records or rows from a table without any condition, then you need to use the Truncate command in SQL .

TRUNCATE TABLE studentDetails;

--Create Table :
-- CREATE TABLE student(
-- 	studid INT,
-- 	sname VARCHAR(max),
-- 	salary DECIMAL(6,2)
-- );
--Drop Command :  To delete the table from the database, then you need to use the DROP command in SQL Serve

DROP TABLE student;