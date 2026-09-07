	-- ============================================================
-- PROJECT: Business Performance Analytics
-- FILE: 02_kpi_analysis.sql
-- PURPOSE: Calculate core business performance KPIs
-- ============================================================

USE business_performance_analytics;


-- 1. Total Revenue

SELECT
    ROUND(SUM(Revenue), 2) AS Total_Revenue
FROM sales;


-- 2. Total Profit

SELECT
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM sales;


-- 3. Profit Margin

SELECT
    ROUND(
        100 * SUM(Profit) / NULLIF(SUM(Revenue), 0),
        2
    ) AS Profit_Margin_Percent
FROM sales;


-- 4. Total Orders

SELECT
    COUNT(DISTINCT Order_ID) AS Total_Orders
FROM sales;


-- 5. Total Customers

SELECT
    COUNT(DISTINCT Customer_ID) AS Total_Customers
FROM sales;


-- 6. Total Units Sold

SELECT
    SUM(Quantity) AS Total_Units_Sold
FROM sales;


-- 7. Average Order Value

SELECT
    ROUND(
        SUM(Revenue) / COUNT(DISTINCT Order_ID),
        2
    ) AS Average_Order_Value
FROM sales;


-- 8. Monthly Revenue and Profit

SELECT
    DATE_FORMAT(Order_Date, '%Y-%m') AS Month,
    ROUND(SUM(Revenue), 2) AS Revenue,
    ROUND(SUM(Profit), 2) AS Profit,
    ROUND(
        100 * SUM(Profit) / NULLIF(SUM(Revenue), 0),
        2
    ) AS Profit_Margin_Percent
FROM sales
GROUP BY DATE_FORMAT(Order_Date, '%Y-%m')
ORDER BY Month;


-- 9. Yearly Performance

SELECT
    YEAR(Order_Date) AS Year,
    ROUND(SUM(Revenue), 2) AS Revenue,
    ROUND(SUM(Profit), 2) AS Profit,
    COUNT(DISTINCT Order_ID) AS Orders,
    COUNT(DISTINCT Customer_ID) AS Customers
FROM sales
GROUP BY YEAR(Order_Date)
ORDER BY Year;



-- 10. Year-over-Year Revenue Growth

WITH yearly_sales AS (
    SELECT
        YEAR(Order_Date) AS Year,
        SUM(Revenue) AS Revenue
    FROM sales
    GROUP BY YEAR(Order_Date)
)

SELECT
    Year,
    ROUND(Revenue, 2) AS Revenue,
    ROUND(
        100 * (
            Revenue - LAG(Revenue) OVER (ORDER BY Year)
        )
        / NULLIF(
            LAG(Revenue) OVER (ORDER BY Year),
            0
        ),
        2
    ) AS YoY_Growth_Percent
FROM yearly_sales
ORDER BY Year;


