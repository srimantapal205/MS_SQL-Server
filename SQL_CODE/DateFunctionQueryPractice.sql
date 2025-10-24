USE DateFunctionPractice;
GO
-- Step 4: Practice Date Functions

-- 1. GETDATE() → Current system date/time
SELECT GETDATE() AS CurrentDateTime;

-- 2. SYSDATETIME()
SELECT SYSDATETIME() CurrentDateTime;

SELECT * FROM EmployeeAttendance
-- 3. DATEPART() → Extract part of date
SELECT 
	EmpName, 
	DATEPART(YEAR, JoiningDate) AS JoingYear, 
	DATEPART(MONTH, JoiningDate) AS JoiningMonth
FROM EmployeeAttendance;

-- 4. DATENAME() → Get textual date parts
SELECT EmpName,AttendanceDate, DATENAME(WEEKDAY, AttendanceDate) AS AttendanceDayName FROM EmployeeAttendance;

-- 5. DAY(), MONTH(), YEAR()
SELECT EmpName, DAY(BirthDate) AS BirthDay, MONTH(BirthDate) AS BirthMonth, YEAR(BirthDate) AS BirthYear FROM EmployeeAttendance;

-- 6. DATEADD() → Add/Subtract days, months, years
SELECT 
	EmpName, JoiningDate,
	DATEADD(DAY, 10, JoiningDate) AS JoiningPlus10Day 
FROM EmployeeAttendance;

-- 7. DATEDIFF() → Difference between two dates
SELECT 
	EmpName,
	JoiningDate,
	GETDATE() AS CurrentDate,
	DATEDIFF(YEAR, JoiningDate, GETDATE()) AS YearsOfWORK
FROM EmployeeAttendance;


SELECT 
	EmpName,
	JoiningDate,
	GETDATE() AS CurrentDate,
	DATEDIFF(YEAR, JoiningDate, GETDATE()) AS YearsOfWORK,
	CAST(DATEDIFF(MONTH, JoiningDate, GETDATE()) / 12 AS numeric(10,2))  AS WorkTimeInYears,
	CAST(DATEDIFF(MONTH, JoiningDate, GETDATE()) / 12.0 AS numeric(10,2))  AS WorkTimeInYears,
	ROUND(CAST(DATEDIFF(MONTH, JoiningDate, GETDATE()) AS DECIMAL(10, 1)) / 12.0, 2)  AS WorkTime_using_Round,
	CAST(DATEDIFF(MONTH, JoiningDate, GETDATE()) AS DECIMAL(10,2)) / 12 AS WorkTimeInYears_using_CAST,
	FORMAT(DATEDIFF(MONTH, JoiningDate, GETDATE()) / 12, 'N2')  AS WorkTimeInYears_using_Format
FROM EmployeeAttendance;

-- 8. EOMONTH() → Last day of month
SELECT EmpName, EOMONTH(JoiningDate) AS MontEndDate FROM EmployeeAttendance

-- 9. FORMAT() → Custom date formatting
SELECT 
	EmpName, 
	FORMAT(JoiningDate, 'dd-MMM-yyyy') FormatedDate FROM EmployeeAttendance;

-- 10. ISDATE() → Validate if value is a date
SELECT ISDATE('2025-01-01') AS InvalidDate, ISDATE('invalid-date') AS InvalidCheck;

-- 11. CONVERT() → Convert date format
SELECT EmpName, CONVERT(varchar(20), JoiningDate, 103) AS DateIsDDMMYYYY FROM EmployeeAttendance;

-- 12. CAST() → Convert type
SELECT CAST(JoiningDate AS DATETIME) AS JoingDateTime FROM EmployeeAttendance;

-- 13. DATEFROMPARTS()

-- 14. SWITCHOFFSET() (Time zone adjustment)

-- 15. TODATETIMEOFFSET()

-- 16. CURRENT_TIMESTAMP (same as GETDATE)

-- 17. DATE_TRUNC() (SQL Server 2022+ / Postgres)

-- 18. LEAP YEAR check



