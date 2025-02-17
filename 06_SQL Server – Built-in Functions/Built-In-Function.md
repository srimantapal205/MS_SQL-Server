# Microsoft SQL Server (MS SQL), built-in SQL functions
In Microsoft SQL Server (MS SQL), built-in SQL functions are predefined functions that perform operations such as calculations, string manipulations, data transformations, and system information retrieval. These functions help simplify queries and improve performance.

#### Categories of Built-in SQL Functions in MS SQL Server:
## 1. String Functions (Work with text data)
+ **LEN(string)** – Returns the length of a string.
+ **UPPER(string)** – Converts a string to uppercase.
+ **LOWER(string)** – Converts a string to lowercase.
+ **LTRIM(string)** – Removes leading spaces from a string.
+ **RTRIM(string)** – Removes trailing spaces from a string.
+ **SUBSTRING(string, start, length)** – Extracts a substring.
+ **CHARINDEX(substring, string)** – Finds the position of a substring.
+ **REPLACE(string, old, new)** – Replaces occurrences of a substring.
+ **CONCAT(string1, string2, …)** – Concatenates multiple strings.
## 2. Numeric Functions (Perform calculations on numeric data)
+ **ABS(number)** – Returns the absolute value.
+ **ROUND(number, decimal_places)** – Rounds a number.
+ **CEILING(number)** – Rounds up to the nearest integer.
+ **FLOOR(number)** – Rounds down to the nearest integer.
+ **POWER(base, exponent)** – Returns the result of a number raised to a power.
+ **SQRT(number)** – Returns the square root.
+ **RAND([seed])** – Generates a random number.
## 3. Date & Time Functions (Manipulate date and time values)
+ **GETDATE()** – Returns the current date and time.
+ **CURRENT_TIMESTAMP** – Equivalent to GETDATE().
+ **DATEADD(interval, number, date)** – Adds a time interval to a date.
+ **DATEDIFF(interval, start_date, end_date)** – Returns the difference between two dates.
+ **DATENAME(interval, date)** – Returns part of a date as a string.
+ **DATEPART(interval, date)** – Returns part of a date as an integer.
+ **FORMAT(date, format)** – Formats a date in a specified pattern.
## 4. Aggregate Functions (Operate on multiple rows and return a single value)
+ **SUM(column_name)** – Returns the sum of values in a column.
+ **AVG(column_name)** – Returns the average value.
+ **MIN(column_name)** – Returns the minimum value.
+ **MAX(column_name)** – Returns the maximum value.
+ **COUNT(column_name)** – Returns the number of rows.
## 5. System Functions (Return system-related values)
+ **@@IDENTITY** – Returns the last inserted identity value.
+ **@@ROWCOUNT** – Returns the number of rows affected by the last statement.
+ **@@VERSION** – Returns SQL Server version details.
+ SCOPE_IDENTITY()** – Returns the last identity value inserted within the current scope.
## 6. Conversion Functions (Convert data types)
+ **CAST(expression AS datatype)** – Converts one data type to another.
+ **CONVERT(datatype, expression, style)** – Converts data types with formatting options.
+ **TRY_CAST(expression AS datatype)** – Returns NULL if conversion fails.
+ **TRY_CONVERT(datatype, expression, style)** – Returns NULL if conversion fails.
## 7. Logical Functions (Return Boolean-like values)
+ **IIF(condition, value_if_true, value_if_false)** – Similar to CASE statement.
+ **CHOOSE(index, value1, value2, …)** – Returns the value at the given index.
## 8. JSON Functions (Work with JSON data)
+ **JSON_VALUE(json, path)** – Extracts a scalar value from JSON.
+ **JSON_QUERY(json, path)** – Extracts an object or array from JSON.
+ **ISJSON(expression)** – Checks if an expression is valid JSON.