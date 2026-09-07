-- ============================================================
-- PROJECT: Business Performance Analytics
-- FILE: 03_customer_analysis.sql
-- PURPOSE: Analyze customer and segment performance
-- ============================================================

USE business_performance_analytics;


-- 1. Revenue and profit by customer segment

SELECT
    Segment,
    ROUND(SUM(Revenue), 2) AS Revenue,
    ROUND(SUM(Profit), 2) AS Profit,
    ROUND(
        100 * SUM(Profit) / NULLIF(SUM(Revenue), 0),
        2
    ) AS Profit_Margin_Percent,
    COUNT(DISTINCT Order_ID) AS Orders,
    COUNT(DISTINCT Customer_ID) AS Customers
FROM sales
GROUP BY Segment
ORDER BY Revenue DESC;


-- 2. Top 20 customers by revenue

SELECT
    Customer_ID,
    Customer_Name,
    Segment,
    ROUND(SUM(Revenue), 2) AS Revenue,
    ROUND(SUM(Profit), 2) AS Profit,
    COUNT(DISTINCT Order_ID) AS Orders
FROM sales
WHERE Customer_ID IS NOT NULL
GROUP BY
    Customer_ID,
    Customer_Name,
    Segment
ORDER BY Revenue DESC
LIMIT 20;


-- 3. Top 20 customers by profit

SELECT
    Customer_ID,
    Customer_Name,
    Segment,
    ROUND(SUM(Profit), 2) AS Profit,
    ROUND(SUM(Revenue), 2) AS Revenue,
    COUNT(DISTINCT Order_ID) AS Orders
FROM sales
WHERE Customer_ID IS NOT NULL
GROUP BY
    Customer_ID,
    Customer_Name,
    Segment
ORDER BY Profit DESC
LIMIT 20;


-- 4. Average customer revenue by segment

SELECT
    Segment,
    ROUND(
        SUM(Revenue) /
        NULLIF(COUNT(DISTINCT Customer_ID), 0),
        2
    ) AS Revenue_Per_Customer
FROM sales
WHERE Customer_ID IS NOT NULL
GROUP BY Segment
ORDER BY Revenue_Per_Customer DESC;


-- 5. Average order value by segment

SELECT
    Segment,
    ROUND(
        SUM(Revenue) /
        NULLIF(COUNT(DISTINCT Order_ID), 0),
        2
    ) AS Average_Order_Value
FROM sales
GROUP BY Segment
ORDER BY Average_Order_Value DESC;


-- 6. Customer revenue ranking

WITH customer_revenue AS (
    SELECT
        Customer_ID,
        Customer_Name,
        SUM(Revenue) AS Revenue
    FROM sales
    WHERE Customer_ID IS NOT NULL
      AND Customer_Name IS NOT NULL
    GROUP BY
        Customer_ID,
        Customer_Name
)

SELECT
    Customer_ID,
    Customer_Name,
    ROUND(Revenue, 2) AS Revenue,
    RANK() OVER (
        ORDER BY Revenue DESC
    ) AS Revenue_Rank
FROM customer_revenue
ORDER BY Revenue DESC;



