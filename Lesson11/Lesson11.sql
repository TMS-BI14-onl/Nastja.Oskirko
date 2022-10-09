
--If russian language is not readable, see .txt files for practise work 3(PW3)
--ПР 2

/*
Кинопрокат
1. Фильм (id_фильма, название, год выпуска, id_киностудии, id_режиссера, id_актера)
2. Киностудия (id_киностудии, название, год основания)
3. Режиссер (id_режиссера, ФИО, номер паспорта, год рождения, пол)
4. Актеры (id_актера, ФИО, номер паспорта, год рождения, пол)
5. Билеты(id_билета, id_фильма, id_кинотеатра, дата показа, дата продажи, цена)
6. Кинотеатр (id_кинотеатра, название, адрес, телефон)


1)Вывести данные о фильмах и кол-ве проданных билетов в зависимости от того, как рано их покупают (за 1,2, ... дней до показа). Результаты вывести в виде транспорнированной таблицы (оси - название фильма, кол-во дней от продажи до показа)
2)Вывести сведения о фильме с самым большим кассовым сбором за все время. 

1)
SELECT ф.название, [0], [1], [2], [3],...
FROM
(
SELECT ф.название, DATEDIFF(DAY,дата продажи, дата показа) AS дней до показа
FROM Фильм ф LEFT JOIN Билеты б ON ф.id_фильма=б.id_фильма
) AS SourceTable
PIVOT
(
COUNT(дней до показа)
FOR дней до показа IN ([0], [1], [2], [3],...)
) AS PivotTable



2)

SELECT TOP 1 WITH TIES 1 ф.название, год выпуска, к.название, р.ФИО, SUM(цена) AS сборы
FROM
(
SELECT ф.название, год выпуска, к.название, р.ФИО, цена
FROM Фильм  ф LEFT JOIN Билеты б ON ф.id_фильма=б.id_фильма
	LEFT JOIN Киностудия к ON ф.id_киностудии=к.id_киностудии
	LEFT JOIN Режиссер р ON ф.id_режиссера=р.id_режиссера
)
GROUP BY 	ф.название, год выпуска, к.название, р.ФИО
ORDER BY сборы DESC
*/

--Task 3:

--DROP TABLE TestHW11
CREATE TABLE TestHW11 
	(Function_name nvarchar(40),
	Function_count INT
	)

SELECT *
FROM [dbo].[data_for_merge]

SELECT *
FROM [dbo].[TestHW11]

--Alex
MERGE TestHW11 target
USING [dbo].[data_for_merge] source ON target.Function_name=source.Alex
WHEN MATCHED THEN UPDATE SET target.Function_count=target.Function_count+1
WHEN NOT MATCHED BY target AND source.Alex IS NOT NULL
	THEN INSERT (Function_name, Function_count)
	VALUES (source.Alex, 1);

--Barbara
MERGE TestHW11 target
USING [dbo].[data_for_merge] source ON target.Function_name=source.Barbara
WHEN MATCHED THEN UPDATE SET target.Function_count=target.Function_count+1
WHEN NOT MATCHED BY target AND source.Barbara IS NOT NULL
	THEN INSERT (Function_name, Function_count)
	VALUES (source.Barbara, 1);

--Chris
MERGE TestHW11 target
USING [dbo].[data_for_merge] source ON target.Function_name=source.Chris
WHEN MATCHED THEN UPDATE SET target.Function_count=target.Function_count+1
WHEN NOT MATCHED BY target AND source.Chris IS NOT NULL
	THEN INSERT (Function_name, Function_count)
	VALUES (source.Chris, 1);

--Donna
MERGE TestHW11 target
USING [dbo].[data_for_merge] source ON target.Function_name=source.Donna
WHEN MATCHED THEN UPDATE SET target.Function_count=target.Function_count+1
WHEN NOT MATCHED BY target AND source.Donna IS NOT NULL
	THEN INSERT (Function_name, Function_count)
	VALUES (source.Donna, 1);

--Elton
MERGE TestHW11 target
USING [dbo].[data_for_merge] source ON target.Function_name=source.Elton
WHEN MATCHED THEN UPDATE SET target.Function_count=target.Function_count+1
WHEN NOT MATCHED BY target AND source.Elton IS NOT NULL
	THEN INSERT (Function_name, Function_count)
	VALUES (source.Elton, 1);

--Fred
MERGE TestHW11 target
USING [dbo].[data_for_merge] source ON target.Function_name=source.Fred
WHEN MATCHED THEN UPDATE SET target.Function_count=target.Function_count+1
WHEN NOT MATCHED BY target AND source.Fred IS NOT NULL
	THEN INSERT (Function_name, Function_count)
	VALUES (source.Fred, 1);

--George
MERGE TestHW11 target
USING [dbo].[data_for_merge] source ON target.Function_name=source.George
WHEN MATCHED THEN UPDATE SET target.Function_count=target.Function_count+1
WHEN NOT MATCHED BY target AND source.George IS NOT NULL
	THEN INSERT (Function_name, Function_count)
	VALUES (source.George, 1);

--Harry
MERGE TestHW11 target
USING [dbo].[data_for_merge] source ON target.Function_name=source.Harry
WHEN MATCHED THEN UPDATE SET target.Function_count=target.Function_count+1
WHEN NOT MATCHED BY target AND source.Harry IS NOT NULL
	THEN INSERT (Function_name, Function_count)
	VALUES (source.Harry, 1);


--Irys
MERGE TestHW11 target
USING [dbo].[data_for_merge] source ON target.Function_name=source.Irys
WHEN MATCHED THEN UPDATE SET target.Function_count=target.Function_count+1
WHEN NOT MATCHED BY target AND source.Irys IS NOT NULL
	THEN INSERT (Function_name, Function_count)
	VALUES (source.Irys, 1);


