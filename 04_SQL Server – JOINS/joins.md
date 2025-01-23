## Different Types of Joins in SQL Server
### SQL Server supports the following types of joins:

#### Inner Join
- Retrieves records that have matching values in both tables.
#### Outer Join

- Includes rows even if there is no match. It has three subtypes:
    - Left Outer Join: Returns all records from the left table and matching records from the right table.
    - Right Outer Join: Returns all records from the right table and matching records from the left table.
    - Full Outer Join: Returns records when there is a match in either table or no match.

#### Cross Join

Produces a Cartesian product, returning all possible combinations of rows from the two tables.
Self-Join

A table is joined with itself, usually with the use of aliases.
Natural Join

Matches columns with the same name and compatible data types in both tables. (Note: SQL Server does not natively support natural joins; similar behavior can be achieved with other joins and explicit conditions.)
Semi Join

Filters rows from the left table based on the presence of a related row in the right table but does not return columns from the right table (implemented using EXISTS or IN).

ANSI and NON-ANSI Joins in SQL Server
ANSI Joins:
Joins written using the JOIN keyword introduced in SQL-92. These are modern and preferred.
Example:
SELECT *
FROM TableA
INNER JOIN TableB
ON TableA.id = TableB.id;

Non-ANSI Joins:
Older syntax, where joins are implemented using a WHERE clause.
Example:
SELECT *
FROM TableA, TableB
WHERE TableA.id = TableB.id;

Inner Join in SQL Server
An Inner Join retrieves rows that have matching values in both tables based on the join condition.
Example:
SELECT A.EmployeeID, A.Name, B.Department
FROM Employees A
INNER JOIN Departments B
ON A.DepartmentID = B.DepartmentID;

 Outer Join in SQL Server
An Outer Join retrieves matching rows and rows with no match, depending on its type:

Left Outer Join: Includes all rows from the left table and matches from the right table.
SELECT A.EmployeeID, A.Name, B.Department
FROM Employees A
LEFT JOIN Departments B
ON A.DepartmentID = B.DepartmentID;

Right Outer Join: Includes all rows from the right table and matches from the left table.
SELECT A.EmployeeID, A.Name, B.Department
FROM Employees A
RIGHT JOIN Departments B
ON A.DepartmentID = B.DepartmentID;

Full Outer Join: Includes all rows from both tables, whether or not there is a match.
SELECT A.EmployeeID, A.Name, B.Department
FROM Employees A
FULL OUTER JOIN Departments B
ON A.DepartmentID = B.DepartmentID;


Cross Join in SQL Server
A Cross Join returns the Cartesian product of two tables, combining each row from the first table with every row from the second table.
SELECT A.Name, B.Department
FROM Employees A
CROSS JOIN Departments B;

Self-Join in SQL Server
A Self-Join is a join where a table is joined with itself. This is useful for hierarchical or comparative relationships within the same table.
Example:
SELECT A.EmployeeID, A.Name AS Manager, B.Name AS Subordinate
FROM Employees A
INNER JOIN Employees B
ON A.EmployeeID = B.ManagerID;



Difference Between JOIN and UNION in SQL Server
Feature	JOIN	UNION
Purpose	Combines columns from two tables.	Combines rows from two result sets.
Operation	Works horizontally.	Works vertically.
Condition	Requires a join condition.	No join condition; requires similar structure.
Duplicates	Retains duplicates by default (can be removed using DISTINCT).	Removes duplicates unless UNION ALL is used.
Example	Inner Join: Combines data from related tables.	UNION: Combines results of multiple queries.
