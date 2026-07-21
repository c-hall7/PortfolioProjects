# 🚴 AdventureWorks2022 SQL & Power BI Sales Analysis (Portfolio Project)

## 📌 Project Overview

This project analyses the AdventureWorks2022 sample database to explore sales performance, customer behaviour, product performance, and regional sales trends using Microsoft SQL Server and Power BI.

The project follows a typical business intelligence workflow, including:
- data profiling,
- data cleaning and preparation,
- staging and semantic modelling,
- exploratory data analysis (EDA),
- SQL view creation,
- Power BI data modelling,
- dashboard development,
- and business insight communication.

The aim of this project was to strengthen my SQL and Power BI skills while demonstrating an end-to-end analytics workflow that mirrors industry practices for data analysts.

---

## 📊 Dataset

Source: Microsoft — [AdventureWorks2022 Sample Database](https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver17&tabs=ssms)

AdventureWorks is Microsoft's sample transactional database representing the operations of a fictional bicycle manufacturing company.

The analysis focuses primarily on the Sales and Production schemas, including:
- Customer sales orders
- Product catalogue and product hierarchy
- Customer information
- Sales territories
- Order-level and line-level transactions
- Product pricing and costs

---

## 🛠️ Tools & Technologies Used

### Database & Querying
- Microsoft SQL Server
- SQL Server Management Studio 22 (SSMS)

### Data Visualisation
- Microsoft Power BI
- [Simple Modern Dark Power BI Theme Template](https://community.fabric.microsoft.com/t5/Themes-Gallery/Simply-Modern-Dark/td-p/2088606)

### Skills Demonstrated
- Data Profiling
- Data Cleaning
- SQL Views
- Data Modelling
- Star Schema Design
- Exploratory Data Analysis
- Aggregate Functions
- JOIN Operations
- Common Table Expressions (CTEs)
- Window Functions
- Business KPI Analysis
- Dashboard Design
- Insight Communication

---

## 🧹 Data Preparation & Modelling

Before analysis, the AdventureWorks tables were profiled to assess overall data quality by checking:
- row counts,
- duplicate records,
- null values,
- referential integrity,
- and date ranges.

A staging layer was then created to provide a controlled copy of the source data prior to modelling.

The staging tables include:
- `stg_sales_orders`
- `stg_sales_details`
- `stg_customers`
- `stg_person`
- `stg_products`
- `stg_subcategories`
- `stg_categories`
- `stg_territories`

To simplify reporting within Power BI, a semantic layer of SQL views was created:
- `vw_fact_sales`
- `vw_dim_product`
- `vw_dim_customer`

The views apply business logic by:
- joining related tables,
- simplifying the AdventureWorks schema,
- creating reusable analytical datasets,
- filtering products to finished goods only,
- exposing business-friendly fields for reporting.

This layered approach separates the raw source data from the reporting model and mirrors common business intelligence workflows.

---

## 🔍 Key Questions Explored

### 1. How has overall sales performance changed over time?
- Analysed revenue trends by month and year
- Compared sales performance across different time periods
- Identified seasonal trends in order volume

### 2. Which products and product categories generate the most revenue?
- Ranked products by sales revenue
- Compared category and subcategory performance
- Identified highest-performing product groups

### 3. Who are the highest-value customers?
- Ranked customers by total spending
- Analysed purchasing behaviour
- Compared customer contribution to total revenue

### 4. Which sales territories perform best?
- Compared sales across territories
- Identified regional differences in revenue
- Analysed customer distribution by territory

---

## 📈 Power BI Dashboard

The SQL views were imported into Power BI using a star schema model.

The dashboard includes:
- Executive Overview
- Product Analysis
- Customer Insights
- Regional Performance
- Time Trends

Key measures include:
- Total Revenue
- Total Profit
- Total Orders
- Total Customers
- Average Order Value (AOV)
- Profit Margin %
- Revenue per Customer

---

## 📈 Key Insights

- Sales revenue is concentrated within a relatively small number of products and customers.
- Product categories contribute differently to both revenue and profitability.
- Customer purchasing behaviour follows a Pareto-like distribution, with a small proportion of customers generating a large share of total sales.
- Sales performance varies across territories, indicating regional differences in demand.
- Separating the AdventureWorks schema into fact and dimension views simplified reporting and improved Power BI data modelling.

---

## 💼 Business Recommendations

- Focus customer retention strategies on high-value repeat customers.
- Prioritise inventory planning for consistently high-performing product categories.
- Investigate opportunities to improve sales performance in lower-performing territories.
- Monitor product profitability alongside revenue to better support pricing decisions.

---

## ⚠️ Limitations

- AdventureWorks is a fictional sample database and may not fully reflect the complexity of real-world commercial operations.
- Profit calculations are estimated using standard product costs rather than actual operational costs.
- The analysis focuses on historical transactional data and does not include forecasting or predictive modelling.
- Manufacturing, inventory, and supply chain processes were outside the scope of this project.
