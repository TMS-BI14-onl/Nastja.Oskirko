
/*

--We use JOIN, because we can have sellers, which didn't make a sales. We don't count them. 
--We SELECT all seller(who has sales) and assign points. It will be  our subquery:

SELECT First_Name, Last_Name, [Employee_Number], COUNT(1) AS cnt, Date,
	CASE WHEN COUNT(1)>10 THEN 3
		WHEN COUNT(1) BETWEEN 5 AND 10 THEN 2
		WHEN COUNT(1)<5 THEN 1
		END  Point
FROM Seller_dim s  JOIN Sales_fct sale ON s.SellerID=sale.SellerID
GROUP BY First_Name, Last_Name,[Employee_Number], Date
ORDER BY [Employee_Number]

*/

SELECT TOP 50 WITH TIES First_Name, Last_Name, SUM(Point) AS all_point
FROM
(
SELECT First_Name, Last_Name, [Employee_Number], COUNT(1) AS cnt, Date,
	CASE WHEN COUNT(1)>10 THEN 3
		WHEN COUNT(1) BETWEEN 5 AND 10 THEN 2
		WHEN COUNT(1)<5 THEN 1
		END  Point
FROM Seller_dim s  JOIN Sales_fct sale ON s.SellerID=sale.SellerID
GROUP BY First_Name, Last_Name,[Employee_Number], Date
--ORDER BY [Employee_Number] -- we don't use ORDER BY in subquery. Early we wrote this for better understanding
) T
GROUP BY First_Name, Last_Name
ORDER BY all_point DESC

--Create VIEW:


CREATE VIEW top50seller AS
SELECT TOP 50 WITH TIES First_Name, Last_Name, SUM(Point) AS all_point
FROM
(
SELECT First_Name, Last_Name, [Employee_Number], COUNT(1) AS cnt, Date,
	CASE WHEN COUNT(1)>10 THEN 3
		WHEN COUNT(1) BETWEEN 5 AND 10 THEN 2
		WHEN COUNT(1)<5 THEN 1
		END  Point
FROM Seller_dim s  JOIN Sales_fct sale ON s.SellerID=sale.SellerID
GROUP BY First_Name, Last_Name,[Employee_Number], Date
--ORDER BY [Employee_Number] -- we don't use ORDER BY in subquery. Early we wrote this for better understanding
) T
GROUP BY First_Name, Last_Name
ORDER BY all_point DESC