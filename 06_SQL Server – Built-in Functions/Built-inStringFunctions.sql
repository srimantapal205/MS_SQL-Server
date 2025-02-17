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


-- Remove the white space from any string
-- For left side use LTRIM()
SELECT LTRIM('     Hello World')

-- For Right side RTRIM()

SELECT RTRIM('Hello World       ')


-- Fro remove left and right side space

SELECT LTRIM(RTRIM('     Hello World         '))


--- Convert string to upper case and lowe case

SELECT UPPER('convert string to upper case')

SELECT LOWER('CONVERT STRING TO LOWER CASE')
SELECT LOWER('A, B ,C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z')

-- Reverse string

SELECT REVERSE('A, B ,C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z')


-- Get length of any string with space
SELECT LEN('Get String Length   ')


-- Display the specific number of characters based on left and right

SELECT LEFT('ABCD', 2)
SELECT RIGHT('ABCD', 2)

-- Get the character index
SELECT CHARINDEX('@', 'test@test.com')

-- using sub string

-- Dynamically retrive the string

SELECT SUBSTRING('test@test.com', (CHARINDEX('@', 'test@test.com')+1), (LEN('test@test.com')-CHARINDEX('@', 'test@test.com')))






