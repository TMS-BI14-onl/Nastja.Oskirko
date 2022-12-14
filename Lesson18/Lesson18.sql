--Task 1:


SELECT EMPLOEE_ID, FIRST_NAME, LAST_NAME
FROM  EMPLOEES E LEFT JOIN (
SELECT MANAGER_ID, COUNT(1) AS cnt
FROM EMPLOYEES
GROUP BY MANAGER_ID
)  T  ON E.MANAGER_ID=T.MANAGER_ID
WHERE EMPLOYEE_ID=E.MANAGER_ID AND cnt>=6



--Task 2:
/*
SELECT DEPARTMENT_ID, MAX((SALARY-(SALARY*COMMISSION_PCT/100))) AS max_of_dep, MIN((SALARY-(SALARY*COMMISSION_PCT/100))) AS min_of_dep
FROM EMPLOEES
GROUP BY DEPARTMENT_ID
*/

SELECT DEPARTMENT_NAME, max_of_dep, min_of_dep
FROM DEPARTMENTS D LEFT JOIN 
(
SELECT DEPARTMENT_ID, MAX((SALARY-(SALARY*COMMISSION_PCT/100))) AS max_of_dep, MIN((SALARY-(SALARY*COMMISSION_PCT/100))) AS min_of_dep
FROM EMPLOEES
GROUP BY DEPARTMENT_ID

) T ON D.DEPARTMENT_ID=T.DEPARTMENT_ID

--Task 3:

SELECT REGION_NAME
FROM 
(
SELECT REGION_NAME, COUNT(1) AS cnt
FROM REGIONS R LEFT JOIN COUNTRIES C ON R.REGION_ID=C.REGION_ID
			   LEFT JOIN LOCATIONS L ON C.COUNTRY_ID=L.COUNTRY_ID
			   LEFT JOIN DEPARTMENTS D ON L.LOCATION_ID=D.LOCATION_ID
			   LEFT JOIN EMPLOYEES E ON D.DEPARTMENT_ID=E.DEPARTMENT_ID
GROUP BY REGION_NAME
) T
WHERE cnt=
(
SELECT MAX(cnt)
FROM
(
SELECT REGION_NAME, COUNT(1) AS cnt
FROM REGIONS R LEFT JOIN COUNTRIES C ON R.REGION_ID=C.REGION_ID
			   LEFT JOIN LOCATIONS L ON C.COUNTRY_ID=L.COUNTRY_ID
			   LEFT JOIN DEPARTMENTS D ON L.LOCATION_ID=D.LOCATION_ID
			   LEFT JOIN EMPLOYEES E ON D.DEPARTMENT_ID=E.DEPARTMENT_ID
GROUP BY REGION_NAME
) T ) TT

--use CTE:

WITH TEMP AS 
(
SELECT REGION_NAME, COUNT(1) AS cnt
FROM REGIONS R LEFT JOIN COUNTRIES C ON R.REGION_ID=C.REGION_ID
			   LEFT JOIN LOCATIONS L ON C.COUNTRY_ID=L.COUNTRY_ID
			   LEFT JOIN DEPARTMENTS D ON L.LOCATION_ID=D.LOCATION_ID
			   LEFT JOIN EMPLOYEES E ON D.DEPARTMENT_ID=E.DEPARTMENT_ID
GROUP BY REGION_NAME
)
SELECT REGION_NAME
FROM TEMP
WHERE cnt= (SELECT MAX(cnt) 
			FROM TEMP
			) T

--Task 4:


SELECT DEPARTMENT_NAME, DIFF=((avg_common-avg_of_dep)*100/avg_common) --WE CAN USE HIER ABS:   DIFF=(ABS((avg_common-avg_of_dep))*100/avg_common)
FROM DEPARTMENTS D LEFT JOIN 
(
SELECT DEPARTMENT_ID, AVG(SALARY) OVER (PARTITION BY DEPARTMENT_ID)AS avg_of_dep, AVG(SALARY) OVER () AS avg_common
FROM EMPLOEES
) T ON D.DEPARTMENT_ID=T.DEPARTMENT_ID


--Task 5:

SELECT FIRST_NAME, LAST_NAME
FROM EMPLOYEES E LEFT JOIN JOB_HISTORY JH ON E.EMPLOYEE_ID=JH.EMPLOYEE_ID
WHERE DATEDIFF(year, START_DATE, END_DATE)>=10

--Task 6:

SELECT FIRST_NAME, LAST_NAME, RATING
FROM
(
SELECT FIRST_NAME, LAST_NAME, DENSE_RANK() OVER (ORDER BY SALARY DESC) AS RATING
FROM EMPLOYEES
) T
WHERE RATING BETWEEN 5 AND 10