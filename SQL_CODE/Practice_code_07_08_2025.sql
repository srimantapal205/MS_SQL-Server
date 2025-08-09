USE WhereClause
GO

SELECT * FROM Employee;

SELECT 
	ID AS EmployId,
	Name AS EmplyeeName,
	DepartmentID,
	Salary,
	MAX(Salary) OVER(PARTITION BY DepartmentID ORDER BY DepartmentID ASC) AS MaxSalary_By_Depertment
FROM Employee;

SELECT ID AS EmployId,
	Name AS EmplyeeName,
	DepartmentID, 
	Salary, 
	ROW_NUMBER() OVER(ORDER BY Salary DESC) As RowNumber   -- Assign unique number for each row
FROM Employee;


SELECT ID AS EmployId,
	Name AS EmplyeeName,
	DepartmentID, 
	Salary, 
	RANK() OVER(PARTITION BY DepartmentID ORDER BY Salary DESC) As RankNumber  
FROM Employee ORDER BY RankNumber;

SELECT ID AS EmployId,
	Name AS EmplyeeName,
	DepartmentID, 
	Salary, 
	DENSE_RANK() OVER(PARTITION BY DepartmentID ORDER BY Salary DESC) As DenseRankNumber  
FROM Employee ORDER BY DenseRankNumber;


-- Running Total  = Cumulative sum of a column orderd by some field.
SELECT ID AS EmployId,
	Name AS EmplyeeName,
	DepartmentID, 
	Salary, 
	SUM(Salary) OVER(ORDER BY ID) AS RunningTotal
FROM Employee;

SELECT ID AS EmployId,
	Name AS EmplyeeName,
	DepartmentID, 
	Salary, 
	SUM(Salary) OVER(PARTITION BY DepartmentID ORDER BY ID) AS RunningTotal_Part_Dept
FROM Employee;
-- Use a window function to find the second highest salary in each department
WITH RankedSalary AS( 
	SELECT 
		ID AS EmployId,
		Name AS EmplyeeName,
		DepartmentID, 
		Salary, 
		DENSE_RANK() OVER(PARTITION BY DepartmentID ORDER BY Salary DESC) AS RankedSalary 
	FROM 
		Employee
)
SELECT * FROM RankedSalary ;








