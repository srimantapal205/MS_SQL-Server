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

Table Scan (if no index exists) – Reads the entire table row by row.
Index Seek (if an index exists and is selective) – Directly navigates to relevant rows using a B-Tree.
Index Scan (if an index exists but is not selective enough) – Reads all indexed values instead of scanning the full table.


*/
