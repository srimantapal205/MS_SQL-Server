/*
Problem Statement Given anemployees table with hire_date , create a report showing: Employees joined per year
A running (cumulative) total of hires over the years

*/


USE DaysSqlPractice_30;
GO


CREATE TABLE employee_hire (
    employee_id INT PRIMARY KEY,
    name        VARCHAR(50),
    hire_date   DATE
);

INSERT INTO employee_hire (employee_id, name, hire_date) VALUES
(1, 'Alice', '2019-02-10'),
(2, 'Bob',   '2019-07-01'),
(3, 'Carol', '2020-03-15'),
(4, 'David', '2021-06-20'),
(5, 'Emma',  '2021-09-05'),
(6, 'Frank', '2022-01-10');


SELECT DISTINCT
    YEAR(hire_date) AS join_year,
    COUNT(*) OVER(
        PARTITION BY  YEAR(hire_date)
    ) AS yearly_hires,
    COUNT(*) OVER(
        ORDER BY  YEAR(hire_date)
    ) AS running_total
FROM
    employee_hire
ORDER BY join_year DESC;