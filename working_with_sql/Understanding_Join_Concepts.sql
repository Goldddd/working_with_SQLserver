/*===============================================================================
Understanding Join Clause:
- JOIN clause is used to combine rows from two or more tables, based on a matching criteria
- Usually based on a primary key - foreign key relationship
	- for example, return rows that combine data from the customer and salesoder tables by matching the customer.customerID PRIMARY KEY to the 
	  salesorder.customerID FOREIGN KEY
- It helps to think of the tables as sets in a venn Diagram

TYPES OF SQL JOINS
- Inner Join: select all records from table A and table B where the Join condition is met
- Left Join: selects all records from Table A, along with records from table B for which the condition is met (if at all).
- Right Join: Select all records from table B, along with records from table A for which the condition is met (if at all).
- Full Join: Selects all records from table A and table B, regardless of whether the condition is met or not.
=================================================================================*/