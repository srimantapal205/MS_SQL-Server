USE [sql_exercise]
Go
/*
A table named “famous” has two columns called user id and follower id. 
It represents each user ID has a particular follower ID. These follower IDs are also users.
Then, find the famous percentage of each user. 
Famous Percentage = number of followers a user has / total number of users on the platform.
*/

CREATE TABLE famous (user_id INT, follower_id INT);

INSERT INTO famous VALUES
(1, 2), (1, 3), (2, 4), (5, 1), (5, 3), 
(11, 7), (12, 8), (13, 5), (13, 10), 
(14, 12), (14, 3), (15, 14), (15, 13);
SELECT  * FROM famous;

WITH distinct_users AS(
	SELECT user_id as users from famous
	UNION
	SELECT follower_id as users FROM famous
),
flower_user_count AS (
	SELECT user_id, COUNT(follower_id) as followers FROM famous GROUP BY user_id
)
SELECT 
	f.user_id, 
	(f.followers * 100.0) / (SELECT COUNT(*) FROM distinct_users) AS famous_percentage
FROM flower_user_count f;