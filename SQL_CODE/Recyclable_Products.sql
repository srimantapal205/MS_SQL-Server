--Recyclable and Low Fat Products
USE [sql_exercise]
GO
-- Create the schema in SQL Server
CREATE TABLE FatProducts (
    product_id INT PRIMARY KEY,
    low_fats CHAR(1) NOT NULL CHECK (low_fats IN ('Y', 'N')),
    recyclable CHAR(1) NOT NULL CHECK (recyclable IN ('Y', 'N'))
);

-- Insert sample data
INSERT INTO FatProducts (product_id, low_fats, recyclable) VALUES
(1, 'Y', 'Y'), -- low fat & recyclable
(2, 'Y', 'N'), -- low fat & not recyclable
(3, 'N', 'Y'), -- not low fat & recyclable
(4, 'N', 'N'), -- neither low fat nor recyclable
(5, 'Y', 'Y'),
(6, 'N', 'Y'),
(7, 'Y', 'N'),
(8, 'N', 'N'),
(9, 'Y', 'Y'),
(10, 'N', 'Y');


/*

Write a solution to find the ids of products that are both low fat and recyclable.

Return the result table in any order.

*/

SELECT * FROM FatProducts;

SELECT * FROM  FatProducts WHERE low_fats = 'Y' AND recyclable = 'y';




