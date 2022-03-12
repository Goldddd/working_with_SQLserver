/*===============================================================================
Inbuilt Functions:
String Function
=================================================================================*/
-- Upper Functions
select [ProductNumber], [Name]
from [SalesLT].[Product]

--using upper and lower functions
select [ProductNumber], [Name],
	upper([Name]), -- capitalizes every word
	Lower([Name]), -- small cases for every word
	[ProductNumber]+ ': ' +[Name], -- concactenation (preferable) or
	concat([ProductNumber], ': ', [Name])-- concactenation
from [SalesLT].[Product]
--Using the left, Right, Substring, Reverse and Len functions
select [ProductID], [ProductNumber],
	LEFT([ProductNumber],2) as ProductType,-- returns left-most characters
	right([ProductNumber],4) as SerialNumber, -- returns Right-most characters
	substring([ProductNumber], 4, 4) as ModelNumber, --returns characters within the start and number of required characters positions specified
	reverse(substring([ProductNumber],4,4)) as ReverseModelNumber,
	Len([ProductNumber]) as CharLenProductNum -- returns number of characters that nake up the given cell.
from [SalesLT].[Product]