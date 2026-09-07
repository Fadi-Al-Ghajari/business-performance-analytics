Business Performance Analytics
Project Overview

This project analyzes business performance using transaction-level sales data across multiple years.

The analysis focuses on revenue, profit, customers, products, categories, regions, sales channels, and discounting behavior.

The goal is to demonstrate an end-to-end analytical workflow using SQL and Python, from raw data preparation through business insights and recommendations.

Business Problem

A business needs to understand:

How revenue and profit are changing over time
Which categories generate the most revenue and profit
Which regions and sales channels perform best
How customer and product performance varies
How discounting affects profitability
Where loss-making transactions occur
Which areas represent opportunities or risks

The analysis addresses these questions and translates the results into actionable business recommendations.

Objectives

The project aims to:

Prepare and validate raw sales data.
Build an analysis-ready dataset.
Perform data-quality checks.
Calculate key business KPIs using SQL.
Analyze customers, products, regions, and sales channels.
Explore the dataset using Python and pandas.
Identify profitability and discounting patterns.
Develop business recommendations based on the findings.
Dataset

The project uses a transaction-level sales dataset containing information about:

Orders
Customers
Products
Categories
Regions
Sales channels
Quantities
Discounts
Costs
Revenue
Profit
Data period

2022–2025

Dataset structure
data/
├── raw/
│   └── sales_data.csv
│
└── cleaned/
    └── sales_cleaned.csv


The original raw dataset is preserved separately from the cleaned dataset to maintain reproducibility.

Tools & Technologies
SQL

Used for:

Database setup
Data-quality validation
KPI analysis
Customer analysis
Product analysis
Regional analysis
Advanced business analysis
Python

Used for:

Data generation
Data cleaning
Exploratory data analysis
Statistical summaries
Data visualization
Python Libraries
pandas
NumPy
Matplotlib
Seaborn
Project Workflow
Raw Data
    ↓
Data Cleaning
    ↓
Data Quality Validation
    ↓
SQL Analysis
    ↓
Python Exploratory Analysis
    ↓
Statistical Summary
    ↓
Business Findings
    ↓
Recommendations

Data Preparation

The raw sales data was processed into an analysis-ready dataset.

The preparation process included:

Loading the raw dataset
Inspecting the dataset structure
Validating data types
Converting order dates to date format
Checking missing values
Checking duplicates
Validating numerical fields
Reviewing business rules
Creating the cleaned dataset

The cleaned dataset is stored in:

data/cleaned/sales_cleaned.csv

SQL Analysis

The SQL analysis is organized into separate scripts according to the analytical objective.

sql/
├── 00_database_setup.sql
├── 01_data_quality.sql
├── 02_kpi_analysis.sql
├── 03_customer_analysis.sql
├── 04_product_analysis.sql
├── 05_regional_analysis.sql
└── 06_advanced_analysis.sql

Analysis areas

Data Quality

Validation of the dataset before analytical use.

KPI Analysis

Analysis of core business metrics including revenue, profit, orders, customers, and profitability.

Customer Analysis

Analysis of customer behavior and customer-level performance.

Product Analysis

Identification of important products and product performance patterns.

Regional Analysis

Comparison of sales and profitability across geographic regions.

Advanced Analysis

Additional analysis focused on profitability, trends, discounting, and business performance.

Python Exploratory Data Analysis

Python was used to explore the cleaned dataset and identify important patterns.

The notebooks are organized as:

python/
├── 01_generate_dataset.ipynb
├── 02_data_cleaning.ipynb
└── 03_eda.ipynb


The exploratory analysis includes:

Revenue distribution
Profit distribution
Negative-profit transactions
Monthly revenue and profit trends
Annual performance
Category performance
Regional performance
Sales channel performance
Discount-band analysis
Loss-rate analysis
Correlation analysis
Key Findings
Revenue remained relatively stable

Annual revenue remained close to $25 million between 2022 and 2025.

