USE [sql_exercise]
GO

-- Drop if exists
IF OBJECT_ID('EmailList2', 'U') IS NOT NULL
    DROP TABLE EmailList2;
GO

-- Create table
CREATE TABLE EmailList2 (
    id INT PRIMARY KEY,
    email VARCHAR(255) NOT NULL
);

-- Insert sample data (with duplicates)
INSERT INTO EmailList2 (id, email) VALUES
(1, 'alice@example.com'),
(2, 'bob@example.com'),
(3, 'charlie@example.com'),
(4, 'alice@example.com'),   -- duplicate
(5, 'eve@example.com'),
(6, 'bob@example.com'),     -- duplicate
(7, 'frank@example.com'),
(8, 'alice@example.com'),   -- duplicate
(9, 'grace@example.com'),
(10,'eve@example.com');     -- duplicate


SELECT * FROM EmailList2;

/*
Write a solution to report all the duplicate emails. Note that it's guaranteed that the email field is not NULL.
Return the result table in any order.
*/
WITH RowNUmberEmailList AS (
	SELECT *, ROW_NUMBER () OVER(PARTITION BY email ORDER BY id) AS RowNunber FROM EmailList2
)
-- SELECT DISTINCT email FROM RowNUmberEmailList WHERE RowNunber > 1; -- Get Duplicate distinct email
-- SELECT * FROM RowNUmberEmailList WHERE RowNunber > 1; -- Get all duplicate value
-- SELECT id, email FROM RowNUmberEmailList WHERE RowNunber = 1;
--SELECT * FROM RowNUmberEmailList;
DELETE FROM RowNUmberEmailList WHERE RowNunber >1;
SELECT * FROM EmailList2;