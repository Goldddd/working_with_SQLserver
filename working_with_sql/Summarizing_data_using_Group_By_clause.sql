/*===============================================================================
Group By caluse:
- GROUP BY statement groups rows that have the same values into summary.
- Often used with aggregate functions(count, max, mean, avg, sum)
- Detail rows are 'lost' after group by clause is processed
- Any function in the select clause that is not aggregated must be included in the group by clause
=================================================================================*/
--Exercise 1
--Find the total number of transactions per year whose totaldue exceeded 1000
select year([OrderDate]) as 'Year',count([SalesOrderID]) as NumberOfTransactions
from[Sales].[SalesOrderHeader]
where [TotalDue] > 1000
group by year([OrderDate])
order by 'year' -- the only time you can reuse an alias name from the select statements is in the order by


--Exercise 2
--Find Number of products in every product category
select PPC.[Name] as Category,count(PP.[Name]) as NumberOfProducts
from[Production].[Product] as PP
inner join[Production].[ProductSubcategory] as PPSC
on PP.[ProductSubcategoryID] = PPSC.[ProductSubcategoryID]
inner join[Production].[ProductCategory] as PPC
on PPSC.[ProductCategoryID] = PPC.[ProductCategoryID]
group by PPC.[ProductCategoryID],PPC.[Name]

--Exercise 3
--What is the minimum and maximum list price for every product category
select PPC.[ProductCategoryID], PPC.[Name] as Category,MIN(PP.[ListPrice]) as MinPrice, MAX(PP.[ListPrice]) as MaxPrice
from[Production].[Product] as PP
inner join[Production].[ProductSubcategory] as PPSC
on PP.[ProductSubcategoryID] = PPSC.[ProductSubcategoryID]
inner join[Production].[ProductCategory] as PPC
on PPSC.[ProductCategoryID] = PPC.[ProductCategoryID]
group by PPC.[ProductCategoryID],PPC.[Name]

--Exercise 4
--What is the total and average sales per territory in year 2014
select*
from[Sales].[SalesTerritory]


select SST.[Group] as Continent, SST.[Name] as Territory, round(sum(SSOH.[TotalDue]),2)as TotalSales, round(avg(SSOH.[TotalDue]),2) as AverageSales
from[Sales].[SalesOrderHeader] as SSOH
inner join[Sales].[SalesTerritory] as SST
on SSOH.[TerritoryID] = SST.[TerritoryID]
where year([OrderDate]) = 2014
group by SST.[Name],SST.[Group]
order by Continent