2023 was the strongest year, generating approximately:

$25.45M revenue
$9.07M profit
35.64% profit margin

Revenue declined to approximately $24.69M in 2025, although profitability remained relatively stable.

Home is the leading revenue category

Home generated approximately $27.23M in revenue, making it the strongest category by revenue.

However, Office Supplies achieved the highest profit margin at approximately 37.86%.

Technology had the lowest category profit margin at approximately 33.82%.

This demonstrates that the category generating the most revenue is not necessarily the category generating the highest profitability.

Online is the dominant sales channel

Online generated approximately:

$64.79M revenue

compared with:

$35.60M revenue

from Retail.

Profit margins were similar between the two channels, at approximately 35.6%.

This indicates that Online's advantage is primarily driven by higher sales volume.

West and East are the strongest regions

West generated approximately $23.51M in revenue, followed closely by East at approximately $23.50M.

Central generated the lowest revenue at approximately $14.25M.

Regional profit margins were relatively consistent, suggesting that differences in revenue are primarily related to sales volume rather than major profitability differences.

Higher discounts create significant profitability risk

The strongest finding from the analysis is the relationship between discounting and profitability.

Discount	Profit Margin	Loss Rate
0%	41.42%	0.00%
1–10%	36.61%	0.00%
11–20%	29.67%	3.24%
21–30%	16.75%	22.24%

Transactions with discounts above 20% have substantially lower profitability and a much higher likelihood of generating losses.

Negative-profit transactions

The dataset contains:

1,147 negative-profit transactions

representing:

1.91% of all transactions.

The loss-rate analysis shows that these losses are concentrated in higher discount bands.

Business Recommendations
1. Strengthen discount controls

Discounts above 20% should receive additional scrutiny because they are associated with significantly lower profit margins and higher loss rates.

Potential controls include:

Minimum-margin requirements
Approval thresholds for large discounts
Category-specific discount limits
Monitoring of loss-making transactions
2. Investigate Technology profitability

Technology generates significant revenue but has the lowest category profit margin.

Further analysis should investigate product-level pricing, costs, discounts, and loss-making products.

3. Continue developing the Online channel

Online is the largest sales channel by revenue and orders.

The business should continue supporting the channel while monitoring customer profitability and retention.

4. Investigate Central and South regions

These regions generate less revenue than West and East.

Further analysis could identify opportunities related to customer acquisition, product mix, sales channels, and regional demand.

5. Prioritize profitable growth

Revenue growth should not rely heavily on aggressive discounting.

The analysis suggests that high discounts can significantly reduce profitability and increase the risk of loss-making transactions.

Limitations

This analysis has several limitations:

The dataset covers a defined historical period from 2022–2025.
The analysis identifies relationships but does not prove causation.
Discounting is associated with lower profitability, but other factors may also contribute to losses.
Additional customer and product-level investigation could provide deeper explanations.
The dataset may not represent every operational factor present in a real business environment.
Repository Structure
01-business-performance-analytics/
│
├── README.md
│
├── data/
│   ├── raw/
│   │   └── sales_data.csv
│   └── cleaned/
│       └── sales_cleaned.csv
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
├── python/
│   ├── 01_generate_dataset.ipynb
│   ├── 02_data_cleaning.ipynb
│   └── 03_eda.ipynb
│
├── analysis/
│   └── key_findings.md
│
└── documentation/
    └── data_dictionary.md

Why This Project Matters

This project demonstrates an end-to-end business analytics workflow rather than isolated technical exercises.

It shows the ability to:

Work with raw business data
Clean and validate datasets
Write analytical SQL
Use Python for exploratory analysis
Calculate business KPIs
Identify trends and performance drivers
Investigate profitability
Translate analytical results into business recommendations
Document an analytical project for reproducibility

The project is designed to demonstrate practical skills relevant to Data Analyst and BI Analyst roles.