--Task 2

/*
There are Procedures: [dbo].[uspGetBillOfMaterials], [dbo].[uspGetEmployeeManagers], [dbo].[uspGetManagerEmployees], [dbo].[uspGetWhereUsedProductID], 
[dbo].[uspLogError], [dbo].[uspPrintError], [dbo].[uspSearchCandidateResumes], [HumanResources].[uspUpdateEmployeeHireInfo], [HumanResources].[uspUpdateEmployeeLogin],
[HumanResources].[uspUpdateEmployeePersonalInfo] and Fold 'System Stored Procedures'
*/

--Task 3

CREATE PROCEDURE HumanResources.uspEmployeesHW
	@BusinessEntityID INT,
	@NationalIDNumber INT OUTPUT
AS
UPDATE  [HumanResources].[Employee]
SET NationalIDNumber=@NationalIDNumber
WHERE BusinessEntityID=@BusinessEntityID

EXECUTE HumanResources.uspEmployeesHW @BusinessEntityID= '15', @NationalIDNumber='879341111'

/*
SELECT *
FROM [HumanResources].[Employee]
*/

--DROP PROCEDURE HumanResources.uspEmployeesHW
