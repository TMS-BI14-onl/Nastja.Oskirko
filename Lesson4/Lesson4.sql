--Task 3:

--The functions Row Number, Rank and Dense Rank are the same, when the columns(for example, which used in ORDER BY) don't have duplicate

--Task 4a):

SELECT UnitMeasureCode
FROM Production.UnitMeasure
WHERE UnitMeasureCode LIKE 'T%'
--NO UnitMeasureCode, which has start with 'T'

SELECT COUNT(DISTINCT UnitMeasureCode) AS UniqCode
FROM Production.UnitMeasure
--38 uniq code

INSERT INTO Production.UnitMeasure (UnitMeasureCode, Name, ModifiedDate)
VALUES ('TT1', 'Test 1', CAST('09-09-2020' AS DATETIME))
--1 ROW AFFECTED
--we can add both 'Test 1' and 'Test 2' together. I didn't read all task, and made step by step

SELECT UnitMeasureCode
FROM Production.UnitMeasure
WHERE UnitMeasureCode LIKE 'T%'
--UnitMeasureCode with start 'T%' is in Production.UnitMeasure

INSERT INTO Production.UnitMeasure (UnitMeasureCode, Name, ModifiedDate)
VALUES ('TT2', 'Test 2', GETDATE())
--1 ROW AFFECTED

SELECT UnitMeasureCode
FROM Production.UnitMeasure
WHERE UnitMeasureCode LIKE 'T%'
--UnitMeasureCode with start 'T%' is in Production.UnitMeasure

--Task 4b):

--load in new table UnitMeasureCode with start 'T%'
SELECT UnitMeasureCode, Name, ModifiedDate
INTO Production.UnitMeasureTest
FROM Production.UnitMeasure
WHERE UnitMeasureCode LIKE 'T%'
--2 rows affected

--load UnitMeasureCode = ‘CAN’
INSERT INTO Production.UnitMeasureTest (UnitMeasureCode, Name, ModifiedDate)
SELECT UnitMeasureCode, Name, ModifiedDate
FROM Production.UnitMeasure
WHERE UnitMeasureCode = 'CAN'
--1 row affected

--all new table now:
SELECT *
FROM Production.UnitMeasureTest
ORDER BY UnitMeasureCode

--Task 4c):

UPDATE Production.UnitMeasureTest
SET UnitMeasureCode='TTT'
--3 rows affected

--Task 4d):

DELETE 
FROM Production.UnitMeasureTest
--3 rows affected, the Production.UnitMeasureTest is empty

--Task 4e):

SELECT *, MAX(LineTotal) OVER (PARTITION BY SalesOrderID) AS 'MAX',
		  MIN(LineTotal) OVER (PARTITION BY SalesOrderID) AS 'MIN',
		  AVG(LineTotal) OVER (PARTITION BY SalesOrderID) AS 'AVG'
FROM Sales.SalesOrderDetail
WHERE SalesOrderID IN (43659, 43664)

--Task 4f):

SELECT *, DENSE_RANK() OVER (ORDER BY SalesYTD) AS 'RATING'
FROM Sales.vSalesPerson

--added column 'Login':
SELECT *, CONCAT(UPPER(LEFT(LastName, 3)),'login', ISNULL(TerritoryGroup, ' ')) AS 'Login'
FROM Sales.vSalesPerson

SELECT *,
	CONCAT(UPPER(LEFT(LastName, 3)),'login', ISNULL(TerritoryGroup, ' ')) AS 'Login',
	DENSE_RANK() OVER (ORDER BY SalesYTD DESC) AS 'RATING',
	DENSE_RANK() OVER (ORDER BY SalesLastYear DESC) AS 'RATING_LAST_YEAR'
FROM Sales.vSalesPerson
--TOP in this year is Linda Mitchell
--TOP in last year is Ranjit Varkey chudukatil


--Task 4g):



--Task 5:

/*	 
	 count(1)=4
	 count(name)=2
	 count(id)=4
	 count(*)=4
*/