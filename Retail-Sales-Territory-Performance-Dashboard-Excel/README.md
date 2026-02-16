# Retail Sales Performance & Territory Analysis Dashboard (Excel)

## 📌 Project Overview

This project analyzes a retail sales dataset containing 2,823 transactions across multiple territories and product lines. The objective was to evaluate sales performance, identify high-value orders, analyze product demand trends, and build a management-level interactive dashboard.

The final output is a fully interactive Excel dashboard designed for executive decision-making.

---

## 📊 Dataset Summary

- 2,823 sales records
- 37 columns
- Includes:
  - Order information
  - Territory
  - Product Line
  - Sales amount
  - Deal size
  - Order status
  - Date fields

---

## 🧹 Data Preparation & Feature Engineering

The following calculated fields were created:

- **Recalculated_Sales** → Validated dataset integrity
- **High_Value_Order** → IF logic classification (Sales ≥ $5,000)
- **Year_Month** → TEXT-based monthly grouping
- **Deal_Size_Score** → Nested IF conversion (Small = 1, Medium = 2, Large = 3)
- **Product_Type** → XLOOKUP using reference table

---

## 📈 Analytical Techniques Used

### Statistical & Logical Functions
- SUM
- AVERAGE
- COUNTIF
- SUMIF
- IF
- Nested IF

### Lookup Implementation
- XLOOKUP / VLOOKUP

### Pivot Table Analysis
- Sales by Territory
- Sales by Product Line
- Monthly Sales Trend
- Sales by Deal Size
- Order Status Distribution

---

## 📊 Dashboard Features

- KPI Cards:
  - Total Revenue
  - Average Order Value
  - % High Value Orders
- Interactive slicer
- 4+ charts
- Clean layout and professional formatting

---

## 🔎 Key Insights

- **Best Performing Territory:** EMEA (~$4M revenue)
- **Lowest Performing Territory:** Japan (~$360K revenue)
- **Top Product Line:** Classic Cars (36% of total revenue)
- Sales mostly consistent month-to-month with spike in late 2004
- 19% of orders classified as High Value

---

## 💡 Business Recommendations

- Analyze EMEA strategies to replicate success in Japan
- Expand marketing for high-performing product lines
- Investigate 2004 spike to identify repeatable drivers
- Focus on increasing high-value order percentage

---

## 📂 File Included

- `DikshaKumar_SalesProject.xlsx` — Full interactive dashboard and analysis

---

## ⚠️ Limitations

- Dataset covers a limited time period
- No customer demographic segmentation available
- No cost data available for profitability analysis

