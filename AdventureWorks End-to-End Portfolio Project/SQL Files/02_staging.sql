
-- Creating Staging Tables

SELECT * INTO stg_sales_orders FROM Sales.SalesOrderHeader;

SELECT * INTO stg_sales_details FROM Sales.SalesOrderDetail;

SELECT * INTO stg_customers FROM Sales.Customer;

SELECT * INTO stg_territories FROM Sales.SalesTerritory;

SELECT * INTO stg_person FROM Person.Person;

SELECT * INTO stg_products FROM Production.Product;

SELECT * INTO stg_subcategories FROM Production.ProductSubcategory;

SELECT * INTO stg_categories FROM Production.ProductCategory;
