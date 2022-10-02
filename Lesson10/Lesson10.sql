--tASK 3:

/*
SELECT *
FROM [Production].[WorkOrder]

SELECT  Year_order, OrderQty, Month_winter
FROM 
(
SELECT YEAR(DueDate) AS Year_order, OrderQty,
CASE 
	WHEN DATEPART(m, DueDate)=1 THEN 'January'
	WHEN DATEPART(m, DueDate)=2 THEN 'February'
	WHEN DATEPART(m, DueDate)=12 THEN 'December'
	ELSE 'Not winter'
	END AS Month_winter
FROM [Production].[WorkOrder]
) AS t
WHERE Month_winter IN ('January', 'February', 'December')


SELECT YEAR(DueDate) AS Year_order, OrderQty,
CASE 
	WHEN DATEPART(m, DueDate)=1 THEN 'January'
	WHEN DATEPART(m, DueDate)=2 THEN 'February'
	WHEN DATEPART(m, DueDate)=12 THEN 'December'
	ELSE 'Not winter'
	END AS Month_winter
FROM [Production].[WorkOrder]
*/




SELECT Year_order,[January], [February], [December]
FROM (SELECT  Year_order, OrderQty, Month_winter
FROM 
(
SELECT YEAR(DueDate) AS Year_order, OrderQty,
CASE 
	WHEN DATEPART(m, DueDate)=1 THEN 'January'
	WHEN DATEPART(m, DueDate)=2 THEN 'February'
	WHEN DATEPART(m, DueDate)=12 THEN 'December'
	ELSE 'Not winter'
	END AS Month_winter
FROM [Production].[WorkOrder]
) AS t
WHERE Month_winter IN ('January', 'February', 'December')) AS SourceTable
PIVOT
(
SUM(OrderQty)
FOR Month_winter IN ([January], [February], [December])
) AS PivotTable
ORDER BY Year_order

--Task 4(from Lesson). Museum

/*Museum 
excursion_fct(id,id_visitors, id_hall, id_paytype, id_worker, price, id_date_visit, id_discount)
visitors(id_visitors,first_name, last_name, birthday, place_work_or_study)
hall(id_hall,name, floor, square)
paytype(id_paytype,paytype)
worker_of_museum(id_worker,first_name, last_name, phone_number, position, emploee_number, date_of_employment)
date_visit(id_date_visit, day, time)
discount(id_discount, place_work_or_study, day, time)

1)Find person, who have discount on Sunday?
2)Whict hall is more popular?
*/