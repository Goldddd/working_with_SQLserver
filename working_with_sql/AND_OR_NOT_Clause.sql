/*===============================================================================
AND, OR, NOT Clause:
- 'WHERE' conditions can be combined with AND, OR, and NOT.
- A 'WHERE' clause with AND requires that both conditions are met
synthax:
SELECT*
FROM Production.Products
WHERE category_ID = 1 AND List_Price > 400

- A 'WHERE' clause with 'OR' requires that one of two conditions are met
synthax:
SELECT*
FROM Production.Products
WHERE category_ID = 1 OR List_Price > 400

- A 'WHERE' clause with NOT negates the specified condition.
SELECT*
FROM Customer
WHERE NOT Country = 'USA'
=================================================================================*/
--exercise 1
--Retrieve details of red color products with StandardCost less than 150
select
	[ProductNumber],[Name],[Color],[StandardCost],cast([SellStartDate] as date) 
from[SalesLT].[Product]
where [Color] = 'Red' and [StandardCost] < 150

--exercise 2
--Retrieve information about products like Jersey that began selling in 2005
,
--exercise 3
--Retrieve information about product that are either color red or are cheaper than 500
select
	[ProductNumber],[Name],[Color],[StandardCost],cast([SellStartDate] as date) as SellStartDate
from[SalesLT].[Product]
where [Color] = 'Red' or [StandardCost] < 500

--exercise 4
--Retrieve the details of red color products with a standardcost lesser than 150 or began selling in 2005
select
	[ProductNumber],[Name],[Color],[StandardCost],cast([SellStartDate] as date) as SellStartDate
from[SalesLT].[Product]
where [Color]= 'Red' and [StandardCost] < 150 or year([SellStartDate]) = 2005 --Always remember to specify date part(year or month or day)

--exercise 4b the result changes when you introduce parenthesis in the where clause
--Retrieve the details of red color products with a standardcost lesser than 150 or began selling in 2005
select
	[ProductNumber],[Name],[Color],[StandardCost],cast([SellStartDate] as date) as SellStartDate
from[SalesLT].[Product]
where [Color]= 'Red' and ([StandardCost] < 150 or year([SellStartDate]) = 2005) --Always remember to specify date part(year or month or day)

--exercise 5
--Retrieve the details of Products that are not red with a standardCost lesser than 150
select
	[ProductNumber],[Name],[Color],[StandardCost],cast([SellStartDate] as date) as SellStartDate
from[SalesLT].[Product]
where not [Color] = 'Red' and [StandardCost] < 150