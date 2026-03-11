# 🛒 Superstore Retail Sales — Exploratory Data Analysis

**Tools:** Python, pandas, NumPy, Matplotlib, Seaborn, Jupyter Notebook  
**Type:** Exploratory Data Analysis  
**Dataset:** Retail Superstore Sales Data  

---

## 📌 Project Overview

This project involved a full end-to-end exploratory data analysis on a retail superstore dataset. The goal was to move beyond surface-level numbers and uncover meaningful patterns in sales performance, profitability, regional trends, and seasonal behaviour — then translate those findings into concrete business recommendations.

---

## 🎯 Objectives

- Clean and prepare the dataset for analysis
- Analyse sales and profit distributions across categories, sub-categories and regions
- Identify relationships between key variables such as discount, sales and profit
- Detect seasonal trends in monthly sales
- Develop a custom Python function to categorise orders by sales value
- Produce actionable business recommendations backed by data

---

## ⚙️ Technical Implementation

### Data Cleaning & Feature Engineering
- Checked for and handled missing values and duplicate records
- Converted date columns to datetime format to enable time-series analysis
- Engineered a **Profit Margin (%)** column to enable margin-level analysis
- Built a custom Python function to classify orders into **Low (<$60), Medium ($60–$300), and High (>$300)** sales categories, applied via `.apply()` to create a new `Sales_Category` column

### Analysis Performed
- Descriptive statistics across all numerical variables (mean, median, std, min, max)
- Sales and profit distribution analysis using histograms
- Regional performance comparison using box plots
- Category and sub-category profitability breakdown
- Correlation analysis across all numerical variables via heatmap
- Monthly sales trend analysis using a line chart
- Scatter plot analysis of Sales vs Profit relationship

---

## 🔎 Key Findings

### Profitability
- **Technology** was the highest profit category at **$145,454**, followed by Office Supplies ($122,491) and Furniture ($18,451)
- At sub-category level, **Copiers** generated the highest profit ($55,617) while **Tables (-$17,725), Bookcases (-$3,472) and Supplies (-$1,189)** all generated net losses
- Several high-value orders still resulted in losses — most notably the dataset's largest sale (~$22,500) generated a **loss of approximately -$2,000**

### Discounting
- The correlation heatmap revealed a **-0.86 correlation between Discount and Profit Margin** — the strongest relationship in the entire dataset
- This confirms that heavy discounting is significantly eroding profitability across the business

### Regional Performance
- The **West** was the top performing region ($725,457 in sales) followed by East ($678,781), Central ($501,240) and South ($391,721)
- All four regions contained significant outliers in sales values
- The **South had the single most extreme outlier** (~$22,500) while the **East had the highest number of outliers** overall

### Seasonal Trends
- Clear seasonal pattern with the **second half of the year consistently outperforming the first**
- **November** was the peak month (~$352,000), likely driven by holiday shopping and year-end purchasing
- **February** was the lowest month (~$60,000), indicating reduced consumer spending post-January
- A notable spike in **March** (~$205,000) breaks the otherwise quiet first half, possibly driven by Q1 business purchasing deadlines

### Sales vs Profit
- Sales and Profit had a moderate positive correlation of **+0.48** — but this is far from guaranteed
- The scatter plot clearly shows high sales do not always produce high profit, reinforcing the impact of discounting and product mix on margins

---

## 🧩 Challenges & How I Overcame Them

### Setting Sales Category Thresholds
One of the tasks required building a Python function to categorise orders as Low, Medium or High based on sales value. The challenge was deciding where to set the boundaries without the project specifying exact values.

I initially reviewed the statistical distribution of the Sales column (mean: $229.86, median: $54.49, std: $623.25) to inform my thresholds. I then rounded these to clean, business-friendly values ($60 and $300) to make the categories more intuitive and presentable. I reflected on whether this introduced bias — and while the thresholds were informed by the data, the final values are justifiable as independent business logic and the analysis is descriptive rather than predictive, so data leakage was not a concern.

### Heavily Skewed Data & Visualisation
The sales data was heavily right-skewed with extreme outliers (max: $22,638 vs median: $54.49), which caused box plots to compress the interquartile range to near-invisible. I addressed this by adding a zoomed view with a y-axis limit of $5,000 alongside the full view, allowing the reader to see both the outliers and the actual distribution clearly.

### Profit Histogram Readability
The initial histogram produced an extremely narrow spike due to default bin sizing on tightly clustered profit data. Adjusting to `bins=50` significantly improved readability and revealed the true shape of the distribution.

---

## 💡 Business Recommendations

1. **Reduce heavy discounting** — enforce stricter discount limits to protect profit margins, supported by the -0.86 discount/margin correlation
2. **Increase investment in Technology** — particularly Copiers and Phones which are the top performing sub-categories
3. **Review or discontinue loss-making sub-categories** — Tables, Bookcases and Supplies are all generating negative profit
4. **Replicate West and East strategies in the South** — investigate what is driving higher performance in top regions and apply learnings to the South
5. **Launch targeted off-season campaigns** — January and February show the lowest sales; targeted promotions could reduce seasonal revenue dips
6. **Audit pricing on high-value orders** — several large orders still generate losses; ensuring large orders are priced profitably should be a priority
7. **Capitalise on the March spike** — identify what drives the unexpected Q1 surge and amplify it through deliberate campaigns

---

## 📚 Lessons Learned

- Always check data distribution before choosing visualisation defaults — skewed data requires adjusted bin sizes, axis limits or log scales to tell the story clearly
- Correlation strength is about **distance from zero**, not just the positive direction — a -0.86 is a stronger relationship than a +0.48
- Business recommendations are strongest when every single one is tied back to a specific finding with a number behind it
- Consistency across findings matters — referencing earlier analysis in later questions shows analytical depth, not just isolated answers

---
