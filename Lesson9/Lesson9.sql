--Task 2:

SELECT a.FirstName, a.ParentName, a.LastName, b.FirstName AS FatherFirstName, b.ParentName AS FatherParentName, b.LastName AS FatherLastName
FROM People a LEFT JOIN People b ON a.ID=b.ID_Father
WHERE a.FirstName='�������'