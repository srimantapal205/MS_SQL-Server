USE TestTempDB;

--Primary Key and Foreign key Relationship Between Multiple Tables

--Creating Customer Table
CREATE TABLE CustomeDetail
(
	Cid INT PRIMARY KEY,
	Cname VARCHAR(40),
	Cmobno CHAR(10)
);

INSERT INTO CustomeDetail VALUES(1, 'Raj', '1234567890');
INSERT INTO CustomeDetail VALUES(2, 'Rajesh', '1234567890');
INSERT INTO CustomeDetail VALUES(3, 'Rajeev', '1234567890');

SELECT * FROM CustomeDetail;

-- Create Products Table
CREATE TABLE Products (
	Pcode INT PRIMARY KEY,
	Pname VARCHAR(40),
	Price MONEY
);

INSERT INTO Products VALUES(101, 'Laptop', 50000);
INSERT INTO Products VALUES(102, 'Mobile', 20000);
INSERT INTO Products VALUES(103, 'Tablet', 10000);
INSERT INTO Products VALUES(104, 'Desktop', 30000);
INSERT INTO Products VALUES(105, 'Printer', 15000);
INSERT INTO Products VALUES(106, 'Scanner', 10000);
INSERT INTO Products VALUES(107, 'Keyboard & Mouse', 2000);

SELECT * FROM Products;

--Create Order Table
CREATE TABLE Orders (
	OdId INT PRIMARY KEY,
	OdDate  DATETIME DEFAULT GETDATE(),
	Quantity INT,
	Cid INT FOREIGN KEY REFERENCES CustomeDetail(Cid),
	Pcode INT FOREIGN KEY REFERENCES Products(Pcode)
)

INSERT INTO Orders VALUES(1, '2017/12/20', 2, 1, 101);
INSERT INTO Orders VALUES(2, '2017/12/21', 3, 2, 102);
INSERT INTO Orders VALUES(3, '2017/12/22', 4, 3, 103);
INSERT INTO Orders VALUES(4, '2017/12/23', 5, 1, 104);
INSERT INTO Orders VALUES(5, '2017/12/24', 6, 2, 105);
INSERT INTO Orders VALUES(6, '2017/12/25', 7, 3, 106);
INSERT INTO Orders VALUES(7, '2017/12/26', 8, 1, 107);


--Add Constraint to an existing table
ALTER TABLE Orders ADD CONSTRAINT fk_Cid FOREIGN KEY(Cid) REFERENCES CustomeDetail(Cid);
ALTER TABLE Orders ADD CONSTRAINT fk_Pcode FOREIGN KEY(Pcode) REFERENCES Products(Pcode);

--Create a table with out using the constraint keyword and primary key
CREATE TABLE EMP(EMPID INT, ENAME VARCHAR(30), SALARY MONEY)

-- NOT NULL Constraint for an existing column in a table
ALTER TABLE EMP ALTER COLUMN EMPID INT NOT NULL

--Add Primary Key to an existing table
ALTER TABLE EMP ADD CONSTRAINT X PRIMARY KEY (EMPID)


--Adding a unique constraint to an existing column in the table.
ALTER TABLE EMP ADD CONSTRAINT Y UNIQUE(ENAME)

-- Adding CHECK constraint to an existing column in a table

ALTER TABLE EMP ADD CONSTRAINT Z CHECK(SALARY > 8000)


-- Remove constraints from an existing table
ALTER TABLE EMP DROP CONSTRAINT Y;

-- Drop primary ke constraint from an existing table before need to remove the foreign key constraint from the table and then drop the primary key constraint.