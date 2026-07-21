## 01_raw_data_profiling.sql

Profiles the raw AdventureWorks dataset
- Calculates row counts for each source table
- Checks for null and missing values across key columns
- Identifies duplicate primary key records
- Validates referential integrity between related tables
- Reviews date ranges for orders, shipments, and product sales
- Performs business logic validation on product classifications
- Confirms finished goods are correctly assigned to product subcategories

---

## 02_staging.sql

Creates staging tables

- Copies source tables into staging tables
- Preserves raw data for transformation and reporting
- Creates staging tables for:
  - Sales orders
  - Sales order details
  - Customers
  - Sales territories
  - People
  - Products
  - Product subcategories
  - Product categories

---

## 03_view_creation.sql

Creates reporting views for Power BI

Creates Dimension Views
- dim_product
- dim_customer
- dim_territory

Creates Fact View
- fact_sales containing sales transactions and calculated metrics

Business Transformations
- Joins sales, customer, territory, and product data
- Filters products to finished goods only
- Calculates Gross Revenue
- Calculates Net Revenue after discounts
- Calculates Cost using standard product cost
- Calculates Profit for each sales line
* Creates customer classifications (Store vs Individual)
* Produces clean star-schema style views for reporting and dashboarding

---

## 04_business_analysis.sql

Performs business analysis using reporting views

Product Analysis
- Top 10 products by revenue

Customer Analysis
- Top 10 customers by total revenue

Time-Based Analysis
- Monthly revenue by year and month
- Running daily revenue totals using window functions

Revenue Insights
- Aggregates Net Revenue from the fact table
- Uses reporting views to analyse sales performance
- Demonstrates GROUP BY, aggregations, and `OVER()` window functions for trend analysis
