--Task 1:
/*

INSERT INTO manufacturer 
SET name = 'HP',
country_id = (
		SELECT id
         FROM country
        WHERE name = 'Америка')


		OR

INSERT INTO manufacturer (name, country_id)
VALUES ('HP', 4)


--Task2:
UPDATE user SET age=age/3
WHERE name='Андрей'

--Task 3:
SELECT  TOP 1 WITH TIES name, MAX(price) 
FROM  product 
GROUP BY name
ORDER BY DESC


SELECT name, price
FROM product
(
SELECT   name, price, RANK() OVER (ORDER BY price) AS rnk
FROM  product  
)
WHERE rnk=1

--Task 4:

SELECT u.name, ph.name, age
FROM user u FULL JOIN phone ph ON ph.user_id=u.id
WHERE ph.name LIKE '+3%4' OR age >35


--Task 5:
SELECT TOP 5 WITH TIES name
FROM 
(
SELECT u.name, user_id, COUNT(product_id) OVER (PARTITION BY user_id) AS cnt
FROM user u JOIN order o ON u.id=o.user_id  
)
ORDER BY cnt

					
*/