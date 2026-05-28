# 📊 Superstore Sales Dashboard (Power BI Portfolio Project)

## 📌 Project Overview

This project explores retail sales performance data using an interactive Power BI dashboard built on a star schema data model. The dashboard focuses on analysing sales, profitability, customer behaviour, product performance, and operational trends across multiple regions and product categories.

The project was completed using Microsoft Power BI and focuses on practical business intelligence workflows including:

* data cleaning,
* dimensional modelling,
* dashboard design,
* DAX calculations,
* data visualisation,
* and insight communication.

The goal of this project was to strengthen my real-world business intelligence and dashboard development skills while building a professional data analytics portfolio.

---

## 📊 Dataset

Source: Kaggle — [Superstore Sales Dataset](https://www.kaggle.com/datasets/laibaanwer/superstore-sales-dataset)

The dataset contains information on:

* Customer orders and transactions
* Product categories and sub-categories
* Sales, profit, discount, and shipping costs
* Customer segmentation and regional markets
* Shipping methods and order priorities
* Order and shipping dates

---

## 🛠️ Tools & Skills Used

### Software

* Microsoft Power BI

### Data Modelling

* Star Schema Design
* Fact & Dimension Table Modelling
* Relationship Management

### DAX Measures

* Total Sales
* Total Profit
* Profit Margin %
* Average Discount %
* Customer Segmentation Metrics

### Skills Demonstrated

* Data Cleaning
* Dimensional Modelling
* Dashboard Design
* Data Visualisation
* KPI Reporting
* Time Series Analysis
* Business Intelligence Reporting
* Insight Communication

---

## 🗂️ Data Model Structure

The dataset was transformed into a star schema model consisting of:

### Fact Table

#### FactSales

* CustomerID
* ProductKey
* order_id
* order_date
* ship_date
* order_priority
* ship_mode
* shipping_cost
* profit
* sales
* quantity
* discount

### Dimension Tables

#### DimCustomer

* CustomerID
* customer_name
* country
* state
* region
* market
* segment

#### DimProduct

* ProductKey
* product_id
* product_name
* category
* sub_category

#### DimDate

* Date
* Month
* MonthNumber
* MonthYear
* Quarter
* Year

---

## 📈 Dashboard Pages

### 1. Executive Overview

* KPI summary cards for sales, profit, and customer metrics
* Sales and profit trends over time
* Monthly performance comparison visuals
* Regional and segment-level business insights

### 2. Product Overview

* Product category and sub-category sales distribution
* Profitability analysis across categories
* Discount vs profit analysis
* Product performance trend visualisations

### 3. Product Rankings

* Top 10 products by sales
* Bottom 10 products by profit
* Product-level performance comparisons

### 4. Customer & Segmentation Analysis

* Top customer analysis
* Customer segment performance
* Regional customer distribution
* Customer profitability insights

### 5. Shipping & Operations

* Shipping mode analysis
* Order priority trends
* Shipping cost comparisons
* Operational performance insights

---

## 🔍 Key Questions Explored

### 1. Which product categories generate the highest sales and profit?

* Compared category and sub-category sales performance
* Investigated profitability differences between product groups

### 2. Which products are the best and worst performers?

* Identified top-performing products by revenue
* Analysed products generating low or negative profit

### 3. Do discounts negatively impact profitability?

* Compared average discount rates across sub-categories
* Investigated the relationship between discounts and profit margins

### 4. Which customer segments and regions generate the most revenue?

* Compared sales across customer segments
* Analysed regional performance trends and market distribution

### 5. How do sales and profits change over time?

* Analysed monthly sales trends
* Examined seasonal patterns and time-based performance changes

### 6. How do shipping methods and operational choices affect business performance?

* Compared shipping costs and profitability by shipping mode
* Investigated operational trends across order priorities

---

## 📈 Key Insights

* Sales were concentrated within a small number of high-performing product categories and products.
* Some high-revenue products generated low profitability due to discounting strategies.
* Technology products generally produced stronger profit margins compared to Furniture categories.
* Customer purchasing behaviour varied significantly between market segments and regions.
* Monthly sales trends showed clear fluctuations throughout the year, suggesting seasonal demand patterns.
* Certain shipping methods incurred significantly higher costs without proportional increases in profitability.
* A small proportion of customers contributed a disproportionately large percentage of total revenue.

---

## ⚠️ Limitations

* The dataset represents historical transactional data and may not reflect current retail market conditions.
* Customer IDs and Product Keys were artificially generated due to missing unique identifiers in the original dataset.
* The dataset does not include external business factors such as marketing spend, inventory levels, or supplier costs.
* Some operational insights are limited by the absence of delivery duration and return/refund information.
* Time-based analysis was constrained to the available historical data range.

---
