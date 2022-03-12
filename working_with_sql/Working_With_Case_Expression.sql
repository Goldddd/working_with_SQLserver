/*===============================================================================
CASE EXPRESSIONS:
- case expression goes through conditions and returns a value when the first condition is met
- Works like an IF-THEN-ELSE statement
- Can be used in select queries along with where, order by and group by, having clause.
Synthax:
SELECT
	CASE input
		when condition 1 then result 1
		when condition 2 then result 2
		.....
		else result
	END
FROM Table

e.g.
SELECT
	CASE Productline
		when 'M' then 'Mountain Bike'
		when 's' then 'standard bike'
		else 'n/a'
	END
FROM Product_Table

- Case expressions can be simple or searched(complex) expressions
=================================================================================*/
--Exercise 1
-- write a to retrieve the following information from the product table, ProductNumber, Name, ProductLine, MakeFlag, and Discontinued date
--INclude a case Statement for the product line such that R = road, T = Touring, s = standard, M= mountain. also define the actual meaning of
--MakeFlag such that 0 = Purchased and 1= manufactured In-house
select [ProductNumber],[Name],[DiscontinuedDate],
		CASE [ProductLine]
			when 'R' then 'Road'
			when 'T' then 'Touring'
			when 'S' then 'Standard'
			when 'M' then 'Mountain'
			else 'N/A'
		End as ProductLine,
		CASE [MakeFlag]
			when 0 then 'Purchased'
			else 'Manufactured In-House'
		END as MakeFlag
from[Production].[Product]

--Exercise 2
--write a query using the sales.salesorderdetails table to display a value ("under 10" or "10-19" or "20-29" or "30-39" or "40 and over" based
--on the orderqty value by using the CASE function. include the salesOrderID and odrderQty columns in the result.
select [SalesOrderID],[OrderQty],
	case
		when[OrderQty] < 10 then 'Under 10'
		when[OrderQty] between 10 and 19 then '10-19'
		when[OrderQty] between 20 and 29 then '20-29'
		when[OrderQty] between 30 and 39 then '30-39'
		when[OrderQty] > 39 then '40 and over'
	END as QtyRange
from[Sales].[SalesOrderDetail]