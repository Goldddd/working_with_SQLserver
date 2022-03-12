select [FirstName], [LastName],[CompanyName],[EmailAddress],[Phone]
from [SalesLT].[Customer]

-- to list out all columns
select*
from [SalesLT].[Customer]

--concactenating and using alias.
select [FirstName]+ ' ' +[LastName] as FullName, --if alias name has a space, then it must be enclosed in blocked parenthesis
[CompanyName],[EmailAddress] as [e mail],[Phone]
from [SalesLT].[Customer]