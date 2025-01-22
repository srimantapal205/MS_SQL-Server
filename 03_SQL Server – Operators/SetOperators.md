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



<p>
The EXCEPT and INTERSECT operators in SQL Server are used to compare the results of two queries and return specific sets of data based on the differences or intersections between them. Both operators require the queries to have the same number of columns and compatible data types.
</p>

#### EXCEPT:
<p>The EXCEPT operator returns rows from the first query that are not present in the second query. It is similar to the concept of a set difference in mathematics.</p>

    SELECT column1, column2, ...
    FROM Table1
    EXCEPT
    SELECT column1, column2, ...
    FROM Table2;

#### INTERSECT:
<p>The INTERSECT operator returns rows that are common to both queries. It works like a set intersection in mathematics.</p>

    SELECT column1, column2, ...
    FROM Table1
    INTERSECT
    SELECT column1, column2, ...
    FROM Table2;


