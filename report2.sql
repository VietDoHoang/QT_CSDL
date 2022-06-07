SELECT *
INTO HumanReSources.Employee_NoIndex
From HumanResources.Employee

Select *
INTO HumanReSources.Employee_Index
FROM HumanResources.Employee
Go 
Create INDEX idx_HumanReSources_Employee_Index_BusinessEntityID ON
HumanReSources.Employee_Index(BusinessEntityID)

Select NationalIDNumber , LoginID
FROM HumanResources.Employee_NoIndex
Where BusinessEntityID = 1

Select NationalIDNumber , LoginID
FROM HumanResources.Employee_Index
Where BusinessEntityID = 1

Select * INTO HumanReSources.Employee_ClusteredIndex 
FROM HumanResources.Employee
Select * INTO HumanReSources.Employee_NonClusteredIndex 
FROM HumanResources.Employee 
CREATE CLUSTERED INDEX Idx_HumanReSourcesEmployee_AlternateKey ON HumanReSources.Employee_ClusteredIndex(LoginID );
CREATE INDEX Idx_HumanReSourcesEmployee_AlternateKey ON HumanReSources.Employee_NonClusteredIndex(LoginID) ;
Select NationalIDNumber , LoginID
FROM HumanReSources.Employee_ClusteredIndex 
Where LoginID = 'adventure-works\michael5'

Select NationalIDNumber , LoginID
FROM HumanReSources.Employee_NonClusteredIndex 
Where LoginID = 'adventure-works\michael5'