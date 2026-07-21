
-- Creating Views for Power BI

CREATE VIEW dim_product AS
SELECT
    p.ProductID,
    p.Name AS ProductName,
    p.StandardCost,
    p.ListPrice,
    sc.Name AS SubCategory,
    c.Name AS Category
FROM stg_products p
LEFT JOIN stg_subcategories sc
    ON p.ProductSubcategoryID = sc.ProductSubcategoryID
LEFT JOIN stg_categories c
    ON sc.ProductCategoryID = c.ProductCategoryID
WHERE p.FinishedGoodsFlag = 1;

CREATE VIEW fact_sales AS
SELECT
    so.SalesOrderID,
    CAST(so.OrderDate AS DATE) AS OrderDate,
    so.CustomerID,
    so.TerritoryID,
    sd.ProductID,
    sd.OrderQty,
    sd.UnitPrice,
    sd.UnitPriceDiscount,
    (sd.OrderQty * sd.UnitPrice) AS GrossRevenue,
    (sd.OrderQty * sd.UnitPrice * (1 - sd.UnitPriceDiscount)) AS NetRevenue,
    (sd.OrderQty * p.StandardCost) AS Cost,
    (sd.OrderQty * sd.UnitPrice * (1 - sd.UnitPriceDiscount)) 
        - (sd.OrderQty * p.StandardCost) AS Profit
FROM stg_sales_orders so
JOIN stg_sales_details sd
    ON so.SalesOrderID = sd.SalesOrderID
JOIN stg_products p
    ON sd.ProductID = p.ProductID;

CREATE VIEW dim_customer AS
SELECT
    c.CustomerID,
    CASE WHEN c.PersonID IS NULL THEN 'Store' ELSE 'Individual' END AS CustomerType,
    p.FirstName + ' ' + p.LastName AS FullName
FROM stg_customers c
LEFT JOIN stg_person p
    ON c.PersonID = p.BusinessEntityID;

CREATE VIEW dim_territory AS
SELECT
    TerritoryID,
    Name AS TerritoryName,
    CountryRegionCode
FROM stg_territories;