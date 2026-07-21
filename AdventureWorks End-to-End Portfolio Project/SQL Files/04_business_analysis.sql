
-- Basic Analysis of Views


-- Top 10 Products

SELECT TOP 10
    fs.ProductID,
    dp.ProductName,
    SUM(fs.NetRevenue) AS Revenue
FROM fact_sales fs
JOIN dim_product dp
    ON fs.ProductID = dp.ProductID
GROUP BY fs.ProductID, dp.ProductName
ORDER BY Revenue DESC;


-- Top 10 Customers

SELECT TOP 10
    fs.CustomerID,
    c.FullName,
    SUM(fs.NetRevenue) AS Revenue
FROM fact_sales fs
JOIN dim_customer c
    ON fs.CustomerID = c.CustomerID
GROUP BY fs.CustomerID, c.FullName
ORDER BY Revenue DESC;


-- Monthly Revenue (in order of revenue)

SELECT
    YEAR(OrderDate) AS Year,
    MONTH(OrderDate) AS Month,
    SUM(NetRevenue) AS Revenue
FROM fact_sales
GROUP BY
    YEAR(OrderDate),
    MONTH(OrderDate);


-- Running Daily Revenue Total

SELECT
    OrderDate,
    SUM(NetRevenue) AS DailyRevenue,
    SUM(SUM(NetRevenue))
        OVER (
            ORDER BY OrderDate
        ) AS RunningRevenue
FROM fact_sales
GROUP BY OrderDate;
