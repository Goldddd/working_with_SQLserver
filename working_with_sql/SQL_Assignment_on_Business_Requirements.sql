/*========================================================================================== 
Q1. Retrieve information about the products with colors that are not null and not silver nor black nor white and list price is between 75 and 750
	Rename the column standardCost as Price. Finally please sort the result list by price list in descending order.
==========================================================================================*/
select
	[ProductID],
	[Name],
	[Color],
	[Size],
	[StandardCost] as Price
from[Production].[Product]
where [Color] is not Null and [Color] not in ('Black', 'White', 'Silver', 'Silver/Black') and [ListPrice] between 75 and 750
order by [ListPrice] desc

/*==========================================================================================
Q2. Fnd all the male employees born between 1962 to 1970 and with hire date greater than 2001 and female employees born between 1972 and 1975 and
	hire date between 2001 and 2002
==========================================================================================*/
select
	[FirstName]+ ' ' +[LastName] as [Name],
	[Gender],[JobTitle],[HireDate],[BirthDate]
from[HumanResources].[Employee] as HRE
inner join[Person].[Person] as PP
on HRE.[BusinessEntityID] = PP.[BusinessEntityID]
where [Gender] = 'M' and year([BirthDate]) between 1962 and 1970 and year([HireDate]) > 2001 
or ([Gender] = 'F' and year([BirthDate]) between 1972 and 1975 and year([HireDate]) between 2001 and 2002)

/*==========================================================================================
Q3. Create a list of 10 most expensive products that have a product number begining with 'BK'. Include only the productID , Name and color.
==========================================================================================*/
select top 10 with ties [ProductID],[Name],[Color],[StandardCost]
from [Production].[Product]
where [ProductNumber] like 'BK%'
order by [StandardCost] desc

/*==========================================================================================
Q4. First Create a list of all the contact people where the first 4 characters of their last name are equal to the first 4 characters of
	their email address.
	Second find all the contact people whose first name and last name begin with thesame character. create a new column called full name 
	combining their first name and last name. Finally add column with the length of the full name
==========================================================================================*/
select
	PP.FirstName+ ' ' +PP.[LastName] as FullName,
	PE.EmailAddress,
	len(PP.FirstName+ ' ' +PP.[LastName]) as NameLength
from[Person].[Person] as PP
inner join[Person].[EmailAddress] as PE
on PP.[BusinessEntityID] = PE.[BusinessEntityID]
where (left([LastName],4) = left([EmailAddress],4)) and left([FirstName],1) like left([LastName],1)
group by PP.FirstName,PP.[LastName],PE.EmailAddress

/*==========================================================================================
Q5. Return all product subcategories that take an average of 3days or longer to manufacture
==========================================================================================*/
select
	PPSC.[Name],
	avg([DaysToManufacture]) as DaysToManufacture
from[Production].[Product] as PP
inner join[Production].[ProductSubcategory] as PPSC
on PP.ProductSubcategoryID = PPSC.ProductSubcategoryID
group by PPSC.[Name]
having avg([DaysToManufacture]) >= 3

/*==========================================================================================
Q6. Create a price segmentation for products by defining a criteria that places each item in a segment as follows;
	if price less than 200 then it's low value.
	if price is between 201 and 750 then it is med value
	if price is between 751 and 1250 then it is mid to high value
	all else is higher Value.
	filter the results only for products that are black, silver and red (colour).
==========================================================================================*/
select
	[ProductID],
	[Name],
	[Color],
	round([StandardCost],2) as Price,
	case
		when [StandardCost] < 200 then 'Low Value'
		when [StandardCost] between 201 and 750 then 'Mid Value'
		when [StandardCost] between 751 and 1250 then 'Mid to High Value'
		else 'Higher Value'
	end as Price_Segmentation
from[Production].[Product]
where [Color] in ('Black', 'Silver', 'Red')

/*==========================================================================================
Q7. How many distinct job titles are there in the employee table
==========================================================================================*/
select count(distinct([JobTitle])) as [Number of Distinct JobTitles]
from[HumanResources].[Employee]

