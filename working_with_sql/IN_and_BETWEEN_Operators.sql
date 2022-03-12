/*===============================================================================
IN and BETWEEN Operators:
-The BETWEEN Operator is a logic operator that allows you to specify a range to test. much more readable than comparison operators
sythax:
select col1,col2.....
from table_name
where column BETWEEN start_expression and End_expression;

-The IN operator allows you to test whether a specified value matches any value in a list. equivalent to multiple OR operators
synthax:
select col1, col2,.......
from Table_Name
where Column IN (v1,v2,v3....);
=================================================================================*/
--exercise 1
-- Retrieve a list of products that began selling between 2006 and 2007
select*
from [SalesLT].[Product]
where YEAR([SellStartDate]) between 2006 and 2007

--exercise 2
-- Retrieve a list of products between 500 and 1000 standardCost
select*
from[SalesLT].[Product]
where [StandardCost] between 500 and 1000

--exercise 3 for IN Operators
--List out the products that red, silver or black color
select*
from[SalesLT].[Product]
where[Color] in ('Red', 'Silver', 'Black')

--exercise 4
-- Retrieve a list of products that began selling between 2006 and 2007
select*
from [SalesLT].[Product]
where YEAR([SellStartDate]) in (2006,2007)