/*===============================================================================
HAVING CLAUSE:
- 'Having' clause provides a search condition that each group must satisfy
- 'Where' clause is processed before 'Group by' clause, 'Having' clause is processed after 'Group' by clause
=================================================================================*/
--Exercise 1
-- find the dates where more than 100 transactions occured
select cast([OrderDate] as date) as [Date], count([SalesOrderID])
from[Sales].[SalesOrderHeader]
group by [OrderDate]
having count([SalesOrderID]) > 100

--Exercise 2
--Find Product subcategories whose average list prices are between 500 and 2000
select PPSC.[Name] as ProductSubCategory, round(avg(PP.[ListPrice]),2)as AverageListPrice
from[Production].[Product] as PP
inner join[Production].[ProductSubcategory] as PPSC
on PP.ProductSubcategoryID = PPSC.ProductSubcategoryID
group by PPSC.[Name]
having avg(PP.[ListPrice]) between 500 and 2000