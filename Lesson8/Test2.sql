--Test2

--Task 1:


SELECT [FirstName], [MiddleName], [LastName],[PhoneNumber]
FROM [Person].[Person] p LEFT JOIN [Person].[PersonPhone] ph ON p.BusinessEntityID=ph.BusinessEntityID
WHERE PhoneNumber LIKE '4%5'

--Task 2:

--I'M CONFUSED WITH THE DATE FUNCTIONS. AND TASK 3 IS NOT FULL

SELECT *,
CASE WHEN (YEAR(GETDATE())-YEAR([BirthDate]))>=17 AND (YEAR(GETDATE()-YEAR([BirthDate]))<=20 THEN 'Adolescence'
	WHEN (YEAR(GETDATE())-YEAR([BirthDate]))>=21 AND (YEAR(GETDATE()-YEAR([BirthDate]))<=59 THEN 'Adults'
	WHEN (YEAR(GETDATE())-YEAR([BirthDate]))>=60 AND (YEAR(GETDATE()-YEAR([BirthDate]))<=75 THEN 'Elderly'
	WHEN (YEAR(GETDATE())-YEAR([BirthDate])>=76 AND (YEAR(GETDATE()-YEAR([BirthDate]))<=90 THEN 'Elderly'
	ELSE 'Not found'
	END  as Category
FROM [HumanResources].[Employee]

SELECT *,
CASE WHEN (DATEADD(YEAR, -DATEPART(YEAR,BirthDate),DATEPART(YEAR,(GETDATE())))>=17 AND DATEADD(YEAR, -DATEPART(YEAR,BirthDate),DATEPART(YEAR,(GETDATE())))<=20) THEN 'Adolescence'
	--WHEN (DATEADD(YEAR, -YEAR(BirthDate),YEAR(GETDATE()))>=21 AND DATEADD(YEAR, -YEAR(BirthDate),YEAR(GETDATE()))<=59) THEN 'Adults'	
	--WHEN (DATEADD(YEAR, -YEAR(BirthDate),YEAR(GETDATE()))>=60 AND DATEADD(YEAR, -YEAR(BirthDate),YEAR(GETDATE()))<=75) THEN 'Elderly'
	--WHEN (DATEADD(YEAR, -YEAR(BirthDate),YEAR(GETDATE()))>=76 AND DATEADD(YEAR, -YEAR(BirthDate),YEAR(GETDATE()))<=90) THEN 'Senile'
	--WHEN (GETDATE()-[BirthDate]>=21 AND GETDATE()-[BirthDate]<=59) THEN 'Adults'
	--WHEN (GETDATE()-[BirthDate]>=60 AND GETDATE()-[BirthDate]<=75) THEN 'Elderly'
	--WHEN (GETDATE()-[BirthDate]>=76 AND GETDATE()-BirthDate<=90) THEN 'Elderly'
	ELSE 'Not found'
	END  Category
FROM [HumanResources].[Employee]

--Task 3:

SELECT *
FROM [Production].[Product]

SELECT [Color], MAX([StandardCost]) AS max_cost
FROM [Production].[Product]
GROUP BY  Color










--TASK 4:

/*Museum 
excursion_fct(id,visitor, hall, paytype,guide, price, date,discount)
visitors(id,fname, lname, age, school, work)
hall(id,type_exhibition)
paytype(id,paytype)
guide(id,fname, lname, age, position, profile)
date(id,day, time)
discount(id, age, day, time)

1)Find person, who have discount on weekdays?
2)Whict hall is more popular?
*/