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
SELECT 
    CONCAT(YEAR(sale_date), '-', RIGHT('0' + CAST(MONTH(sale_date) AS VARCHAR(2)), 2)) AS month_name, 
    COUNT(1) AS sales_count 
FROM Sales
GROUP BY YEAR(sale_date), MONTH(sale_date)
ORDER BY month_name;

-- 19. Calculate the number of days between the current date and the sale date for each sale.
SELECT sale_id, DATEDIFF(DAY, sale_date, GETDATE()) AS Day_Since_Sale FROM Sales

-- 20. Identify sales made during weekdays versus weekends.
SELECT sale_date,  
	CASE
		WHEN DATEPART(WEEKDAY, sale_date) IN (1, 7) THEN 'WeekEnd'
		ELSE 'Weekday'
	END AS day_type
FROM Sales

-- SQL Practice Exercises for Advanced
SELECT * FROM Products;
SELECT * FROM Sales;
--1. List the Top 3 Products by Revenue Contribution Percentage
SELECT TOP 3
	p.product_name,  
	SUM(s.total_price) AS Total_Revenue,
	(SUM(s.total_price) / (SELECT SUM(total_price) FROM Sales)) * 100 AS Revenue_Percentage
FROM Sales s 
	JOIN  Products p ON s.product_id = p.product_id
	GROUP BY p.product_name
	ORDER BY Revenue_Percentage DESC

-- 2. Write a query to create a view named Total_Sales that displays the total sales amount for each product along with their names and categories.

CREATE VIEW Total_Sales AS
SELECT  
	p.product_name,
	p.category,
	SUM(s.total_price) AS total_sales_amount
FROM Products p 
	JOIN Sales s ON p.product_id = s.product_id
	GROUP BY p.product_name, p.category;

SELECT * FROM Total_Sales ORDER BY total_sales_amount DESC;

-- 3. Retrieve the product details (name, category, unit price) for products that have a quantity sold greater than the average quantity sold across all products.
SELECT product_name, category, unit_price FROM Products 
WHERE product_id IN (
		SELECT product_id FROM Sales GROUP BY product_id
		HAVING SUM(quantity_sold) > (SELECT AVG(quantity_sold) FROM Sales)
	);

-- 4. Explain the significance of indexing in SQL databases and provide an example scenario where indexing could significantly improve query performance in the given schema.
-- Create an index on the sales table
CREATE INDEX idx_sales_date ON  Sales(sale_date)

SELECT * FROM Sales WHERE sale_date = '2024-01-03';

-- 5. Add a foreign key constraint to the Sales table that references the product_id column in the Products table.
ALTER TABLE Sales ADD CONSTRAINT fk_product_id_key FOREIGN KEY (product_id) REFERENCES Products(product_id)

-- 6. Create a view named Top_Products that lists the top 3 products based on the total quantity sold.
SELECT * FROM Products;
SELECT * FROM Sales;

CREATE VIEW Top_Products AS
	SELECT TOP 3
		p.product_name, 
		SUM(s.quantity_sold) AS total_quantity_sold FROM Sales s 
		JOIN Products p ON s.product_id = p.product_id 
		GROUP BY p.product_name
		ORDER BY total_quantity_sold DESC

SELECT * FROM Top_Products


-- 7. Implement a transaction that deducts the quantity sold from the Products table when a sale is made in the Sales table, ensuring that both operations are either committed or rolled back together.

--8. Create a query that lists the product names along with their corresponding sales count.
SELECT p.product_name, COUNT(s.sale_id) AS Sales_Count FROM Products p LEFT JOIN Sales s ON p.product_id = s.product_id GROUP BY p.product_name

-- 9. Write a query to find all sales where the total price is greater than the average total price of all sales.
SELECT * FROM Sales WHERE total_price > (SELECT AVG(total_price) FROM Sales)

--09-04-2024
SELECT * FROM Sales;
SELECT * FROM Products;
-- 10. Analyze the performance implications of indexing the sale_date column in the Sales table, considering the types of queries commonly executed against this column.

--Query without indexing
EXPLAIN ANALYZE SELECT * FROM Sales WHERE sale_date = '2024-01-01';
-- Query with indexing
CREATE INDEX idx_sale_date ON Sales (sale_date);
EXPLAIN ANALYZE SELECT * FROM Sales WHERE sale_date = '2024-01-01';

-- 11. Add a check constraint to the quantity_sold column in the Sales table to ensure that the quantity sold is always greater than zero.
ALTER TABLE Sales ADD CONSTRAINT chk_quentity_sold CHECK (quantity_sold > 0);

-- QUERY To check if the constraint is applied successfully
SELECT * FROM Sales;

-- 12. Create a view named Product_Sales_Info that displays product details along with the total number of sales made for each product.
CREATE VIEW Product_Sales_Info AS
SELECT
	p.product_id, p.product_name, p.category, p.unit_price, COUNT(s.sale_id) AS total_sales 
FROM 
	Products p
LEFT JOIN 
	Sales s ON p.product_id = s.product_id
GROUP BY
	p.product_id, p.product_name, p.category, p.unit_price;

SELECT * FROM Product_Sales_Info;

-- 15. Write a query that calculates the total revenue generated from each category of products for the year 2024.
SELECT 
	p.category,
	SUM(s.total_price) AS total_revenue
FROM
	Sales s
JOIN 
	Products p ON s.product_id = p.product_id
WHERE
	FORMAT(s.sale_date, '%Y') = '2024'
GROUP BY 
	p.category;

-- 2. Customers Who Never Ordered
USE [MARKETPLACEDB]
GO
SELECT * FROM [Sales].[Customer]
SELECT * FROM [Sales].[Product]
SELECT * FROM [Sales].[Transactions]

SELECT  (C.FristName +' '+ C.LastName) AS FullName FROM [Sales].[Customer] AS C LEFT JOIN [Sales].[Transactions] T ON C.CustomerId = T.Customer_ID WHERE T.Customer_ID IS NULL;

-- 4. Running Total (Cumulative Sum)
SELECT TransactionDate, SUM(TotalAmount) OVER(ORDER BY TransactionDate ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS Running_Tortal FROM [Sales].[Transactions]

