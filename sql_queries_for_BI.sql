CREATE DATABASE superstore_db;
USE superstore_db;



SELECT COUNT(*) FROM Superstore_dataset;

SELECT * FROM Superstore_dataset 
LIMIT 5;

SELECT 
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit
FROM Superstore_dataset;

SELECT * FROM Superstore_dataset;

# Which product categories and sub-categories drive the most revenue and profit?
# What is the total sales and total profit for each category and sub-category?

SELECT 
    Category,
    `Sub-Category`,
    ROUND(SUM(Sales),2) AS total_sales,
    ROUND(SUM(Profit),2) AS total_profit
FROM Superstore_dataset
GROUP BY Category, `Sub-Category`
ORDER BY total_profit DESC;

# Are heavy discounts hurting profitability?
# What is the average profit at each discount level?

SELECT 
    Discount,
    ROUND(AVG(Profit),2) AS avg_profit
FROM Superstore_dataset
GROUP BY Discount
ORDER BY Discount;

# Which regions and states are top and bottom performers?
# What is the total sales, total profit, and profit margin for each region and state?

SELECT 
    Region,
    State,
    ROUND(SUM(Sales),2) AS total_sales,
    ROUND(SUM(Profit),2) AS total_profit,
    ROUND(SUM(Profit)/SUM(Sales), 2) AS profit_margin
FROM Superstore_dataset
GROUP BY Region, State
ORDER BY total_profit DESC;

# Does shipping mode affect delivery time and profitability?
# What is the average shipping time, total orders, and average profit for each ship mode?

SELECT 
    `Ship Mode`,
    ROUND(AVG(DATEDIFF(`Ship Date`, `Order Date`)), 2) AS avg_shipping_days,
    COUNT(*) AS total_orders,
    ROUND(AVG(Profit), 2) AS avg_profit
FROM Superstore_dataset
GROUP BY `Ship Mode`;

SELECT * FROM Superstore_dataset;

# Which customer segment is most valuable?
# What is the total sales, total profit, and total orders for each segment?

SELECT 
    Segment,
    ROUND(SUM(Sales),2) AS total_sales,
    ROUND(SUM(Profit),2) AS total_profit,
    COUNT(*) AS total_orders
FROM Superstore_dataset
GROUP BY Segment
ORDER BY total_profit DESC;

# Is the business growing over time? Are there seasonal patterns?
# What is the total sales and total profit for each month?

SELECT 
    DATE_FORMAT(STR_TO_DATE(`Order Date`, '%d-%m-%Y'), '%Y-%m') AS month,
    ROUND(SUM(Sales),2) AS total_sales,
    ROUND(SUM(Profit),2) AS total_profit
FROM Superstore_dataset
GROUP BY month
ORDER BY month;

# Which products generate the highest profit?
# What are the top 10 products based on total profit?

SELECT 
    `Product Name`,
    SUM(Profit) AS total_profit
FROM Superstore_dataset
GROUP BY `Product Name`
ORDER BY total_profit DESC
LIMIT 10;

SELECT * FROM Superstore_dataset;

# Which products are loss-making?
# What are the bottom 10 products based on total profit?

SELECT 
    `Product Name`,
    SUM(Profit) AS total_profit
FROM Superstore_dataset
GROUP BY `Product Name`
ORDER BY total_profit ASC
LIMIT 10;