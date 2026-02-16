Sample Superstore Analysis

This project was created as part of my learning journey in SQL and data analysis.



\## Project Overview

\## Objectives



* Check data quality and completeness



* Identify top-performing categories, segments, and products



* Detect loss-making products



* Provide insights to support business decisions



Tools: MySQL



\## Dataset Overview



The dataset contains information about orders, customers, products, and shipping.



Column Name	Data Type

Order ID	VARCHAR

Order Date	DATE

Ship Date	DATE

Ship Mode	VARCHAR

Customer ID	VARCHAR

Customer Name	VARCHAR

Segment	VARCHAR

Country	VARCHAR

City	VARCHAR

State	VARCHAR

Region	VARCHAR

Product ID	VARCHAR

Category	VARCHAR

Sub-Category	VARCHAR

Product Name	VARCHAR

Sales	DECIMAL

Quantity	INT

Discount	DECIMAL

Profit	DECIMAL



Total number of rows:





\## Data Quality



Checked text columns for NULLs, empty values, and extra spaces:



Column Name	Missing / Empty Values

Order ID	

Ship Mode

Customer ID

Segment

Country	

City	

State	

Region	

Product ID	

Category	

Sub-Category

Product Name	



Note: TRIM applied only to text columns.



\## Business Insights



\- \*\*Top Categories by Sales \& Orders\*\*  

&nbsp; Observation: Technology has the highest sales, while Office Supplies has the most orders.



\- \*\*Most Profitable Segments\*\*  

&nbsp; Observation: The Consumer segment generates the highest profit.



\- \*\*Regions with Highest Sales\*\*  

&nbsp; Observation: The West region leads in sales.



\- \*\*Products Sold Over 100 Units\*\*  

&nbsp; Observation: High-selling products are not always the most profitable.



\- \*\*Products with Highest Sales and Profit\*\*  

&nbsp; Observation: Top-selling products are also highly profitable.



\- \*\*Products with Negative Profit\*\*  

&nbsp; Observation: Identifying loss-making products can help improve margins.





\## Key Takeaways



Data quality is good; minor missing values exist in text columns.



Technology category and Consumer segment drive most profit and sales.



Regional and product insights can guide stock and marketing strategies.



Loss-making products should be reviewed for pricing or inventory adjustments.









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



