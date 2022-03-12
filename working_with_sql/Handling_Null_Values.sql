/*===============================================================================
Handling Null Values
- A field with a NULL value is a field with no Value
- The result of anyExpression containing a Null 
	- 35 + Null = NULL
	- 'MyString:'+ Null = NULL
- Equality comparisons always returns false for Null values
	NULL = NULL returns False
- Null values can be filtered Using IS NULL and IS not NULL
synthanx:
SELECT*
FROM Table_Name
WHERE column_name is Null

OR

SELECT*
FROM Table_Name
WHERE column_name Is Not Null
=================================================================================*/
--exercise 1
--Retrieve details of products that are no longer sold i.e having a SellEndDate
select
	[ProductNumber],[Name],[Color],[StandardCost],cast([SellStartDate] as date) as SellStartDate, cast([SellEndDate] as date) as SellEndDate
from[SalesLT].[Product]
where[SellEndDate] is not null

--exercise 2
--Retrieve details of products that are still being sold i.e has no SellEndDate
select
	[ProductNumber],[Name],[Color],[StandardCost],cast([SellStartDate] as date) as SellStartDate, cast([SellEndDate] as date) as SellEndDate
from[SalesLT].[Product]
where[SellEndDate] is null

--exercise 3
--Retrieve details of products tha thave no color
select
	[ProductNumber],[Name],[Color],[StandardCost],cast([SellStartDate] as date) as SellStartDate, cast([SellEndDate] as date) as SellEndDate
from[SalesLT].[Product]
where[Color] is null

