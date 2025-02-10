/*
1. How does data search when there is no index?
When a table does not have an index, SQL Server performs a table scan (full scan) to find the required data. This means the database engine must check every row in the table sequentially, which can be slow, especially for large datasets.

2. Understanding the Balanced Tree (B-Tree) in SQL Server
SQL Server uses a B-Tree (Balanced Tree) structure for indexes, allowing for efficient data retrieval. A B-Tree consists of:

Root Node: The top level, containing pointers to intermediate nodes.
Intermediate Nodes: Guide searches by directing queries to the correct leaf nodes.
Leaf Nodes: Contain actual data or pointers to data.
B-Trees ensure that searches, inserts, and deletions occur in logarithmic time (O log N).

How will the database engine retrieve the data from a table?
SQL Server retrieves data using either:

Table Scan (if no index exists) � Reads the entire table row by row.
Index Seek (if an index exists and is selective) � Directly navigates to relevant rows using a B-Tree.
Index Scan (if an index exists but is not selective enough) � Reads all indexed values instead of scanning the full table.

What is an Index in SQL Server?
It is a database object in SQL Server which is used to improve the performance of search operations.
When we create an index on any column of a table, then SQL Server internally maintains a separate table called the index table. And when we are trying to retrieve the data from the existing table, depending on the index table, SQL Server directly goes to the table and retrieves the data very quickly.
In a table, we can use a maximum of 1000 indexes (1 Clustered Index plus 999 Non-Clustered Index).
When SQL Server uses Indexes?
The SQL Server uses indexes of a table provided that the select or update or delete statement contained the �WHERE� clause and moreover the where condition column must be an indexed column. If the select statement contains an �ORDER BY� clause then also the indexes can be used.

Note: When SQL Server is searching for information under the database, first it will verify the best execution plan for retrieving the data and uses that plan which can be either a full-page scan or an index scan.

The syntax for creating an Index in SQL Server:
CREATE [UNIQUE] [CLUSTERED/ NON-CLUSTERED] INDEX <INDEX NAME> ON <TABLE NAME> (<COLUMN LIST>)
To see the index: sp_helpindex Employee
To drop an index: Drop index Employee.IX_Employee_Id

*/
USE WhereClause
GO

SELECT * FROM Employee;
SELECT * FROM Employee WHERE ID = 7;


-- To confirm whether the clusterd index is created ir no.
sp_helpindex Employee;

Execute sp_helpindex Employee;
INSERT INTO Employee VALUES (5,'Sambit', 3000, 'Male', 'Toronto', 'IT', 4)

--CREATE Clusterd Index

--CREATE CLUSTERED INDEX Employee_Gender_Salary ON Employee(GenderId DESC, Salary ASC);

-- Create Non clusterd Indx table
CREATE TABLE tblOrder(
Id INT,
CustomerId INT,
ProductID VARCHAR(100),
ProductName VARCHAR(50)
)
GO

DECLARE @i int = 0
WHILE @i < 3000
BEGIN
	SET @i = @i + 1
	IF(@i <500)
		BEGIN
			INSERT INTO tblOrder VALUES(@i, 1, 'Product - 10120','Laptop')
		END
	ELSE IF(@i < 1000)
		BEGIN
			INSERT INTO tblOrder VALUES(@i, 3, 'Product - 1020', 'Mobile')
		END
	ELSE IF(@i <1500)
		BEGIN
			INSERT INTO tblOrder VALUES(@i, 2, 'Product - 101', 'Desktop')
		END
	ELSE IF(@i <2000)
		BEGIN
			INSERT INTO tblOrder VALUES(@i, 3, 'Product - 707', 'Pendrive')
		END
	ELSE IF(@i <2500)
		BEGIN
			INSERT INTO tblOrder VALUES(@i, 2, 'Product - 999', 'HD')
		END
	ELSE IF(@i <3000)
		BEGIN
			INSERT INTO tblOrder VALUES(@i, 1, 'Product - 100', 'Tablet')
		END
END

