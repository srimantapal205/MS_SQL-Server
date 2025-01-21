-- Comparison Operators
USE WhereClause;
SELECT * FROM Employee;

--The equal (=) 
SELECT * FROM Employee WHERE City = 'MUMBAI'

--Not Equal (!=) Operator 
SELECT * FROM Employee WHERE City != 'MUMBAI';

--Not Equal (<>) Operator 

SELECT * FROM Employee WHERE City <> 'MUMBAI';

--Greater Than (>) Operator 

SELECT * FROM Employee WHERE Age > 30;

-- Less  Than (<) Operator
SELECT * FROM Employee WHERE Age < 27;

-- Greater Than or Equal To (>=)
SELECT * FROM Employee WHERE Salary >= 30000;
-- Less Than or Equal To (<=)
SELECT * FROM Employee WHERE Salary <= 60000;

--Not Greater Than (!>)
SELECT * FROM Employee WHERE Salary !> 28000;

--Not Less Than (!<) 
SELECT * FROM Employee WHERE Salary !< 34000;

--Multiple Comparison 
SELECT * FROM Employee WHERE  Salary >=30000 AND Salary <= 60000;
