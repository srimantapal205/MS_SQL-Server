USE [sql_exercise]
GO

CREATE TABLE machineActivity (
    machine_id   INT,
    process_id   INT,
    activity_type VARCHAR(10),  -- 'start' or 'end'
    timestamp    DECIMAL(6,3)   -- to store fractional seconds
);
INSERT INTO machineActivity (machine_id, process_id, activity_type, timestamp) VALUES
(0, 0, 'start', 0.712),
(0, 0, 'end',   1.520),
(0, 1, 'start', 3.140),
(0, 1, 'end',   4.120),
(1, 0, 'start', 0.550),
(1, 0, 'end',   1.550),
(1, 1, 'start', 0.430),
(1, 1, 'end',   1.420),
(2, 0, 'start', 4.100),
(2, 0, 'end',   4.512),
(2, 1, 'start', 2.500),
(2, 1, 'end',   5.000);


SELECT * FROM machineActivity;
WITH ProcessTime AS(
	SELECT 
		start_time. machine_id, 
		start_time.process_id,
		ROUND(end_time.timestamp-start_time.timestamp, 3) AS Duration
	FROM
	machineActivity start_time
	JOIN machineActivity end_time
	ON start_time.machine_id= end_time.machine_id
	AND start_time.process_id= end_time. process_id
	AND start_time.activity_type= 'start'
	AND end_time.activity_type='end'
),
AverageTimes AS(
	SELECT 
		machine_id,
		ROUND(AVG(Duration),3)AS processing_time 
	FROM ProcessTime
	GROUP BY machine_id
)
SELECT * FROM AverageTimes;