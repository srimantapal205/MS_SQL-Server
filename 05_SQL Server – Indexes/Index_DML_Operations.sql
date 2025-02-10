/*
How Index Impacts DML Operations in SQL Server
Indexes improve read performance (SELECT queries), but they have a significant impact on DML operations (INSERT, UPDATE, DELETE) because SQL Server must maintain the index structure whenever data changes. Let’s break down the impact of indexes on each DML operation.

1. Impact on INSERT Operations
When a new row is inserted, SQL Server must:

Insert the data into the table.
Update all relevant indexes.
How Index Affects INSERT Performance
With a Clustered Index:
Data must be inserted in sorted order (based on the clustered index key).
This may cause page splits if there isn’t enough space in the correct location.
If IDENTITY is used as the Clustered Index, inserts are sequential and efficient.
With a Non-Clustered Index:
The index must be updated separately, adding extra overhead.
More indexes = slower inserts because each index requires an additional write.


2. Impact on UPDATE Operations
Updating an indexed column means SQL Server updates the index structure.
If the updated value changes a Clustered Index, the row may be moved to a new location.
If a Non-Clustered Index includes the updated column, index pages need modification.

3. Impact on DELETE Operations
SQL Server removes the row from the table and updates all associated indexes.
If the table has a Clustered Index, the row is physically removed.
If the table has Non-Clustered Indexes, SQL Server removes the index entries separately.



How to Optimize DML Performance with Indexes?

Use Indexes Wisely
Avoid excessive indexes on frequently updated tables.
Drop unused indexes to reduce maintenance overhead.

Use Fill Factor for Indexes
Set a Fill Factor to leave space in index pages, reducing page splits.

Use Maintenance Strategies
Rebuild or reorganize indexes to remove fragmentation:
Consider Partitioning Large Tables
Partitioning helps distribute data and reduce indexing overhead.
Use DISABLE INDEX for Bulk Inserts
Temporarily disable indexes before bulk inserts:


*/