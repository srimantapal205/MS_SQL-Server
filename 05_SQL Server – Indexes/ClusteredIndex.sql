/*
A Clustered Index in SQL Server is structured as a B-Tree (Balanced Tree). This structure helps efficiently locate and retrieve data. A B-Tree consists of:

Root Node (Top level)
Intermediate Nodes (Middle levels)
Leaf Nodes (Bottom level, containing actual data rows in sorted order)
When performing searches, SQL Server traverses from the root node down to the leaf nodes, minimizing the number of disk reads.

What is a Clustered Index?
A Clustered Index is an index that determines the physical order of rows in a table based on the indexed column(s). Unlike a Non-Clustered Index, which stores pointers to the actual rows, a Clustered Index keeps the data pages sorted according to the index key.

Key Characteristics:
Data rows are physically stored in the order of the indexed column.
Faster retrieval for range-based queries due to the B-Tree structure.
By default, the Primary Key constraint creates a Clustered Index.
Why Can a Table Have Only One Clustered Index?
A table can have only one Clustered Index because the data rows can be stored in only one physical order. If a table allowed multiple Clustered Indexes, it would need to store the data in multiple orders simultaneously, which is not possible.

However, a table can have multiple Non-Clustered Indexes, as they store pointers to the actual data instead of dictating physical order.

Understanding the SQL Server Composite Clustered Index
A Composite Clustered Index is created when a Clustered Index is defined on multiple columns. It sorts the data first by the first column, then by the second column in case of duplicates.

*/

USE WhereClause
GO


Execute sp_helpindex Employee;