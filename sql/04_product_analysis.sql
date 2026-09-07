-- ============================================================
-- PROJECT: Business Performance Analytics
-- FILE: 04_product_analysis.sql
-- PURPOSE: Analyze product and category performance
-- ============================================================

USE business_performance_analytics;


-- 1. Performance by category

SELECT
    Category,
    ROUND(SUM(Revenue), 2) AS Revenue,
    ROUND(SUM(Profit), 2) AS Profit,
    ROUND(
        100 * SUM(Profit) / NULLIF(SUM(Revenue), 0),
        2
    ) AS Profit_Margin_Percent,
    SUM(Quantity) AS Units_Sold,
    COUNT(DISTINCT Order_ID) AS Orders
FROM sales
GROUP BY Category
ORDER BY Revenue DESC;


-- 2. Performance by sub-category

SELECT
    Category,
    Sub_Category,
    ROUND(SUM(Revenue), 2) AS Revenue,
    ROUND(SUM(Profit), 2) AS Profit,
    ROUND(
        100 * SUM(Profit) / NULLIF(SUM(Revenue), 0),
        2
    ) AS Profit_Margin_Percent,
    SUM(Quantity) AS Units_Sold
FROM sales
GROUP BY
    Category,
    Sub_Category
ORDER BY Revenue DESC;


-- 3. Top 20 products by revenue

SELECT
    Product_ID,
    Product_Name,
    Category,
    Sub_Category,
    ROUND(SUM(Revenue), 2) AS Revenue,
    ROUND(SUM(Profit), 2) AS Profit,
    SUM(Quantity) AS Units_Sold
FROM sales
GROUP BY
    Product_ID,
    Product_Name,
    Category,
    Sub_Category
ORDER BY Revenue DESC
LIMIT 20;



-- 4. Top 20 products by profit

SELECT
    Product_ID,
    Product_Name,
    Category,
    Sub_Category,
    ROUND(SUM(Profit), 2) AS Profit,
    ROUND(SUM(Revenue), 2) AS Revenue,
    ROUND(
        100 * SUM(Profit) / NULLIF(SUM(Revenue), 0),
        2
    ) AS Profit_Margin_Percent
FROM sales
GROUP BY
    Product_ID,
    Product_Name,
    Category,
    Sub_Category
ORDER BY Profit DESC
LIMIT 20;



-- 5. Lowest-margin products

SELECT
    Product_ID,
    Product_Name,
    Category,
    ROUND(SUM(Revenue), 2) AS Revenue,
    ROUND(SUM(Profit), 2) AS Profit,
    ROUND(
        100 * SUM(Profit) / NULLIF(SUM(Revenue), 0),
        2
    ) AS Profit_Margin_Percent
FROM sales
GROUP BY
    Product_ID,
    Product_Name,
    Category
HAVING SUM(Revenue) > 0
ORDER BY Profit_Margin_Percent ASC
LIMIT 20;



-- 6. Products with high revenue but low profitability

WITH product_performance AS (
    SELECT
        Product_ID,
        Product_Name,
        Category,
        SUM(Revenue) AS Revenue,
        SUM(Profit) AS Profit
    FROM sales
    GROUP BY
        Product_ID,
        Product_Name,
        Category
),

company_margin AS (
    SELECT
        SUM(Profit) / NULLIF(SUM(Revenue), 0) AS Overall_Margin
    FROM sales
)

SELECT
    p.Product_ID,
    p.Product_Name,
    p.Category,
    ROUND(p.Revenue, 2) AS Revenue,
    ROUND(p.Profit, 2) AS Profit,
    ROUND(
        100 * p.Profit / NULLIF(p.Revenue, 0),
        2
    ) AS Profit_Margin_Percent
FROM product_performance p
CROSS JOIN company_margin c
WHERE p.Revenue >= (
    SELECT AVG(Revenue)
    FROM product_performance
)
AND p.Profit / NULLIF(p.Revenue, 0) < c.Overall_Margin
ORDER BY p.Revenue DESC;



-- 7. Product revenue ranking

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
)

SELECT
    Product_ID,
    Product_Name,
    Category,
    ROUND(Revenue, 2) AS Revenue,
    RANK() OVER (
        ORDER BY Revenue DESC
    ) AS Revenue_Rank
FROM product_sales
ORDER BY Revenue DESC;




-- 8. Discount vs profitability

SELECT
    CASE
        WHEN Discount = 0 THEN '0%'
        WHEN Discount <= 0.10 THEN '1-10%'
        WHEN Discount <= 0.20 THEN '11-20%'
        WHEN Discount <= 0.30 THEN '21-30%'
        ELSE '30%+'
    END AS Discount_Band,

    COUNT(*) AS Transaction_Lines,

    ROUND(SUM(Revenue), 2) AS Revenue,

    ROUND(SUM(Profit), 2) AS Profit,

    ROUND(
        100 * SUM(Profit) / NULLIF(SUM(Revenue), 0),
        2
    ) AS Profit_Margin_Percent

FROM sales

GROUP BY
    CASE
        WHEN Discount = 0 THEN '0%'
        WHEN Discount <= 0.10 THEN '1-10%'
        WHEN Discount <= 0.20 THEN '11-20%'
        WHEN Discount <= 0.30 THEN '21-30%'
        ELSE '30%+'
    END

ORDER BY
    MIN(Discount);




