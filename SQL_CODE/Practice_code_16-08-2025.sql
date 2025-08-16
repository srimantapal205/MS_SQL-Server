USE [tutorial]
GO

CREATE TABLE Employees
(
  EmployeeID int,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  ManagerID int 
)


INSERT INTO Employees VALUES (1, 'Harper', 'Westbrook', NULL);
INSERT INTO Employees VALUES (2, 'Liam', 'Carrington', 1);
INSERT INTO Employees VALUES (3, 'Evelyn', 'Radcliffe', 1);
INSERT INTO Employees VALUES (4, 'Mason', 'Albright', 2);
INSERT INTO Employees VALUES (5, 'Isla', 'Whitman', 2);
INSERT INTO Employees VALUES (6, 'Noah', 'Sterling', 3);
INSERT INTO Employees VALUES (7, 'Ruby', 'Lennox', 3);
INSERT INTO Employees VALUES (8, 'Caleb', 'Winslow', 5);
INSERT INTO Employees VALUES (9, 'Avery', 'Sinclair', 6);
INSERT INTO Employees VALUES (10, 'Oliver', 'Beckett', 6);



