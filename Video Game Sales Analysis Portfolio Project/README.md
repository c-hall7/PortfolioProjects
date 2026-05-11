# 🎮 Video Game Sales Analysis

## 📌 Project Overview

This project explores video game sales data to identify patterns in regional preferences, genre popularity, console generation performance, and the relationship between review scores and commercial success.

The analysis was completed using Python and focuses on practical data analyst workflows including:
- data cleaning,
- exploratory data analysis (EDA),
- data visualization,
- and insight communication.

The goal of this project was to strengthen real-world analytical skills while building a professional data analytics portfolio.

---

## 📊 Dataset

Source: Kaggle — Video Game Sales with Ratings Dataset

The dataset contains information on:
- Video game sales across multiple regions
- Critic and user review scores
- ESRB ratings
- Publishers and platforms
- Release years and genres

---

## 🛠️ Tools & Libraries Used

### Programming Language
- Python

### Libraries
- Pandas
- NumPy
- Matplotlib
- Seaborn

### Skills Demonstrated
- Data Cleaning
- Missing Value Handling
- Exploratory Data Analysis
- Correlation Analysis
- Data Visualization
- Trend Analysis
- Insight Communication

---

## 🔍 Key Questions Explored

### 1. What are the top-selling games in each region?
- Compared regional sales performance
- Investigated whether game age influenced sales trends

### 2. Which genres are the most popular?
- Analyzed global genre popularity
- Compared genre preferences across regions

### 3. How do game sales change across console generations?
- Examined sales trends between PlayStation generations
- Investigated lifecycle patterns of gaming platforms

### 4. Is there a relationship between critic scores and sales?
- Created correlation analysis between review scores and global sales
- Investigated how strongly reviews relate to commercial success

### 5. Do publishers influence commercial performance?
- Compared total and average sales across publishers
- Explored differences between publisher scale and per-title success

### 6. Does ESRB rating impact game sales?
- Compared sales performance across maturity ratings
- Grouped rare ESRB categories to reduce statistical noise

---

## 📈 Key Insights

- Video game sales are highly right-skewed, with a small number of blockbuster titles dominating total revenue.
- Action and Sports games generated the highest global sales overall.
- Regional preferences differ significantly, with Japan showing stronger interest in RPG titles compared to North America and Europe.
- Console generations appear to follow a lifecycle pattern, where sales peak mid-generation before declining after the release of newer hardware.
- Critic scores show a moderate positive correlation with sales, although reviews alone do not determine commercial success.
- Mature-rated games often produced higher sales totals, likely influenced by major AAA franchises.

---

## ⚠️ Limitations

- Missing review score data reduced sample sizes for some analyses.
- Sales distributions were heavily skewed by blockbuster games.
- Correlation analysis was limited to true numerical variables to avoid misleading categorical correlations.
- The dataset does not include external factors such as marketing budgets, development costs, or digital storefront data.

---

## 📁 Repository Structure

```text
Video-Game-Sales-Analysis/
│
├── data/
│   └── vgsales.csv
│
├── notebook/
│   └── analysis.ipynb
│
└── README.md
