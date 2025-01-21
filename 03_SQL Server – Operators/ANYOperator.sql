-- The ANY operator in SQL Server is used in combination with comparison operators (=, <, >, <=, >=, <>) to compare a value with any value in a subquery. It returns TRUE if any of the subquery values meet the condition.
-- expression operator ANY (subquery)

-- The ANY operator must be preceded by a comparison operator.
-- The subquery must return a single column of values.
-- The condition evaluates to TRUE if any value returned by the subquery satisfies the comparison.

USE WhereClause
Go

SELECT * FROM PermanentEmployee WHERE Age >= ANY(SELECT MIN(AGE) FROM ContractEmployee);

-- USE any Operator to get the requried results
SELECT * FROM PermanentEmployee WHERE Age>ANY(SELECT Age FROM ContractEmployee);

