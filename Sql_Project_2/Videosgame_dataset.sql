
-- Display the first 10 rows to inspect the structure and data types
SELECT * 
FROM vgsales
LIMIT 10;

-- Count of total and null values
SELECT 
    COUNT(*) AS total_rows,
    COUNT(Name) AS total_name_valid,
    COUNT(*) - COUNT(Name) AS total_name_nulls,
    COUNT(Platform) AS total_platform_valid,
    COUNT(*) - COUNT(Platform) AS total_platform_nulls,
    COUNT(Genre) AS total_genre_valid,
    COUNT(*) - COUNT(Genre) AS total_genre_nulls,
    COUNT(Publisher) AS total_publisher_valid,
    COUNT(*) - COUNT(Publisher) AS total_publisher_nulls,
    COUNT(Year) AS total_year_valid,
    COUNT(*) - COUNT(Year) AS total_year_nulls,
    COUNT(NA_Sales) AS total_NA_Sales_valid,
    COUNT(*) - COUNT(NA_Sales) AS total_NA_Sales_nulls,
    COUNT(EU_Sales) AS total_EU_Sales_valid,
    COUNT(*) - COUNT(EU_Sales) AS total_EU_Sales_nulls,
    COUNT(JP_Sales) AS total_JP_Sales_valid,
    COUNT(*) - COUNT(JP_Sales) AS total_JP_Sales_nulls,
    COUNT(Other_Sales) AS total_Other_Sales_valid,
    COUNT(*) - COUNT(Other_Sales) AS total_Other_Sales_nulls,
    COUNT(Global_Sales) AS total_Global_Sales_valid,
    COUNT(*) - COUNT(Global_Sales) AS total_Global_Sales_nulls
FROM vgsales;

-- Duplicate games by name and platform
SELECT Name, Platform, COUNT(*) AS total
FROM vgsales
GROUP BY Name, Platform
HAVING COUNT(*) > 1;

-- Add a new column 'TotalSales'
ALTER TABLE vgsales ADD COLUMN TotalSales DOUBLE;

-- Disable safe updates so we can update all rows
SET SQL_SAFE_UPDATES = 0;

--  Populate TotalSales by summing regional sales
UPDATE vgsales
SET TotalSales = NA_Sales + EU_Sales + JP_Sales + Other_Sales;

-- Confirm the data 
SELECT Name, Platform, TotalSales, Global_Sales
FROM vgsales;

-- Calculate total sales and number of games by Genre and Year
SELECT Year, Genre, ROUND(SUM(Global_Sales),2) AS Sales_by_Genre, COUNT(DISTINCT Name) as total_games
FROM vgsales
WHERE Year IS NOT NULL 
GROUP BY Year, Genre
ORDER BY Year DESC;

-- Show total sales by Platform and by Region 
SELECT Platform,
    ROUND(SUM(EU_Sales),2) AS Total_Sales_EU,
    ROUND(SUM(NA_Sales),2) AS Total_Sales_NA,
    ROUND(SUM(JP_Sales),2) AS Total_Sales_JP,
    ROUND(SUM(Other_Sales),2) AS Total_Other_Sales,
    ROUND(SUM(EU_Sales+NA_Sales+JP_Sales+Other_Sales),2) AS Total_sales
FROM vgsales
GROUP BY Platform;

-- Calculate the percentage contribution of each region to total global sales
SELECT
    ROUND(SUM(NA_Sales),2) AS NA_Total,
    ROUND(SUM(EU_Sales),2) AS EU_Total,
    ROUND(SUM(JP_Sales),2) AS JP_Total,
    ROUND(SUM(Other_Sales),2) AS Other_Total,

    ROUND(SUM(NA_Sales) / SUM(Global_Sales) * 100,2) AS NA_Percent,
    ROUND(SUM(EU_Sales) / SUM(Global_Sales) * 100,2) AS EU_Percent,
    ROUND(SUM(JP_Sales) / SUM(Global_Sales) * 100,2) AS JP_Percent,
    ROUND(SUM(Other_Sales) / SUM(Global_Sales) * 100,2) AS Other_Percent
FROM vgsales;

-- Calculate average global sales per game by Year and Genre
SELECT Year, Genre, 
       ROUND(AVG(Global_Sales),2) AS Avg_Sales_Per_Game,
       COUNT(DISTINCT Name) AS total_games
FROM vgsales
GROUP BY Year, Genre
ORDER BY Year DESC;

-- Identify the top-selling game of each year, including its Name, Platform, and Global Sales
SELECT Year, Name, Platform, Global_Sales
FROM (SELECT Year,Name,Platform,Global_Sales,
ROW_NUMBER() OVER (PARTITION BY Year ORDER BY Global_Sales DESC) AS rn
FROM vgsales
WHERE Year IS NOT NULL
) S 
WHERE rn = 1
ORDER BY Year DESC;
