-- ============================================================
-- PROJECT: Business Performance Analytics
-- FILE: 01_data_quality.sql
-- PURPOSE: Validate the cleaned sales dataset in MySQL
-- ============================================================

USE business_performance_analytics;


SELECT
    COUNT(*) AS total_records
FROM sales;


SELECT
    COUNT(*) AS duplicate_records
FROM (
    SELECT
        Order_Item_ID
    FROM sales
    GROUP BY Order_Item_ID
    HAVING COUNT(*) > 1
) AS duplicates;


SELECT
    COUNT(*) AS missing_customer_ids
FROM sales
WHERE Customer_ID IS NULL;



SELECT
    COUNT(*) AS missing_discounts
FROM sales
WHERE Discount IS NULL;



SELECT
    Category,
    COUNT(*) AS transaction_lines
FROM sales
GROUP BY Category
ORDER BY transaction_lines DESC;



SELECT
    COUNT(*) AS invalid_quantities
FROM sales
WHERE Quantity <= 0;



SELECT
    COUNT(*) AS invalid_discounts
FROM sales
WHERE Discount < 0
   OR Discount > 1;



SELECT
    SUM(Revenue) AS total_revenue,
    SUM(Cost) AS total_cost,
    SUM(Profit) AS total_profit,
    MIN(Revenue) AS minimum_revenue,
    MAX(Revenue) AS maximum_revenue,
    MIN(Profit) AS minimum_profit,
    MAX(Profit) AS maximum_profit
FROM sales;




