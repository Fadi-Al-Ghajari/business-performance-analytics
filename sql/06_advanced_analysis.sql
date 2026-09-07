-- ============================================================
-- PROJECT: Business Performance Analytics
-- FILE: 06_advanced_analysis.sql
-- PURPOSE: Advanced business analysis using CTEs and
--          window functions
-- ============================================================

USE business_performance_analytics;


-- ============================================================
-- 1. Monthly Revenue, Profit and Month-over-Month Growth
-- ============================================================

WITH monthly_sales AS (
    SELECT
        DATE_FORMAT(Order_Date, '%Y-%m') AS Month,
        SUM(Revenue) AS Revenue,
        SUM(Profit) AS Profit
    FROM sales
    GROUP BY DATE_FORMAT(Order_Date, '%Y-%m')
),
monthly_with_previous AS (
    SELECT
        Month,
        Revenue,
        Profit,
        LAG(Revenue) OVER (
            ORDER BY Month
        ) AS Previous_Month_Revenue
    FROM monthly_sales
)
SELECT
    Month,
    ROUND(Revenue, 2) AS Revenue,
    ROUND(Profit, 2) AS Profit,
    ROUND(
        100 * (
            Revenue - Previous_Month_Revenue
        ) / NULLIF(Previous_Month_Revenue, 0),
        2
    ) AS MoM_Revenue_Growth_Percent
FROM monthly_with_previous
ORDER BY Month;


-- ============================================================
-- 2. Running Revenue Total
-- ============================================================

WITH monthly_sales AS (
    SELECT
        DATE_FORMAT(Order_Date, '%Y-%m') AS Month,
        SUM(Revenue) AS Revenue
    FROM sales
    GROUP BY DATE_FORMAT(Order_Date, '%Y-%m')
)

SELECT
    Month,
    ROUND(Revenue, 2) AS Monthly_Revenue,
    ROUND(
        SUM(Revenue) OVER (
            ORDER BY Month
        ),
        2
    ) AS Running_Revenue
FROM monthly_sales
ORDER BY Month;


-- ============================================================
-- 3. Product Revenue Contribution
-- ============================================================

WITH product_sales AS (
    SELECT
        Product_ID,
        Product_Name,
        Category,
        SUM(Revenue) AS Revenue
    FROM sales
    GROUP BY
        Product_ID,
        Product_Name,
        Category
),

total_sales AS (
    SELECT
        SUM(Revenue) AS Total_Revenue
    FROM sales
)

SELECT
    p.Product_ID,
    p.Product_Name,
    p.Category,
    ROUND(p.Revenue, 2) AS Revenue,
    ROUND(
        100 * p.Revenue / NULLIF(t.Total_Revenue, 0),
        2
    ) AS Revenue_Contribution_Percent
FROM product_sales p
CROSS JOIN total_sales t
ORDER BY p.Revenue DESC;


-- ============================================================
-- 4. Top 10 Customers Revenue Concentration
-- ============================================================

WITH customer_sales AS (
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
),

ranked_customers AS (
    SELECT
        Customer_ID,
        Customer_Name,
        Revenue,
        RANK() OVER (
            ORDER BY Revenue DESC
        ) AS Revenue_Rank
    FROM customer_sales
),

total_sales AS (
    SELECT
        SUM(Revenue) AS Total_Revenue
    FROM sales
)

SELECT
    ROUND(
        SUM(r.Revenue),
        2
    ) AS Top_10_Revenue,

    ROUND(
        t.Total_Revenue,
        2
    ) AS Total_Revenue,

    ROUND(
        100 * SUM(r.Revenue)
        / NULLIF(t.Total_Revenue, 0),
        2
    ) AS Top_10_Revenue_Share_Percent

FROM ranked_customers r
CROSS JOIN total_sales t
WHERE r.Revenue_Rank <= 10
GROUP BY t.Total_Revenue;


-- ============================================================
-- 5. Customer Revenue Segmentation
-- ============================================================

WITH customer_sales AS (
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
    CASE
        WHEN Revenue >= 10000 THEN 'High Value'
        WHEN Revenue >= 5000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS Customer_Value_Segment,

    COUNT(*) AS Customers,

    ROUND(
        SUM(Revenue),
        2
    ) AS Revenue,

    ROUND(
        AVG(Revenue),
        2
    ) AS Average_Customer_Revenue

FROM customer_sales

GROUP BY
    CASE
        WHEN Revenue >= 10000 THEN 'High Value'
        WHEN Revenue >= 5000 THEN 'Medium Value'
        ELSE 'Low Value'
    END

ORDER BY Revenue DESC;


-- ============================================================
-- 6. Best Product in Each Category
-- ============================================================

WITH product_sales AS (
    SELECT
        Category,
        Product_ID,
        Product_Name,
        SUM(Revenue) AS Revenue
    FROM sales
    GROUP BY
        Category,
        Product_ID,
        Product_Name
),

ranked_products AS (
    SELECT
        Category,
        Product_ID,
        Product_Name,
        Revenue,
        RANK() OVER (
            PARTITION BY Category
            ORDER BY Revenue DESC
        ) AS Category_Rank
    FROM product_sales
)

SELECT
    Category,
    Product_ID,
    Product_Name,
    ROUND(Revenue, 2) AS Revenue
FROM ranked_products
WHERE Category_Rank = 1
ORDER BY Category;


-- ============================================================
-- 7. Best Region for Each Sales Channel
-- ============================================================

WITH regional_channel_sales AS (
    SELECT
        Sales_Channel,
        Region,
        SUM(Revenue) AS Revenue
    FROM sales
    GROUP BY
        Sales_Channel,
        Region
),

ranked_regions AS (
    SELECT
        Sales_Channel,
        Region,
        Revenue,
        RANK() OVER (
            PARTITION BY Sales_Channel
            ORDER BY Revenue DESC
        ) AS Region_Rank
    FROM regional_channel_sales
)

SELECT
    Sales_Channel,
    Region,
    ROUND(Revenue, 2) AS Revenue
FROM ranked_regions
WHERE Region_Rank = 1
ORDER BY Sales_Channel;



