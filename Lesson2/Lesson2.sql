--Для первого задания подключить базу данных AdventureWorks2017

--1 a)
SELECT *
FROM Sales.SalesTerritory

--1 b)
SELECT TerritoryID, Name
FROM Sales.SalesTerritory

--1 c)
SELECT *
FROM Person.Person
WHERE LastName = 'Norman'

--1 d)
SELECT *
FROM Person.Person
WHERE EmailPromotion!=2


--3
/* примеры еще нескольких агрегатных функций,которые существуют в языке T-SQL:
-GROUPING
-STDEV
-STRING_AGG
-VAR
-и др.
*/


--Для четвертого задания подключить базу данных AdventureWorks2017

--4 a)
SELECT COUNT(DISTINCT PersonType)
FROM Person.Person
WHERE LastName LIKE 'M%' OR EmailPromotion!=1

--4 b)
SELECT TOP 3 *
FROM Sales.SpecialOffer
WHERE StartDate>='2013-01-01' AND EndDate<='2014-01-01'
ORDER BY DiscountPct DESC


--4 c)
SELECT MIN(Weight) AS MinWeight, MAX(Size) AS MaxSize
FROM Production.Product

