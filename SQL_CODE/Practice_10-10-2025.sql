USE [tutorial]
GO

CREATE TABLE monthly_cards_issued (
    card_name VARCHAR(50),
    issued_amount INT,
    issue_month INT,
    issue_year INT
);

INSERT INTO monthly_cards_issued (card_name, issued_amount, issue_month, issue_year)
VALUES
('Chase Freedom Flex', 55000, 1, 2021),
('Chase Freedom Flex', 60000, 2, 2021),
('Chase Freedom Flex', 65000, 3, 2021),
('Chase Freedom Flex', 70000, 4, 2021),
('Chase Sapphire Reserve', 170000, 1, 2021),
('Chase Sapphire Reserve', 175000, 2, 2021),
('Chase Sapphire Reserve', 180000, 3, 2021);

INSERT INTO monthly_cards_issued (card_name, issued_amount, issue_month, issue_year)
VALUES
('Chase Freedom Flex', 75000, 5, 2021),
('Chase Sapphire Reserve', 185000, 4, 2021);

SELECT * FROM monthly_cards_issued;

SELECT 
	card_name,
	MAX(issued_amount) - MIN(issued_amount) AS Diffrence
FROM monthly_cards_issued
GROUP BY card_name;

-- see the difference as a new column for each row (using window functions)
SELECT 
    card_name,
    issue_month,
    issue_year,
    issued_amount,
    MAX(issued_amount) OVER (PARTITION BY card_name) 
        - MIN(issued_amount) OVER (PARTITION BY card_name) AS Max_Min_Difference
FROM monthly_cards_issued;


-- per-month differences (month-to-month change):

SELECT 
	card_name,
    issue_month,
    issue_year,
    issued_amount,
	issued_amount - LAG(issued_amount) OVER(PARTITION BY card_name ORDER BY issue_month) AS Monthly_diffrence
FROM monthly_cards_issued;

-- Monthly basis next month and previous month prediction
SELECT 
	card_name,
    issue_month,
    issue_year,
    issued_amount,
	LAG (issued_amount) OVER(PARTITION BY card_name ORDER BY issue_month) Prev_month_card_amount,
	LEAD (issued_amount) OVER(PARTITION BY card_name ORDER BY issue_month) Next_month_card_amount
FROM monthly_cards_issued;





