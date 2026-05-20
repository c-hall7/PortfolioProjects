SELECT *
FROM OnlineRetail_Cleaned;



-- Product Performance Analysis

-- what are the top selling products (by units sold and total revenue)?
	-- what percentage do these products make up of total revenue?
-- what are the lowest performing products?


	SELECT 
		ROW_NUMBER() OVER (ORDER BY SUM(Quantity * UnitPrice) DESC) AS Rank,
		StockCode, 
		Description,
		UnitPrice,
		SUM(Quantity) AS Total_Sold,
		SUM(Quantity * UnitPrice) AS Total_Revenue,
		ROUND((SUM(Quantity * UnitPrice) /
		(
			SELECT SUM(Quantity * UnitPrice)
            FROM Clean_Sales
            WHERE StockCode NOT IN ('POST', 'M')		-- removes non-physical products
        )) * 100, 2) AS Contribution_Percentage,
		COUNT(DISTINCT InvoiceNo) AS Total_Orders
	FROM Clean_Sales
	WHERE StockCode NOT IN ('POST', 'M')				-- removes non-physical products
	GROUP BY StockCode, Description
	ORDER BY Total_Revenue DESC LIMIT 50; 				-- ORDER BY Total_Sold DESC LIMIT 50

-- the highest revenue-generating product contributed 1.92% of total revenue of all products.
-- in total, the top 10 products contribute to 9.6% of total revenue.
-- considering the 4,070 total products, these products make up a disproportionate amount of revenue,
-- indicating strong product concentration and potential dependence on key inventory items.
-- NOTE: a count for total orders were added after I discovered that the top selling product was actually a cancelled order,
-- therefore, this product made no sales and therefore did not contribute to the net sales of the data. 



	SELECT 
		StockCode, 
		Description,
		UnitPrice,
		SUM(Quantity) AS Total_Sold,
		SUM(Quantity * UnitPrice) AS Total_Revenue
	FROM Clean_Sales
	WHERE StockCode NOT IN ('PADS')				-- removes non-physical products
	GROUP BY StockCode, Description
	ORDER BY Total_Revenue LIMIT 50;

-- these are the 50 lowest performing products in terms of revenue. 
-- the 50th lowest performing product makes up £3.30 of the total revenue. 
-- most of these products have only one unit sold, which begs another question:
-- how many products have only one unit sold?

	SELECT 
		StockCode, 
		Description,
		UnitPrice,
		SUM(Quantity) AS Total_Sold
	FROM Clean_Sales
	GROUP BY StockCode, Description
	HAVING SUM(Quantity) = 1;

-- a total of 59 products have only one unit ever sold during the data's dates.





-- Customer Analysis

-- what are the top customers by spend?
-- what is the average customer's spend?
-- how many repeat and one-time customers are there?


	SELECT
		Country,
		CustomerID,
		ROUND(SUM(Quantity * UnitPrice), 2) AS Total_Spend,
		SUM(Quantity) AS Total_Products,
		COUNT(DISTINCT InvoiceNo) AS No_of_Orders
	FROM Clean_Sales
	GROUP BY CustomerID
	ORDER BY Total_Spend DESC LIMIT 20;

-- this dataset shows the top 20 customers and their total spend, 
-- as well as the total products they have bought and number of orders they have placed. 
-- the top spender is from the Netherlands, and has placed 73 orders totalling £280k.




	SELECT
		Country,
		CustomerID,
		ROUND(SUM(Quantity * UnitPrice) / COUNT(DISTINCT InvoiceNo), 2) AS Average_Order_Value,
		COUNT(DISTINCT InvoiceNo) AS No_of_Orders
	FROM Clean_Sales
	GROUP BY CustomerID
	ORDER BY Average_Order_Value DESC LIMIT 20;
	
-- this analysis highlights customers with the highest average order value per transaction,
-- providing insight into customers with high-value purchasing behaviour within the dataset.



	SELECT
		SUM(CASE WHEN No_of_Orders > 1 THEN 1 ELSE 0 END) AS Repeat_Customers,
		SUM(CASE WHEN No_of_Orders = 1 THEN 1 ELSE 0 END) AS Non_Repeat_Customers,
		COUNT(DISTINCT CustomerID) AS Total_Customers
	FROM (
		SELECT
			CustomerID,
			COUNT(DISTINCT InvoiceNo) AS No_of_Orders
		FROM Clean_Sales
		GROUP BY CustomerID
	);
	
-- out of the 4338 total customers, 2845 are repeat customers, while 1493 have only made one purchase. 
-- because of this, potential strategies for customer retention should be explored, such as a loyalty program.  





