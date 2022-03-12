/*===============================================================================
Distinct Keyword:
This is used to remove duplicate values from a result set.
=================================================================================*/

--Print out list of unique color(i.e a color shouldn't appear more than once) in the product table.
--without Distinct
select [Color] --without the distinct word, it would produce rows of duplicate colors
from [SalesLT].[Product]

select [Color], [SellStartDate]
from [SalesLT].[Product]

--with distinct
select distinct [Color]
from [SalesLT].[Product]

select distinct [Color], [SellStartDate]
from [SalesLT].[Product]