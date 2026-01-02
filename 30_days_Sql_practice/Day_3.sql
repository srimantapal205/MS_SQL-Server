USE DaysSqlPractice_30;
GO

/*
Problem Statement Given an employee_department_history table that tracks department assignments over time,find employees who have worked in 
more than one department.
*/

CREATE TABLE employee_department_history (
    employee_id   INT,
    department_id INT,
    start_date    DATE,
    end_date      DATE,
    FOREIGN KEY (employee_id) REFERENCES employees(id)
);

INSERT INTO employee_department_history
(employee_id, department_id, start_date, end_date) VALUES
(1, 10, '2019-01-01', '2020-06-30'),
(1, 20, '2020-07-01', '2023-03-31'),
(2, 10, '2021-01-01', NULL),
(3, 30, '2018-01-01', '2019-12-31'),
(3, 30, '2020-01-01', NULL),
(4, 40, '2022-01-01', '2022-12-31'),
(4, 50, '2023-01-01', NULL);

SELECT * FROM employee_department_history;

-- 
SELECT 
    employee_id
FROM employee_department_history
GROUP BY employee_id
HAVING COUNT(DISTINCT department_id) > 1
