
--If russian language is not readable, see .txt files for practise work 3(PW3)
--�� 2

/*
����������
1. ����� (id_������, ��������, ��� �������, id_����������, id_���������, id_������)
2. ���������� (id_����������, ��������, ��� ���������)
3. �������� (id_���������, ���, ����� ��������, ��� ��������, ���)
4. ������ (id_������, ���, ����� ��������, ��� ��������, ���)
5. ������(id_������, id_������, id_����������, ���� ������, ���� �������, ����)
6. ��������� (id_����������, ��������, �����, �������)


1)������� ������ � ������� � ���-�� ��������� ������� � ����������� �� ����, ��� ���� �� �������� (�� 1,2, ... ���� �� ������). ���������� ������� � ���� ������������������ ������� (��� - �������� ������, ���-�� ���� �� ������� �� ������)
2)������� �������� � ������ � ����� ������� �������� ������ �� ��� �����. 

1)
SELECT �.��������, [0], [1], [2], [3],...
FROM
(
SELECT �.��������, DATEDIFF(DAY,���� �������, ���� ������) AS ���� �� ������
FROM ����� � LEFT JOIN ������ � ON �.id_������=�.id_������
) AS SourceTable
PIVOT
(
COUNT(���� �� ������)
FOR ���� �� ������ IN ([0], [1], [2], [3],...)
) AS PivotTable



2)

SELECT TOP 1 WITH TIES 1 �.��������, ��� �������, �.��������, �.���, SUM(����) AS �����
FROM
(
SELECT �.��������, ��� �������, �.��������, �.���, ����
FROM �����  � LEFT JOIN ������ � ON �.id_������=�.id_������
	LEFT JOIN ���������� � ON �.id_����������=�.id_����������
	LEFT JOIN �������� � ON �.id_���������=�.id_���������
)
GROUP BY 	�.��������, ��� �������, �.��������, �.���
ORDER BY ����� DESC
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


