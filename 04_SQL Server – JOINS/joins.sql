USE WhereClause
GO

SELECT * FROM Employee;
SELECT * FROM [dbo].[Projects];

--Inner Join
SELECT ID AS EmployeeId, Name, DepartmentID, City, Title As Project, ClientId FROM Employee INNER JOIN Projects ON Employee.Id = [Projects].EmployeeId

SELECT Name As 'Employee Name', EmailID, City, Title AS 'Assign Project' FROM Employee JOIN [Projects] ON Employee.ID = [Projects].EmployeeId;

-- Left Outer JOIN
SELECT ID AS Employee_Id, Name AS Employee_Name, DepartmentID, City, Title AS Project_Name, ClientId  FROM Employee LEFT OUTER JOIN Projects ON Employee.ID = Projects.EmployeeId; 
-- OR
--Left JOin
SELECT ID AS EmployeeId, Name AS Employee_Name, DepartmentId, City, Title AS Project_Name, ClientId FROM Employee LEFT JOIN Projects ON Employee.ID = Projects.EmployeeId


-- Right Outer Join 

SELECT ID AS Employee_ID, Name AS Emplyee_Name, City, DepartmentID, Title AS Project_Name, ClientId From Employee RIGHT OUTER JOIN Projects ON Employee.ID = Projects.EmployeeId;
SELECT ID AS Employee_ID, Name AS Emplyee_Name, City, DepartmentID, Title AS Project_Name, ClientId From Employee RIGHT JOIN Projects ON Employee.ID = Projects.EmployeeId;

-- FULL OUTER JOIN 
SELECT E.ID AS Employee_Id, E.Name AS Employee_Name, E.City, D.Name AS Department_Name, P.Title AS Project_Name  
	FROM Employee AS E 
	RIGHT JOIN Department AS D  ON E.DepartmentID = D.ID 
	FULL OUTER JOIN Projects AS P ON E.ID = P.EmployeeId ORDER BY Employee_Id ;

SELECT * FROM Department;


----Cross Join

SELECT Employee.ID AS Employee_ID, Employee.Name AS Employee_Name, Employee.City, Projects.Title AS Project_Nme FROM Employee CROSS JOIN Projects; 

