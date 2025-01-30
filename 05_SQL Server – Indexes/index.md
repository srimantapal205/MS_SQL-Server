# Index In SQL

## Indexes in SQL Server

An index in SQL Server is a database object that improves the speed of data retrieval operations on a table at the cost of additional storage and maintenance overhead. Indexes work similarly to an index in a book, allowing SQL Server to find data efficiently rather than scanning the entire table.

## Why Use Indexes?

Indexes improve the performance of queries by reducing the amount of data SQL Server has to scan to find relevant records. Without indexes, SQL Server must perform a table scan (checking every row), which is inefficient for large datasets.

## Types of Indexes in SQL Server

SQL Server provides multiple types of indexes, each designed for specific use cases.

### Clustered Index
+ A clustered index determines the physical order of data in a table.
+ A table can have only one clustered index because rows can only be physically ordered in one way.
+ By default, if a primary key is defined, SQL Server automatically creates a clustered index on it.
+ This creates a clustered index on the CustomerID column.

    CREATE CLUSTERED INDEX IX_Customers_ID ON Customers(CustomerID);

+ The data in the table is physically sorted by CustomerID.
#### When to Use a Clustered Index?
+ When searching by primary key.
+ When performing range-based queries (e.g., BETWEEN, >, <).
+ When sorting queries (ORDER BY).

### Non-Clustered Index
+ A non-clustered index does not affect the physical order of table data.
+ Instead, it creates a separate structure that stores pointers to the actual data.
+ A table can have multiple non-clustered indexes.

    CREATE NONCLUSTERED INDEX IX_Orders_CustomerID ON Orders(CustomerID);

+ This creates an index on CustomerID, but the table's physical order remains unchanged.

#### When to Use a Non-Clustered Index?
+ When querying specific columns that are not the primary key.
+ When frequently using WHERE conditions on non-primary key columns.
+ When searching on multiple columns (composite index).

### Unique Index
+ A unique index ensures that all values in the indexed column are distinct.
+ It is automatically created when defining a UNIQUE constraint on a column.

    CREATE UNIQUE INDEX IX_Employees_Email ON Employees(Email);

+ This ensures that no two employees can have the same email.

### Composite Index
+ A composite index is an index on multiple columns.
+ It is useful when queries filter or sort data using multiple columns.

    CREATE INDEX IX_Orders_Customer_Date ON Orders(CustomerID, OrderDate);


### Filtered Index
A filtered index is created on a subset of data in a table.
It is useful when queries filter by specific conditions.

    CREATE INDEX IX_Products_Available ON Products(Price) WHERE Price > 100;


### Full-Text Index
+ A full-text index is used for fast text searching.
+ It is useful for searching large text-based data like product descriptions.

    CREATE FULLTEXT INDEX ON Products(ProductDescription) KEY INDEX PK_Products;

## How Indexes Improve Performance

Indexes use B-trees (Balanced Trees) for fast lookups:

1. Clustered Index: Data is stored physically sorted, and SQL Server uses a B-tree structure to locate rows.
2. Non-Clustered Index: Stores pointers to actual data in the table, reducing lookup time.
3. Seek vs. Scan:
    - Index Seek: SQL Server uses the index to jump directly to relevant rows (faster).
    - Index Scan: SQL Server reads the entire index (slower but better for large data sets with many results).

## When Not to Use Indexes

While indexes improve read performance, they slow down write operations (INSERT, UPDATE, DELETE) because:

+ SQL Server must update indexes whenever data changes.
+ Large numbers of indexes increase storage and maintenance overhead.
##### Avoid Indexes When:
+ The table has frequent inserts, updates, or deletes.
+ The table is small (full scans are not expensive).
+ The query retrieves too many rows (scanning may be faster).

## Index Maintenance
Indexes must be periodically maintained for optimal performance.

#### Rebuilding an Index
+ Reorganizes index structure to remove fragmentation.
    ALTER INDEX IX_Customers_ID ON Customers REBUILD;


#### Reorganizing an Index
+ Less intensive than rebuilding; compacts pages without full rebuild.
    ALTER INDEX IX_Customers_ID ON Customers REORGANIZE;

#### Dropping an Index
+ If an index is not used frequently, it can be dropped to improve performance.
    DROP INDEX IX_Orders_CustomerID ON Orders;

## How to Check Index Usage?
Use SQL Server DMV (Dynamic Management Views) to analyze index performance.

#### Check Index Usage
    SELECT * FROM sys.dm_db_index_usage_stats WHERE database_id = DB_ID();

#### Find Missing Indexes
    SELECT * FROM sys.dm_db_missing_index_details;
