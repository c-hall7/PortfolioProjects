SELECT *
FROM OnlineRetail_Cleaned;



-- Dataset Overview


	SELECT 
		COUNT(*) AS Row_Count, 
		COUNT(DISTINCT CustomerID) AS Unique_Customers, 
		COUNT(DISTINCT StockCode) AS Unique_Products, 
		COUNT(DISTINCT Country) AS Total_Countries,
		MIN(InvoiceDate) AS First_Invoice,
		MAX(InvoiceDate) AS Last_Invoice
	FROM OnlineRetail_Cleaned;

	SELECT DISTINCT Country as Represented_Countries
	FROM OnlineRetail_Cleaned;

-- the raw dataset contained non-SQLite friendly InvoiceDate values, so I converted the values in Python.
-- there are 541,909 rows,
-- 4,372 unique customers and 4,070 unique products,
-- 38 total represented countries,
-- and the data spans from the 1st of December, 2010 to the 9th of December, 2011





-- Null & Missing Value Checks


	SELECT
		COUNT(CASE WHEN CustomerID IS NULL THEN 1 END) AS Null_Customers,
		COUNT(CASE WHEN Description IS NULL THEN 1 END) AS Null_Descriptions,
		COUNT(CASE WHEN Description IS NULL OR CustomerID IS NULL THEN 1 END) AS Incomplete_Transactions
	FROM OnlineRetail_Cleaned;

-- the dataset contains 135,080 rows with "NULL" CustomerID values,
-- 1,454 rows with a "NULL" Description value,
-- and 135,080 rows with either a "NULL" CustomerID or Description value (incomplete transactions).
-- therefore, every row with a "NULL" Description value also has a "NULL" CustomerID value. 





-- Transaction Type Exploration


	SELECT *
	FROM OnlineRetail_Cleaned
	WHERE InvoiceNo LIKE 'C%';
	
	SELECT *
	FROM OnlineRetail_Cleaned
	WHERE Quantity < 0 
		AND InvoiceNo NOT LIKE 'C%';
	
	SELECT *
	FROM OnlineRetail_Cleaned
	WHERE Description LIKE 'Discount';	
	
	SELECT
		COUNT(CASE WHEN InvoiceNo LIKE 'C%' THEN 1 END) AS Cancellations,
		COUNT(CASE WHEN Quantity < 0 AND InvoiceNo NOT LIKE 'C%' THEN 1 END) AS Invalid_Transaction,
		COUNT(CASE WHEN Description LIKE 'Discount' THEN 1 END) AS Discounts
	FROM OnlineRetail_Cleaned;
	
-- this exploration has revealed that the dataset contains multiple transaction types beyond standard retail sales.
-- other recorded transaction types included cancellations, returns, discounts, and operational correction entries.
-- invoices that begin with "c" represented cancelled transactions and commonly had negative quantity values,
-- indicating that these transactions were returns or refunds. 
-- in addition, some transactions contained negative quantity values without the "c" invoice number,
-- suggesting these values are stock corrections such as damages or human errors.
-- discount entries were also identified, with the same "c" invoice number and negative quantities.

-- because this raw dataset combines customer purchases with operational and accounting records, 
-- using the raw table for revenue and sales analysis would cause distorted results and therefore inaccurate business insights;
-- therefore, I have separated the dataset into multiple analytical views to be used across the analysis.
-- these views are:

-- View for Sales (for valid retail transactions)

	DROP VIEW IF EXISTS Clean_Sales;

	CREATE VIEW Clean_Sales AS
	SELECT *
	FROM OnlineRetail_Cleaned
	WHERE Quantity > 0
		AND UnitPrice > 0
		AND CustomerID IS NOT NULL
		AND Description IS NOT NULL
		AND InvoiceNo NOT LIKE 'C%';

	SELECT *
	FROM Clean_Sales;
	
	-- NOTE: the dataset records cancellations as seperate transactions using the "C" prefix in the invoice number.
	-- these cancellation entries are not linked to the original invoice and do not automatically reverse or modify the original sales record.
	-- therefore, cancellation records were excluded from this dataset to ensure analysis reflects completed sales transactions only. 
	-- this means that ALL ANALYSES MADE WITH THE Clean_Sales DATASET ARE REPRESENTING GROSS SALES, NOT NET SALES.


-- View for Returns (for cancellations and returns)

	DROP VIEW IF EXISTS Returns_Transactions;

	CREATE VIEW Returns_Transactions AS
	SELECT *
	FROM OnlineRetail_Cleaned
	WHERE Quantity < 0
		AND UnitPrice > 0
		AND CustomerID IS NOT NULL
		AND Description IS NOT NULL
		AND InvoiceNo LIKE 'C%'
		AND Description NOT LIKE '%discount%';
	   
	SELECT *
	FROM Returns_Transactions;

	
	
	
   
-- Basic Sales Exploration


	SELECT 
		Country,
		ROUND(SUM(Quantity * UnitPrice), 2) AS Total_Spend
	FROM Clean_Sales
	GROUP BY Country
	ORDER BY Total_Spend DESC LIMIT 10;
	
-- the top selling country is the United Kingdom, where the sample data's online retail company is based.
-- the next highest is 96% less than that of the United Kingdom, which is the Netherlands.
-- I then wanted to see the proportion of sales that the UK contributed to:

	SELECT 
		ROUND(SUM(CASE WHEN Country = 'United Kingdom' THEN Quantity * UnitPrice ELSE 0 END), 2) AS UK_Sales,
		SUM(CASE WHEN Country != 'United Kingdom' THEN Quantity * UnitPrice ELSE 0 END) AS Other_Sales,
		ROUND((SUM(CASE WHEN Country = 'United Kingdom' THEN Quantity * UnitPrice ELSE 0 END) / 
		SUM(Quantity * UnitPrice)) * 100, 2) AS Percentage_UK_Sales
	FROM Clean_Sales;
	
-- the UK makes up 82% of the online retail company's total revenue.
	
	
	
	SELECT 
		StockCode, 
		Description,
		SUM(Quantity * UnitPrice) AS Total_Sales
	FROM Clean_Sales
	WHERE StockCode NOT IN ('POST', 'M')				-- removes non-physical products
	GROUP BY StockCode, Description
	ORDER BY Total_Sales DESC LIMIT 10;
	
-- these are the top 10 highest revenue-generating products.
	
	
	
	SELECT 
		ROUND(SUM(Quantity * UnitPrice), 2) AS Total_Revenue, 
		COUNT(DISTINCT InvoiceNo) AS Total_Orders,
		SUM(Quantity) AS Total_Products_Sold,
		ROUND(SUM(Quantity * UnitPrice) / COUNT(DISTINCT InvoiceNo), 2) AS Average_Order_Value
	FROM Clean_Sales;
	
-- these are basic revenue calculations. 
-- the total revenue is £8.9m, with 18.5k orders and 5.1m products sold.
-- the average value for each order was £480.
	
	
	
	SELECT
		strftime('%Y-%m', InvoiceDate) AS Sales_Month,
		ROUND(SUM(Quantity * UnitPrice), 2) AS Monthly_Revenue,
		COUNT(DISTINCT InvoiceNo) AS Total_Orders,
		SUM(Quantity) AS Products_Sold
	FROM Clean_Sales
	GROUP BY Sales_Month
	ORDER BY Monthly_Revenue DESC;      --	ORDER BY Sales_Month;     <-- for chronological data

-- these are sales values by month, in order of revenue.
	