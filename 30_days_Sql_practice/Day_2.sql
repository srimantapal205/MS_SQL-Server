USE DaysSqlPractice_30;
GO

CREATE TABLE employees (
    id   INT PRIMARY KEY,
    name VARCHAR(50),
    dept VARCHAR(50)
);

INSERT INTO employees (id, name, dept) VALUES
(1, 'Alice', 'IT'),
(2, 'Bob', 'HR'),
(3, 'Carol', 'Finance'),
(4, 'David', 'IT');


CREATE TABLE salary_history (
    employee_id INT,
    salary      INT,
    change_date DATE,
    FOREIGN KEY (employee_id) REFERENCES employees(id)
);

INSERT INTO salary_history (employee_id, salary, change_date) VALUES
(1, 60000, '2021-05-01'),
(1, 70000, '2023-03-01'),
(2, 50000, '2020-01-01'),
(3, 80000, '2024-01-15');


/*
Problem Statement: 
    Given: employees table (master data), salary_history table (tracks salary change events)
1. Find employees
2. whose salary has NOT changed in the last 2 years.
*/

SELECT 
    e.* 
FROM 
    employees e
LEFT JOIN 
    salary_history sh ON e.id = sh.employee_id
AND
    sh.change_date >= DATEADD(YEAR, - 3, CAST(GETDATE() AS DATE))
WHERE sh.employee_id IS NULL;




