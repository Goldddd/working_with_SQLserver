/*===============================================================================
Limiting results:
TOP clause is used to specify the number of records to return. it is useful on large tables with thousands of records
you can also select top percentage and it can also be used with the ORDER BY clause
=================================================================================*/

--First 20 most expensive products based on standard cost
select top 20 [ProductNumber],[Name] as Product,[Size], [ListPrice], [StandardCost],[SellStartDate]
from [SalesLT].[Product]
order by [StandardCost] desc --it's important to order to your desired pattern before using the top cluase. orderwise is will give top of the unordered table.


--First 50 most expensive products based on standard cost
select top 50 [ProductNumber],[Name] as Product,[Size], [ListPrice], [StandardCost],[SellStartDate]
from [SalesLT].[Product]
order by [StandardCost] desc 

--First 20 most affordable products based on standard cost
select top 20 [ProductNumber],[Name] as Product,[Size], [ListPrice], [StandardCost],[SellStartDate]
from [SalesLT].[Product]
order by [StandardCost]

--First 25% of records present in the table
select top 25 percent [ProductNumber],[Name] as Product,[Size], [ListPrice], [StandardCost],[SellStartDate]
from [SalesLT].[Product]
order by [StandardCost] asc

--First 50 most expensive products based on standard cost using with ties cluase
select top 50 with ties [ProductNumber],[Name] as Product,[Size], [ListPrice], [StandardCost],[SellStartDate]
from [SalesLT].[Product]
order by [StandardCost] desc -- the 'with ties' clause includes row withing a range even if the specified top clause have been satisfied, hence why we have returned 55rows.


--First 50% most expensive products based on standard cost using with ties cluase
select top 50 percent with ties [ProductNumber],[Name] as Product,[Size], [ListPrice], [StandardCost],[SellStartDate]
from [SalesLT].[Product]
order by [StandardCost] desc