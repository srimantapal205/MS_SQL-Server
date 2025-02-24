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