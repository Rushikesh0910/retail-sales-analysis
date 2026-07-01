-- Retail Sales Data Extraction Queries
-- Dataset: Kaggle Superstore Sales Data
-- Tool: SQL (pandasql via Python)

-- Query 1: Revenue and Profit by Region
SELECT 
    Region,
    ROUND(SUM(Sales), 2) AS Total_Revenue,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Profit)/SUM(Sales)*100, 2) AS Profit_Margin_Pct,
    COUNT(DISTINCT "Order ID") AS Total_Orders
FROM df
GROUP BY Region
ORDER BY Total_Revenue DESC;

-- Query 2: Revenue and Profit by Category
SELECT 
    Category,
    ROUND(SUM(Sales), 2) AS Total_Revenue,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Profit)/SUM(Sales)*100, 2) AS Profit_Margin_Pct
FROM df
GROUP BY Category
ORDER BY Total_Revenue DESC;

-- Query 3: Top 10 Products by Revenue
SELECT 
    "Product Name",
    Category,
    ROUND(SUM(Sales), 2) AS Total_Revenue,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM df
GROUP BY "Product Name", Category
ORDER BY Total_Revenue DESC
LIMIT 10;

-- Query 4: Bottom 5 Products by Profit Margin
SELECT 
    "Product Name",
    Category,
    ROUND(SUM(Sales), 2) AS Total_Revenue,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Profit)/SUM(Sales)*100, 2) AS Profit_Margin_Pct
FROM df
GROUP BY "Product Name", Category
HAVING SUM(Sales) > 1000
ORDER BY Profit_Margin_Pct ASC
LIMIT 5;

-- Query 5: Quarterly Revenue Trend
SELECT 
    Year,
    Quarter,
    ROUND(SUM(Sales), 2) AS Quarterly_Revenue
FROM df
GROUP BY Year, Quarter
ORDER BY Year, Quarter;