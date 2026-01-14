/*
Identify employees who haven't received a salary raise in more thana year
Problem Statement:
Given:
	an employees table 
	a salary_history table that records salary changes
Find employees who have not received any salary increase in the last 1 year.
*/
USE [DaysSqlPractice_30];
GO

CREATE TABLE employees2Table (
    emp_id   INT PRIMARY KEY,
    emp_name VARCHAR(50)
);

INSERT INTO employees2Table (emp_id, emp_name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'Diana');

CREATE TABLE salary_history_2_table (
    emp_id      INT,
    change_date DATE,
    new_salary  INT,
    FOREIGN KEY (emp_id) REFERENCES employees2Table(emp_id)
);

INSERT INTO salary_history_2_table (emp_id, change_date, new_salary) VALUES
(1, '2023-01-10', 80000),
(1, '2024-06-01', 90000),
(2, '2022-12-15', 70000),
(3, '2024-03-20', 85000);

SELECT * FROM employees2Table;
SELECT * FROM salary_history_2_table;

SELECT 
    e.emp_id, e.emp_name, sh.change_date, sh.new_salary 
FROM 
    employees2Table AS e 
LEFT JOIN 
    salary_history_2_table AS sh 
ON 
    e.emp_id = sh.emp_id AND sh.change_date > = DATEADD(YEAR, -2, GETDATE())
WHERE sh.emp_id IS NULL