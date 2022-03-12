/*===============================================================================
The statement written order
1- select
2- from
3- where
4- group by
5- having
6- order by
--Basic Operators
a = : equal to
b <> : not equal to
c > : greater than
d < : less than
e >= : greater than or equal to
f <= : less than or equal to
=================================================================================*/
-- filtering data with where clause basic operators
--exercise 1
--retrieve a list of products which began selling in year 2002
select [ProductNumber],[Name],[Color],[Size],[StandardCost],[SellStartDate]
from [SalesLT].[Product]
where year([SellStartDate]) = 2002

--exercise 2
--retrieve a list of products which began selling in year 2007
select [ProductNumber],[Name],[Color],[Size],[StandardCost],[SellStartDate]
from [SalesLT].[Product]
where year([SellStartDate]) = 2007

--exercise 3
--retrieve a list of all products excluding those that began selling in year 2007
select [ProductNumber],[Name],[Color],[Size],[StandardCost],[SellStartDate]
from [SalesLT].[Product]
where year([SellStartDate]) <> 2007

--exercise 4
--retrieve a list of products which began selling after year 2005
select [ProductNumber],[Name],isnull([Color], 'N/A') as Color,isnull([Size], 'N/A') as Size,[StandardCost],[SellStartDate]-- notice how I used isnull in this line
from [SalesLT].[Product]
where year([SellStartDate]) > 2005

--exercise 5
--retrieve a list of all products where the color is black
select [ProductNumber],[Name],[Color],[Size],[StandardCost],[SellStartDate]
from [SalesLT].[Product]
where [Color] = 'black'