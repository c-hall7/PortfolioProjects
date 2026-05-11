# 🎮 Video Game Sales Analysis (Portfolio Project)

## 📌 Project Overview

This project explores video game sales data with regional sales performance data to identify patterns such as regional preferences, genre popularity, console generation performance, and the possible relationship between review scores and commercial success.

The analysis was completed using Python on Jupyter Notebook and focuses on practical data analyst workflows including:
- data cleaning,
- exploratory data analysis (EDA),
- data visualisation,
- and insight communication.

The goal of this project was to learn/strengthen my real-world analytical skills while building a professional data analytics portfolio.

---

## 📊 Dataset

Source: Kaggle — [Video Game Sales with Ratings Dataset](https://www.kaggle.com/datasets/rush4ratio/video-game-sales-with-ratings/data)

The dataset contains information on:
- Video game sales across multiple regions
- Release years and genres
- Critic and user review scores
- ESRB ratings
- Publishers and platforms
  
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
- Data Visualisation
- Trend Analysis
- Insight Communication

---

## 🔍 Key Questions Explored

### 1. What are the top selling games for each region?
- Compared regional sales performance
- Investigated whether game age influenced sales trends

### 2. Which genres are the most popular? Are there regions that enjoy certain genres more than others?
- Analysed global genre popularity
- Compared genre preferences across regions

### 3. Are console sales rising or falling with each generation?
- Examined sales trends between PlayStation generations
- Investigated lifecycle patterns of gaming platforms

### 4. Is there a correlation between critic scores and sales?
- Created correlation analysis between critic review scores and global sales
- Investigated how strongly reviews relate to commercial success

### 5. Does the publisher effect the game's success?
- Compared total and average sales across publishers
- Explored differences between publisher scale and per-title success
- Removed publishers with less than 10 games to reduce inaccurate results

### 6. Does the game's ESRB (maturity) rating effect sales?
- Compared sales performance across maturity ratings
- Grouped rare ESRB categories to reduce statistical noise

---

## 📈 Key Insights

- Video game sales are highly right-skewed, with a small number of blockbuster titles dominating total revenue.
- Action and Sports games generated the highest global sales overall, however, Platform and Shooter games faired best per title.
- Regional preferences differ significantly, with Japan showing stronger interest in Role-Playing titles compared to North America and Europe.
- Console generations appear to follow a lifecycle pattern, where sales peak mid-generation before declining after the release of newer hardware.
- Critic scores show a moderate positive correlation with sales, however, the relationship is not strong enough to imply causation.
- Publishers which have the highest global sales were absent in average sales per game, showing that publisher size does not lead to individual title success. 
- Mature-rated games often produced higher sales totals, likely influenced by major AAA franchises.

---

## ⚠️ Limitations

- Missing review score data reduced sample sizes for some analyses.
- Sales distributions were heavily skewed by blockbuster games.
- Correlation analysis was limited to true numerical variables to avoid misleading categorical correlations.
- The dataset does not include external factors such as marketing budgets, development costs, or game pricing.
