## SET Operators in SQL Server
<p>SET operators in SQL Server are used to combine the results of two or more SELECT queries. These operators perform operations on the result sets and return a single result set. </p>
    The main SET operators are:

- UNION
- UNION ALL
- INTERSECT
- EXCEPT

### UNION and UNION ALL Operators in SQL Server
#### UNION
- Combines the result sets of two or more SELECT queries.
- Removes duplicate rows from the final result set.
- Requires that the number of columns and their data types in the SELECT statements must match.
#### UNION ALL
- Combines the result sets of two or more SELECT queries.
- Includes all rows, including duplicates.
- Faster than UNION because it does not perform duplicate elimination.

    -- Create sample tables
    CREATE TABLE Sales2023 (SalesID INT, Amount DECIMAL(10, 2));
    INSERT INTO Sales2023 VALUES (1, 500.00), (2, 300.00);

    CREATE TABLE Sales2024 (SalesID INT, Amount DECIMAL(10, 2));
    INSERT INTO Sales2024 VALUES (1, 500.00), (3, 700.00);

    -- UNION Example
    SELECT * FROM Sales2023
    UNION
    SELECT * FROM Sales2024;

    -- UNION ALL Example
    SELECT * FROM Sales2023
    UNION ALL
    SELECT * FROM Sales2024;


