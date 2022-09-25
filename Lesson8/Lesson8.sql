--Task 2:
--I created a new Databases: TestHW8 for this task. Then I used CROSS JOIN on the same table(it is like CROSS JOIN+SELF JOIN on the time).
--There are 1000 rows in the Table MOCK_DATA. It means, that 1000*1000=1000000(when we will use CROSS JOIN). So, we don't need to write TOP 1000000 in SELECT.

SELECT *
FROM [dbo].[MOCK_DATA]

SELECT f.first_name, s.last_name
FROM [dbo].[MOCK_DATA] f CROSS JOIN [dbo].[MOCK_DATA] s 

--Task 3:

--When can we use WITH?
--WITH uses, when subquery should be done several times.

--What is different between CTE and subquery?
--CTE can be reqursive
--it is more readable than subquery
--we give the name for CTE and use this CTE many time (we link on this name). We don't need to rewrite our code
