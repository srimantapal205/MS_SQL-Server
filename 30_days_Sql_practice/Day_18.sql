/*
	Find consecutive days with sales above a threshold;
    Problem Statement: Identify continuous date ranges (streaks) where daily sales were above a given threshold (e.g., amount >1000).
*/

CREATE TABLE sales_8 (
    sale_date DATE,
    amount    INT
);

INSERT INTO sales_8 (sale_date, amount) VALUES
('2024-01-01', 800),
('2024-01-02', 1200),
('2024-01-03', 1500),
('2024-01-04', 900),
('2024-01-05', 1300),
('2024-01-06', 1600),
('2024-01-07', 1700);

SELECT * FROM sales_8;

WITH flagged_sales AS(
    SELECT 
        sale_date,
        amount,
        CASE WHEN amount> 1000 THEN 1 ELSE 0 END AS flag
),
groups AS(
    SELECT 
        
)