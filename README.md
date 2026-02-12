# 📊 Sales Performance Dashboard (SQL)

## 🚀 Project Overview

This project demonstrates an end-to-end Sales Performance Analytics solution using SQL. 

The objective is to analyze revenue performance, salesperson efficiency, regional contribution, customer retention, and target achievement using advanced SQL techniques including window functions and CTEs.

This project simulates a real-world sales analytics environment used by business leadership teams.

---

## 🧱 Database Schema

### Fact Table
- sales (transaction-level data)

### Dimension Tables
- salespersons
- customers
- products

The schema follows a star-schema design for efficient analytical querying.

---

## 📈 Key Business KPIs

- Total Revenue
- Total Profit
- Profit Margin %
- Rolling 3-Month Revenue
- Salesperson Ranking
- Regional Contribution %
- Underperformer Detection
- Customer Repeat Purchase Rate

---

## 🔥 Advanced SQL Concepts Used

- JOIN operations
- Aggregations (SUM, COUNT, AVG)
- CASE statements
- CTEs (Common Table Expressions)
- Window Functions
  - RANK()
  - LAG()
  - Rolling Window Calculations
- Contribution Analysis using OVER()

---

## 🧠 Analytical Insights Generated

### 1️⃣ Rolling 3-Month Revenue
Tracks revenue momentum and trend stability.

### 2️⃣ Salesperson Ranking
Ranks salespeople overall and within region.

### 3️⃣ Contribution % by Region
Identifies revenue-driving regions.

### 4️⃣ Underperformer Detection
Flags salespersons below 70% target achievement.

### 5️⃣ Customer Repeat Purchase Rate
Measures customer retention strength.

---

## 🛠️ How to Run This Project

1. Create database in MySQL / PostgreSQL.
2. Run `schema.sql`
3. Run `sample_data.sql`
4. Execute queries from:
   - `kpi_queries.sql`
   - `advanced_analytics.sql`

Connect the database to Power BI or Tableau to create visual dashboard.

---

## 🏆 Business Impact

This dashboard enables leadership to:

- Monitor revenue growth trends
- Evaluate sales team performance
- Identify underperforming regions
- Improve customer retention
- Drive data-backed sales strategy

---
