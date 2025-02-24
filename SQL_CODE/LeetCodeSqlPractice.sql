-- Create a database for practice codding. 
CREATE DATABASE CommonPracticDB;

USE CommonPracticDB
GO

CREATE  TABLE Person (
	PersonId INT IDENTITY(1,1) CONSTRAINT person_pk PRIMARY KEY ,
	FirstName VARCHAR(30),
	LastName VARCHAR(30)
)
INSERT INTO Person(FirstName, LastName) VALUES  ('John', 'Doe'),
    ('Jane', 'Smith'),
    ('Michael', 'Johnson'),
    ('Emily', 'Davis'),
    ('David', 'Brown');


CREATE TABLE AddressBook(
	AddreeId INT IDENTITY(1,1) CONSTRAINT addreess_pk PRIMARY KEY,
	PersonID INT CONSTRAINT personid_fk FOREIGN KEY (PersonId) REFERENCES Person(PersonId),
	City VARCHAR(30),
	State VARCHAR(30)
)

INSERT INTO AddressBook(PersonID, City, State ) VALUES (1, 'New York', 'NY'),
    (2, 'Los Angeles', 'CA'),
    (3, 'Chicago', 'IL'),
    (4, 'Houston', 'TX'),
    (5, 'Miami', 'FL');


CREATE TABLE Employee (
	EmpID INT IDENTITY(1,1) CONSTRAINT employee_pk PRIMARY KEY,
	AddressID INT CONSTRAINT address_fk FOREIGN KEY REFERENCES AddressBook(AddreeId),
	EmpName VARCHAR(50) NOT NULL,
    Salary DECIMAL(10,2) NOT NULL
	
)

INSERT INTO Employee(AddressID, EmpName, Salary) VALUES (1, 'Alice Johnson', 60000.00),
    (2, 'Bob Smith', 75000.50),
    (3, 'Charlie Brown', 50000.75),
    (4, 'David Wilson', 82000.25),
    (5, 'Emily Davis', 92000.00);


SELECT * FROM Person;
SELECT * FROM AddressBook;
SELECT * FROM Employee;


SELECT Person.FirstName, Person.LastName, AddressBook.City, AddressBook.State FROM Person LEFT OUTER JOIN AddressBook ON  Person.PersonId = AddressBook.PersonID;


-- Solution 1
SELECT MAX(Salary) Second_Highest_Salary  FROM Employee WHERE Salary < (SELECT MAX(Salary) FROM Employee)

-- Solution 2
WITH CTE AS (SELECT DISTINCT Salary FROM Employee ORDER BY Salary DESC LIMIT 2)
SELECT Salary AS Second_Highest_Salary FROM CTE ORDER BY Salary ASC LIMIT 1;

SELECT DISTINCT Salary FROM Employee ORDER BY Salary DESC OFFSET 1 ROW FETCH NEXT 1 ROW ONLY;



--Solution 4

CREATE FUNCTION getNthHighestSalary(@N INT) RETURN INT 
BEGIN 
	SET N = N-1;
	RETURN (
		SELECT DISTINCT Salary FROM  Employee ORDER BY Salary DESC LIMIT 1 OFFSET N
	)
END


CREATE TABLE RankTable (
	Rank_Id INT IDENTITY(1,1) CONSTRAINT rank_pk  PRIMARY KEY,
	Score DECIMAL(10, 2)
)

INSERT INTO RankTable VALUES  
    (95.50),
    (89.75),
    (76.25),
    (88.00),
    (92.30),
    (81.45),
    (99.10),
    (67.80),
    (85.60),
    (90.20);
	
SELECT * FROM RankTable;

