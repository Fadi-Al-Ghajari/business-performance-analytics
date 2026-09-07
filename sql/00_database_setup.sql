CREATE DATABASE business_performance_analytics;

USE business_performance_analytics;

CREATE TABLE sales (
    Order_Item_ID VARCHAR(20),
    Order_ID VARCHAR(20),
    Order_Date DATE,
    Customer_ID VARCHAR(20),
    Customer_Name VARCHAR(150),
    Segment VARCHAR(50),
    Region_ID VARCHAR(10),
    Region VARCHAR(50),
    Sales_Channel VARCHAR(30),
    Payment_Method VARCHAR(50),
    Product_ID VARCHAR(20),
    Product_Name VARCHAR(150),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Quantity INT,
    Discount DECIMAL(5,4),
    Unit_Cost DECIMAL(12,2),
    List_Price DECIMAL(12,2),
    Revenue DECIMAL(14,2),
    Cost DECIMAL(14,2),
    Profit DECIMAL(14,2),
    Profit_Margin DECIMAL(10,6)
);
