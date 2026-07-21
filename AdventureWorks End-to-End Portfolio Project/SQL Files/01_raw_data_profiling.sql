
--    Row Counts

SELECT
    SCHEMA_NAME(t.schema_id) AS SchemaName,
    t.name AS TableName,
    SUM(p.rows) AS Row_Count
FROM sys.tables t
JOIN sys.partitions p
    ON t.object_id = p.object_id
WHERE p.index_id IN (0,1)
GROUP BY t.schema_id, t.name
ORDER BY Row_Count DESC;


--    Null Checks

SELECT
    COUNT(*) AS TotalRows,
    SUM(CASE WHEN OrderDate IS NULL THEN 1 ELSE 0 END) AS OrderDate_Nulls,
    SUM(CASE WHEN CustomerID IS NULL THEN 1 ELSE 0 END) AS CustomerID_Nulls,
    SUM(CASE WHEN TerritoryID IS NULL THEN 1 ELSE 0 END) AS TerritoryID_Nulls,
    SUM(CASE WHEN SubTotal IS NULL THEN 1 ELSE 0 END) AS SubTotal_Nulls,
    SUM(CASE WHEN TaxAmt IS NULL THEN 1 ELSE 0 END) AS TaxAmt_Nulls,
    SUM(CASE WHEN Freight IS NULL THEN 1 ELSE 0 END) AS Freight_Nulls,
    SUM(CASE WHEN TotalDue IS NULL THEN 1 ELSE 0 END) AS TotalDue_Nulls,
    SUM(CASE WHEN ShipDate IS NULL THEN 1 ELSE 0 END) AS ShipDate_Nulls
FROM Sales.SalesOrderHeader;

SELECT 
    COUNT(*) AS TotalRows,
    SUM(CASE WHEN OrderQty IS NULL THEN 1 ELSE 0 END) AS OrderQty_Nulls,
    SUM(CASE WHEN ProductID IS NULL THEN 1 ELSE 0 END) AS ProductID_Nulls,
    SUM(CASE WHEN UnitPrice IS NULL THEN 1 ELSE 0 END) AS UnitPrice_Nulls,
    SUM(CASE WHEN UnitPriceDiscount IS NULL THEN 1 ELSE 0 END) AS UnitPriceDiscount_Nulls,
    SUM(CASE WHEN LineTotal IS NULL THEN 1 ELSE 0 END) AS LineTotal_Nulls
FROM Sales.SalesOrderDetail;

SELECT 
    COUNT(*) AS TotalRows,
    SUM(CASE WHEN PersonID IS NULL THEN 1 ELSE 0 END) AS PersonID_Nulls,
    SUM(CASE WHEN StoreID IS NULL THEN 1 ELSE 0 END) AS StoreID_Nulls,
    SUM(CASE WHEN TerritoryID IS NULL THEN 1 ELSE 0 END) AS TerritoryID_Nulls
FROM Sales.Customer;

SELECT 
    COUNT(*) AS TotalRows,
    SUM(CASE WHEN Name IS NULL THEN 1 ELSE 0 END) AS Name_Nulls,
    SUM(CASE WHEN CountryRegionCode IS NULL THEN 1 ELSE 0 END) AS CountryRegionCode_Nulls,
    SUM(CASE WHEN [Group] IS NULL THEN 1 ELSE 0 END) AS Group_Nulls,
    SUM(CASE WHEN SalesYTD IS NULL THEN 1 ELSE 0 END) AS SalesYTD_Nulls
FROM Sales.SalesTerritory;

SELECT 
    COUNT(*) AS TotalRows,
    SUM(CASE WHEN FirstName IS NULL THEN 1 ELSE 0 END) AS FirstName_Nulls,
    SUM(CASE WHEN LastName IS NULL THEN 1 ELSE 0 END) AS LastName_Nulls,
    SUM(CASE WHEN PersonType IS NULL THEN 1 ELSE 0 END) AS PersonType_Nulls
