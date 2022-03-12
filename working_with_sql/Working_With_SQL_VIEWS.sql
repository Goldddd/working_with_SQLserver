/*===============================================================================
SQL VIEWS:
- A view is a virtual table based on the result-set of an SQL statement
- It contains rows and columns, just like a real table
- SQL functions, WHERE, and JOIN statements can be used in a view to present the data as if the data were coming from one single table
- View always shows up-to-date data
SYNTHAX:
CREATE VIEW view_name AS
SELECT col1,col2...
FROM Table_name
WHERE condition

To edit views goto your database(adventureworks)-> views ->right-click on your view(Product_Catalogue)-> script view as-> alter to-> new_query_editor
=================================================================================*/
--Exercise 1
--Create a view named 'product_catalogue'. the view should include the following columns; ProductID, ProductNumber, ProductName, Color, 
--Size, StandardCost, ProductSubcategory, ProductCategory
CREATE VIEW Product_Catalogue as
select[ProductID],[ProductNumber],PP.[Name],[Color],[Size],PPSC.[Name] as SubCategory,PPC.[Name] as Category
from[Production].[Product] as PP
inner join[Production].[ProductSubcategory] as PPSC
on PP.[ProductSubcategoryID] = PPSC.[ProductSubcategoryID]
inner join[Production].[ProductCategory] as PPC
on PPSC.[ProductCategoryID] = PPC.[ProductCategoryID]

-- to callup the view
select*
from [dbo].[Product_Catalogue]