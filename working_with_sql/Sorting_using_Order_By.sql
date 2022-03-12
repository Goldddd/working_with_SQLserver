--Sorting tables using Order by
select [FirstName]+ ' ' +[LastName] as FullName, --if alias name has a space, then it must be enclosed in blocked parenthesis
[CompanyName],[EmailAddress] as [e mail],[Phone]
from [SalesLT].[Customer]
order by [CompanyName] asc -- the default sorting pattern is asc

--using desc for sorting
select [FirstName]+ ' ' +[LastName] as FullName, --if alias name has a space, then it must be enclosed in blocked parenthesis
[CompanyName],[EmailAddress] as [e mail],[Phone]
from [SalesLT].[Customer]
order by [CompanyName] desc

--using Alias for sorting
select [FirstName]+ ' ' +[LastName] as FullName, --if alias name has a space, then it must be enclosed in blocked parenthesis
[CompanyName],[EmailAddress] as [e mail],[Phone]
from [SalesLT].[Customer]
order by FullName asc

--using a column within your table but not in ur query for sorting
select [FirstName]+ ' ' +[LastName] as FullName, --if alias name has a space, then it must be enclosed in blocked parenthesis
[CompanyName],[EmailAddress] as [e mail],[Phone]
from [SalesLT].[Customer]
order by [MiddleName] desc

--using multiple columns for sorting
select [FirstName]+ ' ' +[LastName] as FullName, --if alias name has a space, then it must be enclosed in blocked parenthesis
[CompanyName],[EmailAddress] as [e mail],[Phone],[SalesPerson]
from [SalesLT].[Customer]
order by SalesPerson asc, CompanyName desc

--using column positions for sorting
select [FirstName]+ ' ' +[LastName] as FullName, --if alias name has a space, then it must be enclosed in blocked parenthesis
[CompanyName],[EmailAddress] as [e mail],[Phone],[SalesPerson]
from [SalesLT].[Customer]
order by 5 asc, 2 desc -- where the numbers represent the column positions on the table.(not advisable, because once you include another column the positions change.