Sales Analytics Project
📊 Project Overview

This project analyzes a multi-year sales dataset to understand revenue, profitability, customers, products, regions, sales channels, and the impact of discounting on business performance.

The project combines Python, Pandas, Seaborn, Matplotlib, and SQL to perform data generation, cleaning, exploratory data analysis, data-quality checks, KPI analysis, customer analysis, product analysis, regional analysis, and advanced business analysis.

The goal is to transform raw transactional data into actionable business insights and recommendations.

🎯 Business Objectives

The analysis aims to answer the following questions:

How is revenue and profit changing over time?
Which product categories generate the most revenue and profit?
Which regions perform best and which need improvement?
Which sales channel generates the most business?
How does discounting affect profitability?
Where are loss-making transactions occurring?
Which customers and products have the greatest business impact?
What actions could improve profitability?
🛠️ Tools & Technologies
Python
Pandas
NumPy
Matplotlib
Seaborn
SQL
Database setup
Data-quality analysis
KPI analysis
Customer analysis
Product analysis
Regional analysis
Advanced analysis
Jupyter Notebook
Git / GitHub
Power BI / Tableau — dashboard stage
📁 Project Structure
sales-analytics-project/
│
├── data/
│   ├── raw/
│       └── sales_data.csv
│   └── cleaned/
│       └── sales_cleaned.csv
│
├── python/
│   ├── 01_generate_dataset.ipynb
│   ├── 02_data_cleaning.ipynb
│   └── 03_eda.ipynb
│
├── sql/
│   ├── 00_database_setup.sql
│   ├── 01_data_quality.sql
│   ├── 02_kpi_analysis.sql
│   ├── 03_customer_analysis.sql
│   ├── 04_product_analysis.sql
│   ├── 05_regional_analysis.sql
│   └── 06_advanced_analysis.sql
│
├── dashboard/
│
└── README.md

🔄 Data Pipeline
Raw Data
   ↓
Dataset Generation
   ↓
Data Cleaning
   ↓
Cleaned Dataset
   ↓
Python EDA
   ↓
SQL Analysis
   ↓
Business Insights
   ↓
Dashboard
   ↓
Recommendations

📈 Key Findings
1. Overall Business Performance

Revenue remained relatively stable between 2022 and 2025.

Year	Revenue	Profit	Profit Margin
2022	$25.18M	$8.96M	35.57%
2023	$25.45M	$9.07M	35.64%
2024	$25.07M	$8.86M	35.32%
2025	$24.69M	$8.85M	35.85%

2023 was the strongest year by revenue and profit.

However, revenue did not show sustained growth through 2025, indicating a relatively mature or stagnant sales pattern.

2. Category Performance
Category	Revenue	Profit	Profit Margin
Home	$27.23M	$9.64M	35.39%
Furniture	$25.27M	$8.94M	35.37%
Technology	$24.08M	$8.14M	33.82%
Office Supplies	$23.81M	$9.01M	37.86%

Home generates the highest revenue.

However, Office Supplies has the strongest profit margin, demonstrating that the highest-revenue category is not necessarily the most profitable category.

Technology has the lowest margin and should be investigated for cost or pricing improvement opportunities.

3. Regional Performance
Region	Revenue	Profit	Profit Margin
West	$23.51M	$8.40M	35.71%
East	$23.50M	$8.36M	35.57%
North	$20.58M	$7.33M	35.63%
South	$18.56M	$6.60M	35.56%
Central	$14.25M	$5.05M	35.43%

The West and East regions are the strongest revenue contributors.

The Central region has the lowest revenue and therefore represents an opportunity for further investigation and growth initiatives.

4. Sales Channel Performance
Channel	Revenue	Profit	Orders	Profit Margin
Online	$64.79M	$23.09M	16,771	35.64%
Retail	$35.60M	$12.64M	9,195	35.51%

Online is the dominant sales channel and generates approximately 64.5% of total revenue.

The profit margins of the two channels are very similar, suggesting that Online's advantage primarily comes from greater sales volume.

