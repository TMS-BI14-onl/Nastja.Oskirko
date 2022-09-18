--Task 6

CREATE TABLE Patients
(
	ID			INT IDENTITY,
	FirstName	NVARCHAR(50),
	LastName	NVARCHAR(50),
	SSN			UNIQUEIDENTIFIER DEFAULT NEWID(),
	Email		AS CONCAT(UPPER(LEFT(FirstName,1)), LOWER(LEFT(LastName,3)), '@mail.com') PERSISTED,
	Temp		DEC(4,2),
	CreatedDate	DATE
)
--Task 7

INSERT INTO Patients (FirstName, LastName, Temp, CreatedDate)
VALUES
	(N'Katja', N'Muller', '37.20', '2022-08-28'),
	(N'Stefan', N'Zeising', '36.70', '2022-09-13'),
	(N'Gabi', N'Fullmich', '36.90', '2022-09-01')
--3 rows affected

--Task 8

ALTER TABLE  [dbo].[Patients] ADD TempType AS 
(
	CASE WHEN Temp<37 THEN  '< 37°C'
	ELSE  '> 37°C'
	END
)
--37°C is in '> 37°C'

--Task 9

CREATE VIEW dbo.Patients_v
AS
SELECT Temp*9/5 + 32 AS TempF
FROM Patients

/*
SELECT *
FROM dbo.Patients_v
*/

--Task 10

CREATE FUNCTION dbo.unf_PatientsFarinGet (@Temp DEC(4,2))
RETURNS DEC(4,2)
AS
BEGIN
	RETURN @Temp*9/5 + 32
END

/*
SELECT *, dbo.unf_PatientsFarinGet (Temp) AS FARINGET
FROM Patients
*/

--Task 11

--first day of month
DECLARE @Date DATE=DATEADD(day,1, EOMONTH(GETDATE(), -1))   
SELECT  
CASE WHEN DATEPART(DW, @Date) <=5 THEN @Date  
	 WHEN DATEPART(DW, @Date) =6 THEN DATEADD(day,2, @Date) 
	 ELSE DATEADD(day,3, @Date)
	 END 'first_work_day_of_month'