-- Geographic Analysis

-- which countries spend the most?
-- how many customers are from each country?
-- which countries have the highest revenue per customer?


	SELECT
		Country,
		COUNT(DISTINCT CustomerID) AS Total_Customers,
		ROUND(SUM(Quantity * UnitPrice) / COUNT(DISTINCT InvoiceNo), 2) AS Average_Order_Value,
		ROUND(SUM(Quantity * UnitPrice), 2) AS Total_Sales
		FROM Clean_Sales
	GROUP BY Country
	ORDER BY Average_Order_Value DESC;
	
-- this dataset shows average order value per country.
-- although the UK is the highest overall for total revenue, their per order revenue is 29th / 37,
-- indicating that other countries have higher per-customer purchases



	SELECT
		Country,
		COUNT(DISTINCT CustomerID) AS Total_Customers,
		ROUND(SUM(Quantity * UnitPrice) / COUNT(DISTINCT CustomerID), 2) AS Revenue_Per_Customer,
		ROUND(SUM(Quantity * UnitPrice) / COUNT(DISTINCT InvoiceNo), 2) AS Average_Order_Value
	FROM Clean_Sales
	GROUP BY Country
	ORDER BY Revenue_Per_Customer DESC;

-- this dataset displays the countries with the most valuable customers.
-- EIRE have 3 customers that each have an average total spend of £88k.
-- the UK have the 17th highest revenue per customer with £1,864.





-- Time-Based Analysis

-- what months are busiest?
-- are there any seasonality trends?
-- are there any sales over time trends?


	SELECT
		strftime('%m', InvoiceDate) AS Month,
		ROUND(SUM(Quantity * UnitPrice), 2) AS Monthly_Revenue,
		COUNT(DISTINCT InvoiceNo) AS Total_Orders,
		SUM(Quantity) AS Products_Sold
	FROM Clean_Sales
	GROUP BY Month
	ORDER BY Monthly_Revenue DESC;
	
-- the busiest months are the last 3 of the calendar year, indicating seasonality effects on sales. 
-- December of 2010 and 2011 were grouped together as neither represented a full month's data.
-- February was the lowest month for revenue, selling only 38% of that of November's sales.



	WITH Monthly AS (
		SELECT
			strftime('%Y-%m', InvoiceDate) AS Sales_Month,
			ROUND(SUM(Quantity * UnitPrice), 2) AS Monthly_Revenue,
			SUM(ROUND(SUM(Quantity * UnitPrice), 2)) OVER (ORDER BY strftime('%Y-%m', InvoiceDate)) AS Running_Total,
			SUM(Quantity) AS Products_Sold
		FROM Clean_Sales
		GROUP BY Sales_Month
	)
	SELECT
		Sales_Month,
		Products_Sold,
		Monthly_Revenue,
		ROUND(((Monthly_Revenue - LAG(Monthly_Revenue) OVER (ORDER BY Sales_Month))
			/ LAG(Monthly_Revenue) OVER (ORDER BY Sales_Month)) * 100, 2) AS MoM_Percentage_Change,
		Running_Total
	FROM Monthly
	ORDER BY Sales_Month
	LIMIT 11 OFFSET 1;							-- complete monthly data only

-- sales remain steady all year, with a moderate spike in March, and then again in May,
-- which continues into the later months. 
-- in September, sales spike by 47%, which was the largest month-on-month increase.
-- sales then continue to increase until the new year. 



	WITH Monthly_Sales AS (
		SELECT
			strftime('%Y-%m', InvoiceDate) AS Sales_Month,
			ROUND(SUM(Quantity * UnitPrice), 2) AS Monthly_Revenue,
			COUNT(DISTINCT InvoiceNo) AS Total_Orders,
			SUM(Quantity) AS Products_Sold
		FROM Clean_Sales
		GROUP BY strftime('%Y-%m', InvoiceDate)
	)
	SELECT
		Sales_Month,
		Monthly_Revenue,
		ROUND(AVG(Monthly_Revenue) OVER (
			ORDER BY Sales_Month
			ROWS BETWEEN 3 PRECEDING AND 1 PRECEDING), 2) AS Three_Month_Avg,
		ROUND(
			Monthly_Revenue -
			AVG(Monthly_Revenue) OVER (
				ORDER BY Sales_Month
				ROWS BETWEEN 3 PRECEDING AND 1 PRECEDING), 2) AS Monthly_Performance
	FROM Monthly_Sales;
	
-- this model presents the 3 month average for the period before it, 
-- as well as the current month's performance when compared to it.
-- as expected, the monthly performance increases in the final 3 months when compared to their previous quarter. 
