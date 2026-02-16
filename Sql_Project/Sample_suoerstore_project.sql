

-- What columns are in the table and their data type 
DESCRIBE sample_superstore;

-- How many rows are in the table
SELECT COUNT(*) FROM sample_superstore;

-- Find NULLs or empty values after trimming spaces (TRIM only for text columns)
SELECT 
SUM(CASE WHEN `Order ID` IS NULL OR TRIM(`Order ID`) = '' THEN 1 ELSE 0 END) AS missing_order_id,
SUM(CASE WHEN `Ship Mode` IS NULL OR TRIM(`Ship Mode`) = '' THEN 1 ELSE 0 END) AS missing_ship_mode,
SUM(CASE WHEN `Customer ID` IS NULL OR TRIM(`Customer ID`) = '' THEN 1 ELSE 0 END) AS missing_customer_id,
SUM(CASE WHEN `Segment` IS NULL OR TRIM(`Segment`) = '' THEN 1 ELSE 0 END) AS missing_segment,
SUM(CASE WHEN `Country` IS NULL OR TRIM(`Country`) = '' THEN 1 ELSE 0 END) AS missing_country,
SUM(CASE WHEN `City` IS NULL OR TRIM(`City`) = '' THEN 1 ELSE 0 END) AS missing_city,
SUM(CASE WHEN `State` IS NULL OR TRIM(`State`) = '' THEN 1 ELSE 0 END) AS missing_state,
SUM(CASE WHEN `Region` IS NULL OR TRIM(`Region`) = '' THEN 1 ELSE 0 END) AS missing_region,
SUM(CASE WHEN `Product ID` IS NULL OR TRIM(`Product ID`) = '' THEN 1 ELSE 0 END) AS missing_product_id,
SUM(CASE WHEN `Category` IS NULL OR TRIM(`Category`) = '' THEN 1 ELSE 0 END) AS missing_category,
SUM(CASE WHEN `Sub-Category` IS NULL OR TRIM(`Sub-Category`) = '' THEN 1 ELSE 0 END) AS missing_sub_category,
SUM(CASE WHEN `Product Name` IS NULL OR TRIM(`Product Name`) = '' THEN 1 ELSE 0 END) AS missing_product_name
FROM sample_superstore;


--   Which category has the most sales and how many orders each category has
SELECT Category, SUM(Sales) AS Total_sales, COUNT(*) AS total_orders
FROM sample_superstore
GROUP BY Category;


-- Which Segment generates the most profit
SELECT segment, SUM(profit) AS total_profit
FROM sample_superstore
GROUP BY Segment
ORDER BY total_profit DESC;


-- Which region has the highest sales
SELECT Region, SUM(Sales) AS total_sales
from sample_superstore
GROUP BY Region
ORDER BY total_sales DESC
LIMIT 5;


-- Which products have been sold more than 100 units
SELECT `Product Name`, SUM(Quantity) AS TotalQuantity
FROM sample_superstore
GROUP BY `Product Name`
HAVING TotalQuantity > 100
ORDER BY TotalQuantity DESC;


-- Which products generate the highest sales and profit 
SELECT `Product Name`, SUM(Sales) AS total_sales, SUM(Profit) AS total_profit
FROM sample_superstore
GROUP BY `Product Name`
ORDER BY total_sales DESC
LIMIT 5;


-- Products with negative profit
SELECT `Product Name`, SUM(Profit) AS total_profit
FROM sample_superstore
GROUP BY `Product Name`
HAVING total_profit < 0
ORDER BY total_profit
LIMIT 5;

