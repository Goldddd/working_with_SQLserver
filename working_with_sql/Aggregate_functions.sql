/*===============================================================================
Calculations Using Aggregate Functions:
- Functions that operate across an entire Column
- Take one oor more input values, return a single summarizing value
- summarize input rows 
- Without group by clause, all rows are arranged as one group
Aggregate function Categories
1 - count
2 - sum
3 - avg
4 - max
5 - min
6 - var (statistical variance)
7 - stdev
=================================================================================*/
--exercise 1
--Return the average list price for all the products in the products Table
select avg([ListPrice]) as AVerage
from[Production].[Product]

--exercise 2
--Return the number of products whose price is greater than 500
select count([ProductID]) as 'Count'
from[Production].[Product]
where[ListPrice] > 500

--exercise 3
--Return the highest listPrice of all products
select max([ListPrice]) as MaxValue
from[Production].[Product]

--exercise 4
--Return the least listPrice of all products
select min([ListPrice]) as leastPrice
from[Production].[Product]

--exercise 5
--Return the total sales made for all transactions in the SalesOrderHeader table
select round(sum([TotalDue]), 2)
from[Sales].[SalesOrderHeader]