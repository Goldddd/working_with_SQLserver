/*===============================================================================
SET OPERATORS:
- Set operators are used to join the results of two (or more) SELECT statements.
Types of sets in SQL;
- Union Set
- Intersect
- except

Guidelines For Set Operators
-Number of columns must be the same across all queries
-Column selection must be in the same order across all queries 
-Expressions in the select lists must be of the same data type
-Column aliases must be expressed in the first query
-It's possible to string several set operations together
=================================================================================*/
--Union and Union All
--Exercise 1
--Retrieve details of employees in sales roles
select [NationalIDNumber], [JobTitle],[HireDate],[OrganizationLevel],[BirthDate],[MaritalStatus]
from[HumanResources].[Employee]
where [JobTitle] like '%Sales%' -- 18rows

--Exercise 2
--Retrieve details of employees in organizational level 1 or 2
select [NationalIDNumber], [JobTitle],[HireDate],[OrganizationLevel],[BirthDate],[MaritalStatus]
from[HumanResources].[Employee]
where [OrganizationLevel] in (1,2) -- 33rows

--Exercise 3
--Retrieve details of eployees in either a sales role or organizational level 1 or 2
select [NationalIDNumber], [JobTitle],[HireDate],[OrganizationLevel],[BirthDate],[MaritalStatus]
from[HumanResources].[Employee]
where [JobTitle] like '%Sales%'
union
select [NationalIDNumber], [JobTitle],[HireDate],[OrganizationLevel],[BirthDate],[MaritalStatus]
from[HumanResources].[Employee]
where [OrganizationLevel] in (1,2)
--NB:
--using union alone, eleminates duplicate values, but Union All would include all duplicate values. which means 47rows for union and 51rows for union all