/*==========================================================================================
Q8. Use the employee table and calculate the ages of each employee at the time of hiring
==========================================================================================*/
select
	pp.FirstName+ ' ' +LastName as [Name],
	case [PersonType]
		when 'EM' then 'Employee'
		else 'N/A'
	end as PersonType,
	[JobTitle],
	year(HRE.[BirthDate]) as BirthYear,
	year(HRE.HireDate) as HireDate,
	DATEDIFF(YY,[BirthDate],[HireDate]) as Age_At_Hiring
from[HumanResources].[Employee]as HRE
inner join[Person].[Person] as PP
on HRE.BusinessEntityID = PP.BusinessEntityID
order by Age_At_Hiring asc

/*==========================================================================================
Q9. How many employees will be due a long service award in the next 5 years, if long service is 20 years
==========================================================================================*/
select
	count(*) as Number_Of_Employees_Due_Long_Service_Award
from[HumanResources].[Employee]
where DATEDIFF(YY,[HireDate],GETDATE()) + 5 = 20

/*==========================================================================================
Q10. How many more years does each employee have to work beefore reaching retirement, if retirement is 65years
==========================================================================================*/
select
	PP.FirstName+ ' ' +LastName as [Name],
	year([BirthDate]) as Year_Of_Birth,
	datediff(yy,[BirthDate],getdate()) as Age,
	year(dateadd(YY, 65, [BirthDate])) as Retirement_Date,
	year(dateadd(YY, 65, [BirthDate])) - year(GETDATE()) as Years_From_Retirement
from[HumanResources].[Employee]as HRE
inner join[Person].[Person] as PP
on HRE.BusinessEntityID = PP.BusinessEntityID

/*==========================================================================================
Q11. Implement a new pricing policy on the product table based on the colour of the item.
	 Create a column called Newprice with the following values: If the colour is white please increase
	 the price by 8%, If yellow reduce the price by 7.5%, If black increase the price by 17.2%.
	 If multi, silver, silver/black or blue take the square root of the price and double that value.
	 For each item, calculate a commission of 37.5% of new prices. 
==========================================================================================*/
select [ProductNumber],[Name],isnull([Color], 'N/A') as Color,round([StandardCost],2) as OldPrice,
	round(case 
		when [Color] = 'White' then ([StandardCost]*0.08) + [StandardCost]
		when [Color] = 'Yellow' then [StandardCost] - ([StandardCost]*0.075)
		when [Color] = 'Black' then ([StandardCost]*0.172) + [StandardCost]
		when [Color] in ('Multi', 'Silver', 'Silver/black', 'Blue') then sqrt([StandardCost]) *2
	End,2) as NewPrice,
	round(case 
		when [Color] = 'White' then ([StandardCost]*0.08) + [StandardCost]
		when [Color] = 'Yellow' then [StandardCost] - ([StandardCost]*0.075)
		when [Color] = 'Black' then ([StandardCost]*0.172) + [StandardCost]
		when [Color] in ('Multi', 'Silver', 'Silver/black', 'Blue') then sqrt([StandardCost]) *2
	End *0.375,2) as Commission
from[Production].[Product]

/*==========================================================================================
Q12. Print the information about all the Sales.Person and their sales quota. For every Sales person you
	 should provide their FirstName, LastName, HireDate, SickLeaveHours and Region where they work. 
==========================================================================================*/
select
	PP.FirstName,
	PP.LastName,
	SSP.[SalesQuota],
	HRE.HireDate,
	HRE.SickLeaveHours,
	isnull(SST.[Name], 'N/A') as Region
from[Sales].[SalesPerson] as SSP
left join[Person].[Person] as PP
on SSP.BusinessEntityID = PP.BusinessEntityID
left join [HumanResources].[Employee] as HRE
on PP.BusinessEntityID = HRE.BusinessEntityID
left join[Sales].[SalesTerritory] as SST
on SSP.[TerritoryID] = SST.[TerritoryID]

