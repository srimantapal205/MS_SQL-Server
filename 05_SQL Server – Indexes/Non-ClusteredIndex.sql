/*
What is a Non-Clustered Index in SQL Server?
A Non-Clustered Index in SQL Server is an index that stores pointers (row locators) to the actual data rows instead of sorting and storing the data physically. The data rows remain in their original order, but the index maintains a sorted structure for faster lookups.

Key Characteristics:
The actual data rows are not stored in the Non-Clustered Index.
Contains pointers (row locators) to locate the data in the heap or Clustered Index.
A table can have multiple Non-Clustered Indexes (unlike Clustered Index).
Improves read performance for queries involving filtering and sorting.


How This Works Internally?
SQL Server creates a separate B-Tree structure for Name.
The index stores Name in sorted order along with pointers to the actual row location.
Searching for an employee by Name is now faster.

Understanding the Composite Non-Clustered Index
A Composite Non-Clustered Index is created on multiple columns to optimize queries that filter by multiple conditions.


Which Index is Faster: Clustered or Non-Clustered?
Clustered Index is faster for retrieving ranges of data (BETWEEN, ORDER BY, etc.) because the data is already stored physically sorted.
Non-Clustered Index is faster for lookups on specific values (WHERE conditions) but requires an extra step (lookup) to fetch actual data.

*/

USE WhereClause
GO

SELECT * FROM tblOrder;
--DROP TABLE tblOrder;

SELECT * FROM tblOrder WHERE ProductID = 'Product - 101';

--Creating Non-clustered Index in SQL Server:

CREATE NONCLUSTERED INDEX IX_tblOrder_ProductId ON dbo.tblOrder (ProductID) INCLUDE ([Id], [CustomerId])

SELECT * FROM tblOrder WHERE CustomerId = 3 and ProductName = 'Pendrive';

CREATE NONCLUSTERED INDEX IX_tblOrder_CustomerID_Pr0ductName ON dbo.tblOrder(CustomerId ASC, ProductName DESC) INCLUDE([Id],[ProductId]);

SELECT * FROM tblOrder WHERE CustomerId = 3 AND ProductName = 'Pendrive';