FROM Person.Person;

SELECT
    COUNT(*) AS TotalRows,
    SUM(CASE WHEN Name IS NULL THEN 1 ELSE 0 END) AS Name_Nulls,
    SUM(CASE WHEN ProductNumber IS NULL THEN 1 ELSE 0 END) AS ProductNumber_Nulls,
    SUM(CASE WHEN FinishedGoodsFlag IS NULL THEN 1 ELSE 0 END) AS FinishedGoodsFlag_Nulls,
    SUM(CASE WHEN StandardCost IS NULL THEN 1 ELSE 0 END) AS StandardCost_Nulls,
    SUM(CASE WHEN ListPrice IS NULL THEN 1 ELSE 0 END) AS ListPrice_Nulls,
    SUM(CASE WHEN ProductSubcategoryID IS NULL THEN 1 ELSE 0 END) AS ProductSubcategoryID_Nulls,
    SUM(CASE WHEN SellStartDate IS NULL THEN 1 ELSE 0 END) AS SellStartDate_Nulls
FROM Production.Product;

SELECT 
    COUNT(*) AS TotalRows,
    SUM(CASE WHEN ProductCategoryID IS NULL THEN 1 ELSE 0 END) AS ProductCategoryID_Nulls,
    SUM(CASE WHEN Name IS NULL THEN 1 ELSE 0 END) AS Name_Nulls
FROM Production.ProductSubcategory;

SELECT 
    COUNT(*) AS TotalRows,
    SUM(CASE WHEN Name IS NULL THEN 1 ELSE 0 END) AS Name_Nulls
FROM Production.ProductCategory;


--    Duplicate Checks 

SELECT
    SalesOrderID,
    COUNT(*) AS RecordCount
FROM Sales.SalesOrderHeader
GROUP BY SalesOrderID
HAVING COUNT(*) > 1;

SELECT
    ProductID,
    COUNT(*) AS RecordCount
FROM Production.Product
GROUP BY ProductID
HAVING COUNT(*) > 1;

SELECT
    CustomerID,
    COUNT(*) AS RecordCount
FROM Sales.Customer
GROUP BY CustomerID
HAVING COUNT(*) > 1;


--    Referential Checks 

SELECT
    sod.ProductID
FROM Sales.SalesOrderDetail sod
LEFT JOIN Production.Product p
    ON sod.ProductID = p.ProductID
WHERE p.ProductID IS NULL;

SELECT
    soh.TerritoryID
FROM Sales.SalesOrderHeader soh
LEFT JOIN Sales.SalesTerritory st
    ON soh.TerritoryID = st.TerritoryID
WHERE soh.TerritoryID IS NOT NULL
    AND st.TerritoryID IS NULL;


--    Date Range Checks 

SELECT
    MIN(OrderDate) AS EarliestOrderDate,
    MAX(OrderDate) AS LatestOrderDate
FROM Sales.SalesOrderHeader;

SELECT
    MIN(ShipDate) AS EarliestShipDate,
    MAX(ShipDate) AS LatestShipDate
FROM Sales.SalesOrderHeader;

SELECT
    MIN(SellStartDate) AS EarliestSellDate,
    MAX(SellStartDate) AS LatestSellDate
FROM Production.Product;


--    Business Logic Checks 

SELECT
    ProductID,
    Name
FROM Production.Product
WHERE ProductSubcategoryID IS NULL;

-- these 209 "products" are typically materials to make finished products:

SELECT 
    COUNT(*) AS Total_Products,
    COUNT(CASE WHEN FinishedGoodsFlag = 1 AND ProductSubcategoryID IS NOT NULL THEN 1 END) AS Finished_Goods,
    COUNT(CASE WHEN FinishedGoodsFlag = 0 AND ProductSubcategoryID IS NULL THEN 1 END) AS Unfinished_Goods
FROM Production.Product

-- this shows that there are no cases where a finished/sellable good has a missing product subcategory. 