💰 Discount & Profitability Analysis

Discounting has the strongest relationship with profitability in this analysis.

Discount Band	Revenue	Profit Margin
0%	$28.00M	41.42%
1–10%	$45.45M	36.61%
11–20%	$23.09M	29.67%
21–30%	$3.85M	16.75%

Profit margin decreases substantially as discounts increase.

The relationship becomes even more significant when looking specifically at loss-making transactions.

Discount Band	Transactions	Loss Transactions	Loss Rate
0%	15,158	0	0.00%
1–10%	26,867	0	0.00%
11–20%	15,008	487	3.24%
21–30%	2,967	660	22.24%

Only 2,967 transactions fall into the 21–30% discount band, but these transactions account for approximately 57.5% of all loss-making transactions.

This makes high discounting a major profitability risk.

⚠️ Negative Profit Analysis

The analysis identified:

1,147 loss-making transactions
1.91% of all transactions
Approximately 98.09% of transactions remain profitable

Although the percentage of loss-making transactions is relatively small, the concentration of losses in higher-discount transactions makes this an important area for management attention.

💡 Business Recommendations
1. Control high discounts

Introduce additional approval or pricing controls for discounts above 20%.

2. Protect minimum profit margins

Instead of allowing discounts based only on sales targets, establish minimum acceptable margins for transactions.

3. Review loss-making products

Identify products that repeatedly generate negative profit and review their pricing, costs, and discount policies.

4. Improve Technology profitability

Technology generates significant revenue but has the lowest category margin. Investigating supplier costs, pricing, and discount levels could improve profitability.

5. Focus growth efforts on stronger regions

West and East already generate the highest revenue and could provide opportunities for further expansion.

6. Investigate Central region performance

Central has substantially lower revenue than the leading regions. Customer acquisition, product mix, and sales activity should be investigated.

7. Continue developing the Online channel

Online is the largest revenue contributor and should remain an important growth channel.

🔍 Analytical Approach
Python Analysis

The Python analysis includes:

Dataset inspection
Data-type validation
Descriptive statistics
Revenue distribution
Profit distribution
Negative-profit analysis
Monthly revenue and profit trends
Category performance
Category profit margins
Annual performance
Regional performance
Sales channel performance
Discount analysis
Correlation analysis
Loss-rate analysis
SQL Analysis

The SQL analysis includes:

Database setup
Data-quality checks
KPI analysis
Customer analysis
Product analysis
Regional analysis
Advanced business analysis
📊 Dashboard

A business dashboard will summarize the most important findings using:

KPI Cards
Total Revenue
Total Profit
Profit Margin
Total Orders
Total Customers
Dashboard Sections
Revenue & Profit Trend
Revenue by Category
Revenue by Region
Revenue by Sales Channel
Profit Margin by Category
Discount vs Profitability
Loss-Making Transactions

Interactive filters should include:

Year
Region
Category
Sales Channel
Discount Band
🎯 Final Business Conclusion

The business demonstrates strong overall profitability with an approximately 35% profit margin, but revenue remains relatively flat across the four-year period.

Online sales are the primary revenue driver, while Home is the largest revenue category and Office Supplies delivers the highest margin.

The most significant profitability risk is aggressive discounting. Transactions receiving discounts above 20% have a dramatically higher probability of becoming loss-making, with a 22.24% loss rate in the 21–30% discount range.

Therefore, the primary opportunity is not simply increasing sales volume, but growing revenue while protecting profit margins through better discount and pricing management.

🚀 Future Improvements

Potential future improvements include:

Customer segmentation
Customer lifetime value analysis
Product-level profitability analysis
Forecasting future revenue
Discount optimization
Automated KPI reporting
Interactive Power BI/Tableau dashboard
Advanced statistical analysis
👤 Project Purpose

This project demonstrates an end-to-end Data Analyst workflow, from raw data preparation and cleaning through SQL analysis, Python visualization, business interpretation, and dashboard development.
