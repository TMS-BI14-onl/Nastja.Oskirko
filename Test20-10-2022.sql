--Task 1:

SELECT [ProductSubcategoryID], MIN ([Weight]) AS WGHT
FROM [Production].[Product]
GROUP BY ProductSubcategoryID
HAVING MIN ([Weight])>150
ORDER BY WGHT

--Task 2:
--1
SELECT TOP 1 WITH TIES  [Name],MAX([StandardCost]) AS max_price
FROM [Production].[Product]
GROUP BY Name
ORDER BY max_price DESC

--2
/*
SELECT MAX(StandardCost) AS max_price
FROM [Production].[Product]
*/

SELECT [Name], StandardCost
FROM [Production].[Product]
WHERE StandardCost= (SELECT MAX(StandardCost) AS max_price
FROM [Production].[Product])

--3
/*
SELECT [Name], StandardCost, MAX(StandardCost) OVER () AS max_price
FROM [Production].[Product]
*/

SELECT [Name], StandardCost
FROM ( 
SELECT [Name], StandardCost, MAX(StandardCost) OVER () AS max_price
FROM [Production].[Product]
) T
WHERE StandardCost=max_price


--4
/*
SELECT [Name], StandardCost, RANK() OVER (ORDER BY StandardCost DESC) AS rnk
FROM [Production].[Product]
*/

SELECT [Name], StandardCost
FROM ( 
SELECT [Name], StandardCost, RANK() OVER (ORDER BY StandardCost DESC) AS rnk
FROM [Production].[Product]
) T
WHERE rnk=1

--Task 3:
/*
SELECT Name, MAX(OrderDate) AS last_sale
FROM Store_dim st LEFT JOIN Sale_fct sale ON st.id_Store=sale.id_Store
GROUP BY Name
HAVING DATEDIFF(year, MAX(OrderDate), GETDATE())>1 OR MAX(OrderDate) IS NULL
*/

--Task 4:
/*
SELECT First_Name, Last_Name, COUNT(1) AS cnt
FROM Seller_dim s LEFT JOIN Sale_fct sale ON s.SellerID=sale.SellerID
WHERE WHERE DATEDIFF(year, Date, GETDATE())<15
GROUP BY First_Name, Last_Name
*/

--Task 5:

/*
SELECT email, category, is_read, ROW_NUMBER() OVER (PARTITION BY category) AS row_n
FROM Users u LEFT JOIN Notifications n ON u.id=n.user_id
WHERE email='alex@gmail.com' AND is_read=0-- I am not sure abot syntax. (is_read IS FALSE)
*/

SELECT category
FROM (
SELECT email, category, is_read, ROW_NUMBER() OVER (PARTITION BY category) AS row_n
FROM Users u LEFT JOIN Notifications n ON u.id=n.user_id
WHERE email='alex@gmail.com' AND is_read=0-- I am not sure abot syntax. (is_read IS FALSE)
) T
WHERE row_n>50