/*==========================================================================================
Q13. Using adventure works, write a query to extract the following information.
	• Product name
	• Product category name
	• Product subcategory name
	• Sales person
	• Revenue
	• Month of transaction
	• Quarter of transaction
	• Region  
==========================================================================================*/
select
	PP.[Name] as ProductName,
	PPC.[Name] as ProductCategory,
	PPSC.[Name] as ProductSubCategory,
	isnull(PPR.FirstName+ ' ' +[LastName], 'N/A') as SalesPerson,
	SSOD.OrderQty*SSOD.UnitPrice as Revenue,
	datename(mm,[OrderDate]) as 'Month of Transaction',
	datename(qq,[OrderDate]) as 'Quarter Of Transaction',
	SST.[Name] as Region
from[Production].[Product] as PP
left join[Production].[ProductSubcategory] as PPSC
on PP.ProductSubcategoryID = PPSC.ProductSubcategoryID
left join[Production].[ProductCategory] as PPC
on PPC.[ProductCategoryID] = PPSC.[ProductCategoryID]
left join[Sales].[SalesOrderDetail] as SSOD
on PP.ProductID = SSOD.ProductID
left join[Sales].[SalesOrderHeader] as SSOH
on SSOD.[SalesOrderID] = SSOH.[SalesOrderID]
left join[Sales].[SalesPerson] as SSP
on SSOH.SalesPersonID = SSP.BusinessEntityID
left join[Person].[Person] as PPR
on SSP.[BusinessEntityID] = PPR.[BusinessEntityID]
left join[Sales].[SalesTerritory] as SST
on SSP.TerritoryID = SST.TerritoryID

/*==========================================================================================
Q14. Display the information about the details of an order i.e. order number, order date, amount of order,
	 which customer gives the order and which salesman works for that customer and how much
	 commission he gets for an order.
==========================================================================================*/
select
	[SalesOrderNumber],
	cast([OrderDate] as date) as OrderDate,
	sum([OrderQty]) as OrderQty,
	sum([OrderQty]*[TotalDue]) as Amount_Of_Order,
	[FirstName]+ ' ' +[LastName] as CustomerName
from[Sales].[SalesOrderHeader] as SSOH
left join[Sales].[SalesOrderDetail] as SSOD
on SSOH.SalesOrderID = SSOD.SalesOrderID
left join[Sales].[Customer] as SC
on SSOH.[CustomerID] = SC.[CustomerID]
left join[Person].[Person] as PP
on SC.[CustomerID] = pp.BusinessEntityID
group by cast([OrderDate] as date),[SalesOrderNumber],[FirstName],[LastName]


/*==========================================================================================
Q15. For all the products calculate
	• Commission as 14.790% of standard cost,
	• Margin, if standard cost is increased or decreased as follows:
	- Black: +22%,
	- Red: -12%
	- Silver: +15%
	- Multi: +5%
	- White: Two times original cost divided by the square root of cost
	- For other colors, standard cost remains the same 
==========================================================================================*/
select[ProductNumber], [Name] as ProductName,[Color],[StandardCost],
	round([StandardCost]*0.1479, 2) as Commission,
	round(case [Color]
		when 'Black' then ([StandardCost]*0.22) + [StandardCost]
		when 'Red' then [StandardCost] - ([StandardCost]*0.12)
		when 'Silver' then ([StandardCost]*0.15) + [StandardCost]
		when 'Multi' then  ([StandardCost]*0.05) + [StandardCost]
		when 'White' then ([StandardCost]*2)/(sqrt([StandardCost]))
		else [StandardCost]
	end,2) as Margin
from[Production].[Product]


/*==========================================================================================
Q16. Create a view to find out the top 5 most expensive products for each colour.
==========================================================================================*/
CREATE VIEW Most_Expensive_Products as
with cte as (
select
    [ProductID]
	,[Name]
    , [Color]
    , [ListPrice]
    , ROW_NUMBER() over(PARTITION BY [Color] ORDER BY [ListPrice] desc) as RowNo
from [Production].[Product]
)
select *
from cte
where RowNo <= 5
order by [Color]


