USE [sql_exercise]
GO

CREATE TABLE Flights (
    ID INT,
    FlightName VARCHAR(50),
    Source VARCHAR(50),
    Destination VARCHAR(50)
);

INSERT INTO Flights (ID, FlightName, Source, Destination) VALUES
(1, 'flight1', 'Delhi', 'Hyderabad'),
(1, 'flight2', 'Hyderabad', 'Kochi'),
(1, 'flight3', 'Kochi', 'Mangalore'),
(2, 'flight1', 'Mumbai', 'Ayodhya'),
(2, 'flight2', 'Ayodhya', 'Gorakhpur');

SELECT * FROM Flights;

WITH Journy AS (
	SELECT *,
		ROW_NUMBER() OVER(PARTITION BY ID ORDER BY FlightName) AS sur_num,
		ROW_NUMBER() OVER(PARTITION BY ID ORDER BY FlightName DESC) dest_num
	From Flights
),
Start_Journy AS (
	SELECT ID, FlightName, Source, sur_num FROM Journy WHERE sur_num = 1
),
Destination_Journy AS (
	SELECT ID, FlightName, Destination, dest_num	FROM Journy WHERE dest_num = 1
)
SELECT s.ID,  s.Source, d.Destination  FROM Start_journy s JOIN Destination_Journy d ON s.ID = d.id;



WITH RECURSIVE FlightPaths AS (
    -- Start with each customer's first known flight
    SELECT
        cust_id,
        origin,
        destination,
        origin AS journey_origin,
        destination AS journey_destination
    FROM Flights

    UNION ALL

    -- Recursively join to find the next leg of the trip
    SELECT
        f.cust_id,
        fp.origin,
        f.destination,
        fp.journey_origin,
        f.destination
    FROM Flights f
    INNER JOIN FlightPaths fp
        ON f.cust_id = fp.cust_id AND f.origin = fp.journey_destination
)

-- Final result: Only show the complete journey per customer
SELECT
    cust_id,
    journey_origin AS Origin,
    journey_destination AS Final_Destination
FROM FlightPaths
WHERE journey_destination NOT IN (
    SELECT origin FROM Flights
)
GROUP BY cust_id, journey_origin, journey_destination;