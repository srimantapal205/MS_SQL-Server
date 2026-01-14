/*
Employees earning above company average but below departmentmax;
Problem Statement:
Find employees who:
	Earn more than the company-wide average salary
	Earn less than the highest salary in their own department
*/
USE [DaysSqlPractice_30];
GO

CREATE TABLE employee5table (
    emp_id        INT PRIMARY KEY,
    emp_name      VARCHAR(50),
    department_id INT,
    salary        INT
);

INSERT INTO employee5table (emp_id, emp_name, department_id, salary) VALUES
(1, 'Alice', 10, 60000),
(2, 'Bob',   10, 90000),
(3, 'Carol', 10, 120000),
(4, 'Dan',   20, 70000),
(5, 'Eve',   20, 110000),
(6, 'Frank', 20, 150000);

SELECT * FROM employee5table;

SELECT * FROM employee5table e WHERE salary > (SELECT AVG(salary) FROM employee5table)
    AND salary < (
        SELECT MAX(salary) FROM employee5table WHERE department_id = e.department_id
    ) 