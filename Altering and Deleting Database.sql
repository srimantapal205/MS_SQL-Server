--Creating Altering and Deleting Database in SQL Server
CREATE DATABASE  TestDB2025;
--Rename DataBase Using ALTER
ALTER DATABASE TestDB2025 Modify Name = TestDb012025dev;

--Alternative way to Rename the DB using system define store procedure
Execute sp_renamedb 'TestDb012025dev','Test012025devDB'; 

--Delete database or Drop Database using sql
DROP DATABASE Test012025devDB;


