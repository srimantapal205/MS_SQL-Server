USE WhereClause
GO


SELECT ASCII('A');

SELECT ASCII('A') AS UpperCase, ASCII('a') AS LowerCase; 

-- Printing uppercase alphabets using CHAR() function

DECLARE @Number int
SET @Number = 65
WHILE(@Number <= 90)
BEGIN
	PRINT(@Number)
	SET @Number = @Number +1
END

-- Printing Lower case Number using CHAR() function

DECLARE @NUMBER2 int
SET @NUMBER2 = 97
WHILE(@NUMBER2 <=122)
BEGIN
	PRINT CHAR(@NUMBER2)
	SET @NUMBER2 = @NUMBER2+1
END

-- Another way to print lower case alphabets using CHAR() and LOWER() function
DECLARE @Number3 int
SET @Number3 = 65
WHILE (@Number3 <= 90)
BEGIN
	PRINT CHAR(@Number3)
	PRINT LOWER(CHAR(@Number3))
	SET @Number3 = @Number3 + 1
END








