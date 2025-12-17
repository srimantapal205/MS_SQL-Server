USE interview_practice;
GO

-- 1. Find the second highest salary from the Employee table.

SELECT * FROM [dbo].[employees]

SELECT MAX(salary) AS second_highest_salary FROM employees WHERE salary < (SELECT MAX(salary) FROM employees);


-- 2. Find duplicate records in the Employee table.

SELECT name AS emp_name , COUNT(*) AS Count_Emp FROM employees GROUP BY name HAVING COUNT(*) > 1;


-- 3. Retrieve employees who earn more than their manager.
SELECT 
	e.name AS Emp_Name, 
	e.Salary AS Emp_Salary, 
	m.name  AS Manager_Name, 
	m.salary AS ManagerSalary 
FROM 
	employees e JOIN employees  m 
ON 
	e.id = m.id 
WHERE 
	e.salary < m.salary;

-- 4. Count employees in each department having more than 5 employees.

SELECT department_id, COUNT(id) AS Emp_count FROM employees GROUP BY department_id HAVING COUNT(*) > 5; 


-- 5 Find employees who joined in the last 6 months.

WITH MonthDifEmp AS (
	SELECT 
		*,
		DATEDIFF(MONTH, hire_date, GETDATE()) AS Date_month
	FROM employees
)
SELECT * FROM MonthDifEmp WHERE Date_month < = 6; 


-- 6. Get departments with no employees.

SELECT * FROM [dbo].[departments];

SELECT department_name FROM departments d LEFT JOIN employees e ON d.department_id = e.department_id WHERE e.id IS NULL;


-- 7. Write a query to find the median salary.
SELECT 
	AVG(salary) AS Avarage_Salary 
FROM 
	(SELECT 
		salary 
	FROM 
		employees 
	ORDER BY 
		salary LIMIT 2 - (SELECT COUNT(*) FROM employees) % 2 OFFSET(SELECT COUNT(*) -1) /  2 FROM emp employees)
		
	) AS medial_sbuquery;

-- 8. Running total of salaries by department.
SELECT
	name, 
	department_id, 
	salary,
	SUM(salary), OVER(PARTITION BY department_id ORDER BY id) AS running_total
FROM 
	employees