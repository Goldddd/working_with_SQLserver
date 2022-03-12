/*===============================================================================
Inbuilt Functions:
- Functions are set of SQL statements that accept only input parameters, performs actions and return the result
Types of Function
- System defined functions: Sets of standard functions for performing calculations or manipulating data
	- scalar function e.g. Upper(Firstname)
	- aggregate function e.g. sum(salesamount)
- User defined functions: Created by the user in the system database
	-scalar function
	-inline table-valued function
	-multi-statement table-valued function

	the parameters for the 'datename' function:
	yy - year
	QQ - quarterly
	Dy - day of the year
	wk - week
	hh - hour
	mi - minutes
	ss - seconds
	ms - miliseconds
=================================================================================*/
--exercise 1
select 
	[ProductNumber],[SellStartDate],
	year([SellStartDate]) as StartYear,
	MONTH([SellStartDate]) as StartMonth,
	day([SellStartDate]) as StartDate
from [SalesLT].[Product]

--exercise 2
--I used the cast function to remove the TimeStamp from date this time. compare with exercise 1
select 
	[ProductNumber],cast([SellStartDate] as date) as SellStartDate,
	datename(DW, [SellStartDate]) as 'Day',
	day([SellStartDate]) as startDate,
	datename(mm,[SellStartDate]) as StartMonth,
	datepart(mm,[SellStartDate]) as MonthInt, --datepart and datename are thesame, but datepart presents its result in integers.
	year([SellStartDate]) as 'Year',
	cast(getdate() as date) as CurrentDate, -- used to extract current date/time stamp
	datediff(yy,[SellStartDate],getdate()) as ProductAge, -- used for extracting the difference between dates.
	cast(dateadd(mm,5,[SellStartDate])as date) as FiveMonthsFromStartDate -- You can also use a negative value to go backwards.
from [SalesLT].[Product]

--exercise 3
-- Find the number of days to ship for every transaction. include the salesorderid, order date and shipdate
select
	[SalesOrderID],
	cast([OrderDate] as date) as OrderDate,
	cast([ShipDate] as date) as ShipDate,
	DATEDIFF(dd,[OrderDate],[ShipDate]) as DaysToShip
from [SalesLT].[SalesOrderHeader]

--Mathematical Functions
select abs(-6) 'Absolute', --returns the absolute value of a number removing the negative sign
	ceiling (5.4) 'Ceiling', -- takes a decimal number to next whole number
	floor (5.7) as 'Floor', -- receeds a decimal number to the nearest whole number
	power(2,3) as 'Power', -- raises to power
	round(88.445,2) as Approximation, -- approximates to the specified number of decimal places
	sqrt(9) as SquareRoot