## Sample Superstore Analysis – SQL

## Project Context
This project was created as part of my learning journey in SQL and data analysis. 
It analyzes retail orders, customers, products, and shipping information to provide actionable business insights, identify high-performing categories and products, and detect potential issues like loss-making products.

## Objective
- Check data quality and completeness
- Identify top-performing categories, segments, and products
- Detect loss-making products
- Provide insights to support business decisions

## Solution / Approach
- Analyzed the Sample Superstore dataset using MySQL
- Checked data quality:
  - Counted missing or empty values in text columns
  - Applied TRIM to clean extra spaces
- Conducted business analysis:
  - Identified top categories by sales and number of orders
  - Analyzed most profitable customer segments
  - Examined regions with highest sales
  - Evaluated products sold over 100 units
  - Detected products with highest sales and profit
  - Identified products with negative profit

## Key Insights
- Technology has the highest sales, while Office Supplies has the most orders
- The Consumer segment generates the highest profit
- The West region leads in total sales
- High-selling products are not always the most profitable
- Top-selling products are often highly profitable
- Loss-making products need review for pricing or inventory adjustments

## Tools & Technologies
- MySQL

## Dataset
- Contains order, customer, product, and shipping data
- Columns include:
  - Order ID, Order Date, Ship Date, Ship Mode, Customer ID, Customer Name, Segment, Country, City, State, Region, Product ID, Category, Sub-Category, Product Name, Sales, Quantity, Discount, Profit

## What I Learned
- Assessing and cleaning data to ensure accuracy
- Summarizing sales, profit, and orders by category, segment, and region
- Using SQL to detect top-performing and loss-making products
- Drawing actionable insights to guide business decisions and strategies
\## SQL Queries Used

Below are the SQL queries used to perform the analysis



```sql



-- What columns are in the table and their data type 

DESCRIBE sample\_superstore;



-- How many rows are in the table

SELECT COUNT(\*) FROM sample\_superstore;



-- Find NULLs or empty values after trimming spaces (TRIM only for text columns)

SELECT 

SUM(CASE WHEN `Order ID` IS NULL OR TRIM(`Order ID`) = '' THEN 1 ELSE 0 END) AS missing\_order\_id,

SUM(CASE WHEN `Ship Mode` IS NULL OR TRIM(`Ship Mode`) = '' THEN 1 ELSE 0 END) AS missing\_ship\_mode,

SUM(CASE WHEN `Customer ID` IS NULL OR TRIM(`Customer ID`) = '' THEN 1 ELSE 0 END) AS missing\_customer\_id,

SUM(CASE WHEN `Segment` IS NULL OR TRIM(`Segment`) = '' THEN 1 ELSE 0 END) AS missing\_segment,

SUM(CASE WHEN `Country` IS NULL OR TRIM(`Country`) = '' THEN 1 ELSE 0 END) AS missing\_country,

SUM(CASE WHEN `City` IS NULL OR TRIM(`City`) = '' THEN 1 ELSE 0 END) AS missing\_city,

SUM(CASE WHEN `State` IS NULL OR TRIM(`State`) = '' THEN 1 ELSE 0 END) AS missing\_state,

SUM(CASE WHEN `Region` IS NULL OR TRIM(`Region`) = '' THEN 1 ELSE 0 END) AS missing\_region,

SUM(CASE WHEN `Product ID` IS NULL OR TRIM(`Product ID`) = '' THEN 1 ELSE 0 END) AS missing\_product\_id,

SUM(CASE WHEN `Category` IS NULL OR TRIM(`Category`) = '' THEN 1 ELSE 0 END) AS missing\_category,

SUM(CASE WHEN `Sub-Category` IS NULL OR TRIM(`Sub-Category`) = '' THEN 1 ELSE 0 END) AS missing\_sub\_category,

SUM(CASE WHEN `Product Name` IS NULL OR TRIM(`Product Name`) = '' THEN 1 ELSE 0 END) AS missing\_product\_name

FROM sample\_superstore;



-- Top Categories by Sales \& Orders

SELECT Category, SUM(Sales) AS Total\_sales, COUNT(\*) AS total\_orders

FROM sample\_superstore

GROUP BY Category;



-- Most Profitable Segments

SELECT Segment, SUM(profit) AS total\_profit

FROM sample\_superstore

GROUP BY Segment

ORDER BY total\_profit DESC;



-- Regions with Highest Sales

SELECT Region, SUM(Sales) AS total\_sales

FROM sample\_superstore

GROUP BY Region

ORDER BY total\_sales DESC

LIMIT 5;



-- Products sold over 100 units

SELECT `Product Name`, SUM(Quantity) AS TotalQuantity

FROM sample\_superstore

GROUP BY `Product Name`

HAVING TotalQuantity > 100

ORDER BY TotalQuantity DESC;



-- Products with highest Sales and Profit

SELECT `Product Name`, SUM(Sales) AS total\_sales, SUM(Profit) AS total\_profit

FROM sample\_superstore

GROUP BY `Product Name`

ORDER BY total\_sales DESC

LIMIT 5;



-- Products with negative profit

SELECT `Product Name`, SUM(Profit) AS total\_profit

FROM sample\_superstore

GROUP BY `Product Name`

HAVING total\_profit < 0

ORDER BY total\_profit

LIMIT 5;



