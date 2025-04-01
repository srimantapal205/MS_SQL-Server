CREATE DATABASE MarketPlace;
USE MarketPlace
GO

-- https://www.geeksforgeeks.org/sql-exercises/
-- Create Sales table

CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    quantity_sold INT,
    sale_date DATE,
    total_price DECIMAL(10, 2)
);

-- Insert sample data into Sales table

INSERT INTO Sales (sale_id, product_id, quantity_sold, sale_date, total_price) VALUES
(1, 101, 5, '2024-01-01', 2500.00),
(2, 102, 3, '2024-01-02', 900.00),
(3, 103, 2, '2024-01-02', 60.00),
(4, 104, 4, '2024-01-03', 80.00),
(5, 105, 6, '2024-01-03', 90.00);

-- Create Products table

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    unit_price DECIMAL(10, 2)
);

-- Insert sample data into Products table

INSERT INTO Products (product_id, product_name, category, unit_price) VALUES
(101, 'Laptop', 'Electronics', 500.00),
(102, 'Smartphone', 'Electronics', 300.00),
(103, 'Headphones', 'Electronics', 30.00),
(104, 'Keyboard', 'Electronics', 20.00),
(105, 'Mouse', 'Electronics', 15.00);

-- 1. Retrieve all columns from the tables
SELECT * FROM Sales;
SELECT * FROM Products;

-- 2. Retrieve the product_name and unit_price from the Products table.
SELECT product_name, unit_price FROM Products;
-- 3. Retrieve the sale_id and sale_date from the Sales table.
SELECT sale_id, sale_date FROM Sales ;

-- 4. Filter the Sales table to show only sales with a total_price greater than $100
SELECT * FROM Sales WHERE total_price > 100;

-- 5. Filter the Products table to show only products in the 'Electronics' category.
SELECT * FROM Products WHERE category = 'Electronics'

-- 6. Retrieve the sale_id and total_price from the Sales table for sales made on January 3, 2024.
SELECT sale_id, total_price FROM Sales WHERE sale_date = '2024-01-03';

-- 7. Retrieve the product_id and product_name from the Products table for products with a unit_price greater than $100.
SELECT product_id, product_name FROM Products WHERE unit_price > 100;

-- 8. Calculate the total revenue generated from all sales in the Sales table.

SELECT SUM(total_price) AS total_revenue FROM Sales;

-- 9. Calculate the average unit_price of products in the Products table.
SELECT * FROM Products;
SELECT AVG(unit_price) AS average_unit_price FROM Products; -- 173.000000

--ROUND function (for fixed decimal places):
SELECT ROUND(AVG(unit_price), 2) AS average_unit_price FROM Products; -- 173.000000
--CAST function (for integer output):
SELECT CAST(AVG(unit_price) AS INT) AS average_unit_price FROM Products; -- 173 


-- 10. Calculate the total quantity_sold from the Sales table.


SELECT SUM(quantity_sold) AS quantity_sold FROM Sales;


-- 26-03-2025 ------------
-- 11. Count Sales Per Day from the Sales table


SELECT DISTINCT sale_date , SUM(quantity_sold) AS Total_Quentity_count FROM Sales GROUP BY sale_date;

SELECT sale_date, COUNT(*) AS Sale_count FROM Sales GROUP BY sale_date ORDER BY sale_date;

-- 12 Retrieve product_name and unit_price from the Products table with the Highest Unit Price.


SELECT product_name, unit_price FROM Products ORDER BY unit_price DESC OFFSET 0  ROWS FETCH NEXT 1 ROW ONLY; 

SELECT TOP 1 product_name, unit_price  FROM Products ORDER BY unit_price DESC;

SELECT *  FROM Products WHERE unit_price = (SELECT MAX(unit_price) FROM Products);

SELECT product_name, MAX(unit_price) AS HighestUnitPrice FROM Products GROUP BY product_name HAVING MAX(unit_price) = (SELECT MAX(unit_price) FROM Products);

-- 13. Retrieve the sale_id, product_id, and total_price from the Sales table for sales with a quantity_sold greater than 4.
SELECT sale_id, product_id, total_price FROM Sales WHERE quantity_sold > 4

-- 14. Retrieve the product_name and unit_price from the Products table, ordering the results by unit_price in descending order.
SELECT product_name, unit_price FROM Products ORDER BY unit_price DESC;

-- 15. Retrieve the total_price of all sales, rounding the values to two decimal places.
SELECT ROUND(SUM(total_price), 2) AS TotalPrice FROM Sales

-- 16. Calculate the average total_price of sales in the Sales table.
SELECT ROUND(AVG(total_price),2) AS Avarage_Total_Price FROM Sales

-- 17. Retrieve the sale_id and sale_date from the Sales table, formatting the sale_date as 'YYYY-MM-DD'.
SELECT sale_id, FORMAT(sale_date, 'yyyy-MM-dd' ) AS Formated_date FROM Sales

-- 18. Calculate the total revenue generated from sales of products in the 'Electronics' category.
SELECT category AS Product_Category,  SUM(total_price) AS TOTAL_Revenue_By_catagory FROM Sales INNER JOIN Products ON Sales.product_id = Products.product_id GROUP BY Products.category;

SELECT SUM(total_price) AS TOTAL_Revenue_By_Electronics_catagory FROM Sales INNER JOIN Products ON Sales.product_id = Products.product_id WHERE category = 'Electronics';

-- 19. Retrieve the product_name and unit_price from the Products table, filtering the unit_price to show only values between $20 and $600.
SELECT product_name, unit_price  FROM Products WHERE unit_price BETWEEN  20 AND 600;

