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

SELECT userName FROM user_preferences GROUP BY userName HAVING COUNT(DISTINCT(game)) > 1;
