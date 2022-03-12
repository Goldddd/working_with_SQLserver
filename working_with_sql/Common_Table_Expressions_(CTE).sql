/*===============================================================================
SQL CTE
- CTE stands for common Table Expression
- It allows you to define a temporary named result set that is available temporarily in the execution scope of a statement such as SELECT, 
  INSERT, UPDATE, DELETE, OR MERGE
- CTE's are preferred above subqueries because they are more readable
- They are also Used in the queries that contain analytic functions (window functions)
=================================================================================*/
--Exercise 1
--Single CTE
--Calculate the total sales and commission value of each sales person for year 2014
With SalesPerson as (
	select
		A.[BusinessEntityID],
		B.[FirstName]+ ' ' +[LastName] as SalesPerson,
		[CommissionPct]
	from[Sales].[SalesPerson] as A
	inner join[Person].[Person] as B
	on A.[BusinessEntityID] = B.[BusinessEntityID]
	where[SalesQuota] is not null

)
select
	SalesPerson,
	sum([SubTotal]) as Sales,
	sum([SubTotal]) * [CommissionPct] as Commission
from[Sales].[SalesOrderHeader] as A
inner join SalesPerson as B
on A.SalesPersonID = B.BusinessEntityID
where year([OrderDate]) = 2014
group by SalesPerson, CommissionPct

--Exercise 2
--Multiple CTE in a single query
--Calculate the total sales and commission value of each sales person for year 2014
--With SalesPerson as (
--	select
--		A.[BusinessEntityID],
--		B.[FirstName]+ ' ' +[LastName] as SalesPerson,
--		[CommissionPct]
--	from[Sales].[SalesPerson] as A
--	inner join[Person].[Person] as B
--	on A.[BusinessEntityID] = B.[BusinessEntityID]
--	where[SalesQuota] is not null

--),
--	Sales2014 as (
--	select
--		SalesPerson,
--		sum([SubTotal]) as Sales,
--		sum([SubTotal]) * [CommissionPct] as Commission,
--		CommissionPct
--	from[Sales].[SalesOrderHeader] as A
--	inner join SalesPerson as B
--	on A.SalesPersonID = B.BusinessEntityID
--	where year([OrderDate]) = 2014
--	group by SalesPerson, CommissionPct
--)
--select SalesPerson, Sales, CommissionPct, Commission
--from Sales2014