--20. Retrieve the product_name and category from the Products table, ordering the results by category in ascending order.
SELECT product_name, category  FROM  Products ORDER BY category ASC;

-- 27-03-2025

--1. Calculate the total quantity_sold of products in the 'Electronics' category.
SELECT SUM(quantity_sold) AS Total_Quentity_Sold, category AS Sold_Quentity_BY_Category FROM Sales INNER JOIN Products ON Sales.product_id = Products.product_id WHERE category='Electronics' GROUP BY category;

SELECT SUM(quantity_sold) AS Total_Quentity_Sold, category AS Sold_Quentity_BY_Category FROM Sales INNER JOIN Products ON Sales.product_id = Products.product_id GROUP BY category

-- 2. Retrieve the product_name and total_price from the Sales table, calculating the total_price as quantity_sold multiplied by unit_price.
SELECT product_name, unit_price*quantity_sold AS total_price FROM Sales INNER JOIN Products ON Sales.product_id = Products.product_id;

-- 3. Identify the Most Frequently Sold Product from Sales table
SELECT product_id, COUNT(*) AS Sales_Count FROM Products GROUP BY product_id ORDER BY Sales_Count DESC;

-- 4. Find the Products Not Sold from Products table
SELECT product_id, product_name FROM Products WHERE product_id NOT IN (SELECT DISTINCT product_id FROM Sales);

-- 5. Calculate the total revenue generated from sales for each product category.
SELECT category AS Category_Revenue, SUM(quantity_sold*unit_price) AS total_revenue FROM Sales INNER JOIN Products ON Sales.product_id = Products.product_id GROUP BY category


-- 6. Find the product category with the highest average unit price.
SELECT category, AVG(unit_price) AS  Higest_Avarage_Price  FROM Products  GROUP BY category ORDER BY AVG(unit_price) DESC

-- 7. Identify products with total sales exceeding 30.

SELECT * FROM Sales FULL JOIN Products ON Sales.product_id = Products.product_id;

SELECT product_name FROM Sales INNER JOIN Products ON Sales.product_id = Products.product_id GROUP BY product_name;

-- 28-03-2025
SELECT * FROM Sales;
SELECT * FROM Products;

-- 8. Count the number of sales made in each month.
SELECT FORMAT(s.sale_date, 'yyyy-%MM') AS monthly_count,COUNT(*) AS Sales_count FROM Sales s GROUP BY FORMAT(s.sale_date, 'yyyy-%MM') ORDER BY monthly_count;

-- Retrieve Sales Details for Products with 'Smart' in Their Name
SELECT Sales.sale_id, Sales.sale_date, Sales.product_id, Sales.quantity_sold, Sales.total_price FROM Sales INNER JOIN Products ON Sales.product_id = Products.product_id  WHERE Products.product_name LIKE 'Smart%' 

-- 10. Determine the average quantity sold for products with a unit price greater than $100.
SELECT AVG(quantity_sold) AS AVG_Count  FROM Sales INNER JOIN Products ON Sales.product_id = Products.product_id WHERE unit_price > 100;

-- 11. Retrieve the product name and total sales revenue for each product.

SELECT p.product_name, SUM(s.total_price) AS Total_revenue FROM Products p INNER JOIN Sales s ON p.product_id = s.product_id GROUP BY p.product_name ORDER BY Total_revenue DESC;

-- 12. List all sales along with the corresponding product names.
SELECT s.sale_id, s.product_id, p.product_name FROM Sales s INNER JOIN Products p ON s.product_id = p.product_id

-- 13. Retrieve the product name and total sales revenue for each product.
SELECT p.category, 
		SUM(s.total_price) AS category_Sales_Revenue, 
		(SUM(s.total_price)/(SELECT SUM(total_price) FROM Sales))*100 AS Revenue_Percentage 
FROM Sales s 
JOIN Products p 
ON s.product_id = p.product_id 
GROUP BY p.category
ORDER BY Revenue_Percentage DESC;

--14. Rank products based on total sales revenue.

SELECT 
	p.product_name,
	SUM(s.total_price) AS Total_revenue,
	RANK() OVER(ORDER BY SUM(s.total_price) DESC) AS Revenue_Rank
FROM Sales s JOIN Products p ON s.product_id = p.product_id 
GROUP BY p.product_name;


-- 15. Calculate the running total revenue for each product category.
SELECT 
	p.category, 
	p.product_name, 
	s.sale_date,
	SUM(s.total_price) OVER(PARTITION BY p.category ORDER BY s.sale_date) AS running_total_revenue
FROM Sales s JOIN Products p ON s.product_id = p.product_id

-- 01-04-2025
SELECT 

-- 16. Categorize sales as "High", "Medium", or "Low" based on total price (e.g., > $200 is High, $100-$200 is Medium, < $100 is Low).
SELECT sale_id, 
	CASE 
		WHEN total_price > 200 THEN 'High'
		WHEN total_price BETWEEN 100 AND 200 THEN 'Medium'
		ELSE 'Low'
	END AS sales_category
FROM Sales;

--17. Identify sales where the quantity sold is greater than the average quantity sold.
SELECT * FROM Sales WHERE quantity_sold > (SELECT AVG(quantity_sold) FROM Sales)

-- 18. Extract the month and year from the sale date and count the number of sales for each month.
SELECT CONCAT(YEAR(sale_date), '-', LPAD(MONTH(sale_date), 2, 0) ) AS month_name, COUNT(1) AS sales_count FROM Sales







