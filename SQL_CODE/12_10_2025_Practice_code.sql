USE [sql_exercise];
GO

CREATE TABLE user_preferences (
    userName VARCHAR(50),
    game VARCHAR(50)
);

INSERT INTO user_preferences (userName, game) VALUES
('Suresh', 'Football'),
('Mahesh', 'Cricket'),
('Ramesh', 'Badminton'),
('Suresh', 'Cricket'),
('Dinesh', 'Football'),
('Dinesh', 'Badminton');

INSERT INTO user_preferences (userName, game) VALUES
('Mahesh', 'Football');

SELECT userName FROM user_preferences WHERE game IN ('Football', 'Cricket') GROUP BY userName HAVING COUNT(DISTINCT game) = 2;

WITH multiGamePlayer AS(
	SELECT
		userName,
		game,
		COUNT(game) OVER(PARTITION BY userName) AS playgamecount
	FROM user_preferences
)
SELECT * FROM  multiGamePlayer
WHERE game IN ('Football', 'Cricket') AND playgamecount = 2;


SELECT DISTINCT userName
FROM user_preferences
WHERE game IN ('Football', 'Cricket');

SELECT userName FROM user_preferences WHERE game =  'Football'
INTERSECT
SELECT userName FROM user_preferences WHERE game =  'Cricket'

SELECT 
	a.userName AS Name
FROM 
	user_preferences a  
JOIN 
	user_preferences b 
ON 
	a.userName = b.userName
WHERE 
	a.game = 'Football'
AND
	b.game = 'Cricket';

CREATE TABLE PersonVehicle (
    Person NVARCHAR(10),
    Vehicle NVARCHAR(20)
);

-- Step 3: Insert sample data
INSERT INTO PersonVehicle (Person, Vehicle) VALUES
('A', 'Cycle'),
('A', 'Bike'),
('A', 'Car'),
('B', 'Cycle'),
('C', 'Bike'),
('C', 'Car');

-- Step 4: View the data
SELECT * FROM PersonVehicle;


SELECT p1.Person FROM PersonVehicle p1
JOIN PersonVehicle p2
ON
p1.Person = p2.Person
WHERE p1.Vehicle = 'Cycle' AND p2.Vehicle = 'Cycle';

SELECT * FROM PersonVehicle WHERE Vehicle = 'Cycle'
INTERSECT
SELECT * FROM PersonVehicle WHERE Vehicle = 'Cycle'

SELECT Person FROM PersonVehicle GROUP BY Person HAVING COUNT(DISTINCT Vehicle) = 1 AND MAX(Vehicle) = 'Cycle';

SELECT DISTINCT Person FROM PersonVehicle WHERE Person NOT IN (SELECT Person FROM PersonVehicle WHERE Vehicle <> 'Cycle') AND Vehicle = 'Cycle';

WITH PersonVehicleCount AS (
	SELECT 
		Person, 
		Vehicle,
		COUNT(*) OVER(PARTITION BY Person) VehicleCount
	FROM PersonVehicle
)
SELECT 
	Person, 
	Vehicle, 
FROM 
	PersonVehicleCount 
WHERE Vehicle = 'Cycle' AND VehicleCount = 1;

