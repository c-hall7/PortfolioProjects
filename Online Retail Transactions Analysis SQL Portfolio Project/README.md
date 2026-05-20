# 🛒 Online Retail SQL Analysis (Portfolio Project)

## 📌 Project Overview

This project explores transactional online retail sales data to identify customer purchasing behaviour, sales performance trends, product-level insights, and return activity patterns.

The analysis was completed using SQL in SQLite and focuses on practical data analyst workflows including:
- data cleaning,
- data modelling,
- exploratory data analysis (EDA),
- customer and sales analysis,
- time-series analysis,
- and business insight communication.

The goal of this project was to strengthen my SQL and analytical thinking skills while building a professional data analytics portfolio project based on realistic retail transaction data.

---

## 📊 Dataset

Source: Kaggle — [Online Retail Dataset](https://www.kaggle.com/datasets/thedevastator/online-retail-transaction-data/data)

The dataset contains information on:
- Online retail transactions
- Product stock codes and descriptions
- Customer purchase activity
- Invoice dates and quantities
- Unit pricing and revenue
- Country-level sales activity
- Cancellation and return transactions

---

## 🛠️ Tools & Technologies Used

### Database & Querying
- SQL
- SQLite
- DB Browser for SQLite

### Skills Demonstrated
- Data Cleaning
- SQL Views & CTEs
- Exploratory Data Analysis
- Customer Segmentation
- Time-Series Analysis
- Window Functions
- Aggregate Functions
- Business KPI Analysis
- Data Modelling
- Insight Communication

---

## 🧹 Data Cleaning & Preparation

There are two data files in the "Data" folder:
- online_retail dataset.zip (the downloaded file)
- OnlineRetail_Cleaned.zip (the cleaned file)

The downloaded file used values in the InvoiceDate that were not SQLite friendly, so I used Python to convert the values and save a new, cleaned data file, and used this new file for the remainder of the project. 

The raw dataset also contained:
- cancellation transactions,
- stock adjustments,
- inconsistent product descriptions,
- incomplete transactions,
- and invalid operational records.

To improve analytical accuracy, multiple SQL views were created including:
- `Clean_Sales`
- `Returns_Transactions`

The cleaning process involved:
- separating cancellation and return activity,
- removing operational adjustment records,
- handling null values,
- filtering invalid transactions,
- and standardising analytical datasets for downstream analysis.

---

## 🔍 Key Questions Explored

### 1. Which products performed the best (and worst) by units sold and total revenue?
- Identified top-performing retail products
- Removed non-physical operational entries such as postage and manual adjustments
- Identified outlier transactions and bulk order behaviour

### 2. What customer purchasing patterns can be identified?
- Analysed top customers by total spend
- Calculated average order value (AOV)
- Compared repeat vs non-repeat customers

### 3. Which countries generated the highest sales revenue?
- Analysed total revenue contribution by country
- Compared UK sales performance against international markets
- Compared customer population of countries

### 4. How do sales trends change over time?
- Created monthly revenue analysis
- Calculated month-on-month growth trends
- Applied rolling 3-month averages using window functions
- Investigated seasonal purchasing behaviour

### 5. What patterns exist within return and cancellation activity?
- Analysed cancellation and return transaction behaviour
- Investigated products with the highest return activity
- Explored the impact of bulk return outliers
- Compared return frequency against return volume

---

## 📈 Key Insights

- Sales revenue was heavily concentrated within the United Kingdom, contributing the majority of total sales activity.
- Customer spending was highly skewed, with a relatively small number of customers contributing a disproportionately large share of total revenue.
- Return and cancellation activity represented a significant proportion of transactions, suggesting high customer dissatisfaction.
- Monthly sales trends demonstrated seasonal fluctuations, with noticeable variation in revenue performance throughout the year.
- Product return activity was heavily influenced by a small number of bulk return events, creating significant outliers within the dataset.
- Window functions and rolling averages provided clearer visibility into underlying sales trends beyond short-term trends.

---

## 💼 Business Recommendations

- Investigate products and operational processes associated with high return and cancellation activity.
- Develop customer retention strategies focused on repeat purchasers and high-value customers.
- Align inventory planning and marketing activity with seasonal demand trends.

---

## ⚠️ Limitations

- Cancellation records were stored as separate transactions and could not always be directly linked to original invoices.
- Large bulk-order returns created significant outliers that may distort product-level return analysis.
- The dataset does not include product categories, profit margins, or operational fulfilment data.
- Return transactions may include operational adjustments in addition to true customer-driven returns.
- IMPORTANT: The analysis represents gross sales activity rather than full accounting-level net sales reconciliation due to these limitations.
