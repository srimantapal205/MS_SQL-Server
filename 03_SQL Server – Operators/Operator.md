## SQl Operator
<p>
SQL provides various operators to perform operations on data, grouped into categories like Assignment, Arithmetic, Comparison, Logical, and Set operators. Here's a quick overview:
</p>

### Assignment Operator :
    Used to assign values to variables or columns.

    =: Assigns a value
    SET @variable = 10;
    UPDATE employees SET salary = 50000 WHERE id = 1;

### Arithmetic Operators
    Used to perform mathematical calculations on numerical data.    

| Operator	| Description   |	Example |
| ------------- | ------------- | ------------- |
|+|	Addition|	SELECT 10 + 5|;
|-|	Subtraction|	SELECT 10 - 5|;
|*|	Multiplication|	SELECT 10 * 5|;
|/|	Division|	SELECT 10 / 5|;
|%|	Modulus (remainder)	|SELECT 10 % 3;|

### Comparison Operators
Used to compare two values and return a Boolean result (TRUE, FALSE, or NULL).

|Operator 	Description	Example
|=	Equal to	SELECT * FROM table WHERE age = 30;
|!= or <>	Not equal to	SELECT * FROM table WHERE age != 30;
|>	Greater than	SELECT * FROM table WHERE salary > 50000;
|<	Less than	SELECT * FROM table WHERE salary < 50000;
|>=	Greater than or equal to	SELECT * FROM table WHERE salary >= 50000;
|<=	Less than or equal to	SELECT * FROM table WHERE salary <= 50000;
|BETWEEN	Within a range	SELECT * FROM table WHERE age BETWEEN 20 AND 30;
|IN	Matches a set of values	SELECT * FROM table WHERE age IN (25, 30, 35);
|LIKE	Pattern matching	SELECT * FROM table WHERE name LIKE 'A%';
|IS NULL	Checks for NULL values	SELECT * FROM table WHERE column_name IS NULL;