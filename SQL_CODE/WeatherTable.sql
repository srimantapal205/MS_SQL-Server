USE [sql_exercise];
GO

-- Drop if exists
IF OBJECT_ID('Weather', 'U') IS NOT NULL DROP TABLE Weather;
GO

-- Create Weather table
CREATE TABLE Weather (
    id INT PRIMARY KEY,
    recordDate DATE NOT NULL,
    temperature INT NOT NULL
);

-- Insert sample data
INSERT INTO Weather (id, recordDate, temperature) VALUES
(1, '2025-08-01', 30),
(2, '2025-08-02', 32),  -- hotter than 30
(3, '2025-08-03', 31),  -- cooler than 32
(4, '2025-08-04', 35),  -- hotter than 31
(5, '2025-08-05', 34),  -- cooler than 35
(6, '2025-08-06', 36);  -- hotter than 34

/*
Write a solution to find all dates' id with higher temperatures compared to its previous dates (yesterday).
Return the result table in any order.
*/

SELECT today.id as tempId FROM Weather AS today JOIN  Weather AS Yesterday ON DATEDIFF(DAY, Yesterday.recordDate, today.recordDate) = 1 WHERE today.temperature > Yesterday.temperature;
