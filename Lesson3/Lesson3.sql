--Task from Lesson 2(4d):

SELECT ProductSubcategoryID, MIN(Weight) AS min_WEIGHT, MAX(Size) AS max_SIZE
FROM [Production].[Product]
GROUP BY ProductSubcategoryID

--Task from Lesson 2(4e):

SELECT ProductSubcategoryID, MIN(Weight) AS min_WEIGHT, MAX(Size) AS max_SIZE
FROM [Production].[Product]
WHERE COLOR IS NOT NULL
GROUP BY ProductSubcategoryID


--Task from Lesson 3:

--Task 2a):

SELECT Name, 
CASE WHEN StandardCost=0 OR StandardCost IS NULL THEN 'Not for sale'
	 WHEN StandardCost>0 AND StandardCost<100 THEN '<$100'
	 WHEN StandardCost>=100 AND StandardCost<500 THEN '<$500'
	 ELSE '>=$500'
END PriceRange
FROM Production.Product

--Task 2b):

SELECT ProductID, v.BusinessEntityID, Name
FROM Purchasing.Vendor v LEFT JOIN Purchasing.ProductVendor pv ON v.BusinessEntityID=pv.BusinessEntityID
WHERE (Name LIKE '%X%' OR Name LIKE 'N%') AND StandardPrice>10


--Task 2c):

SELECT Name
FROM Purchasing.Vendor v LEFT JOIN Purchasing.ProductVendor pv ON v.BusinessEntityID=pv.BusinessEntityID
WHERE pv.BusinessEntityID IS NULL


--Task 3a):

SELECT p.Name, StandardCost
FROM Production.Product p LEFT JOIN Production.ProductModel pm ON p.ProductID=pm.ProductModelID
WHERE p.Name LIKE 'LL%' 


/*if we have another Name with 'LL', but don't have a Price for it(it is mean, the Name of Product is from Production.ProductModell), we use so: (but Price is NULL)
(SELECT p.Name, StandardCost
FROM Production.Product p FULL JOIN Production.ProductModel pm ON p.ProductID=pm.ProductModelID
WHERE p.Name LIKE 'LL%') 
UNION
(SELECT pm.Name, StandardCost
FROM Production.Product p FULL JOIN Production.ProductModel pm ON p.ProductID=pm.ProductModelID
WHERE pm.Name LIKE 'LL%')
*/

--Task 3b):

(SELECT DISTINCT Name
FROM Purchasing.Vendor)
UNION
(SELECT DISTINCT Name
FROM Sales.Store)
ORDER BY Name


--Task 3c):

SELECT p.Name, COUNT(DiscountPct) AS number_of_discount
FROM ((Sales.SpecialOfferProduct sp LEFT JOIN Sales.SpecialOffer s ON sp.SpecialOfferID=s.SpecialOfferID) RIGHT JOIN Production.Product p ON p.ProductID=sp.ProductID) 
WHERE DiscountPct>0
GROUP BY Name
HAVING COUNT(DiscountPct)>1
