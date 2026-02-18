## Video Game Sales Analysis – SQL

## Project Context
This project analyzes video game sales data to understand trends in global and regional sales, as well as performance by genre and platform.
The goal is to provide actionable insights for game publishers, marketers, and analysts to identify top-selling games and profitable genres over the years.

## Objective
- Inspect the dataset structure and check for missing values
- Detect duplicate game entries
- Calculate total and average sales per game
- Analyze sales trends by genre, year, and platform
- Determine top-selling games per year
- Calculate market share for each region

## Solution
The analysis was performed using SQL (MySQL) and included the following steps:
1. Inspected the first rows of the dataset to check structure and data types
2. Counted total rows and null values per column to check data quality
3. Identified duplicate games by Name and Platform
4. Added a new column TotalSales by summing regional sales (NA, EU, JP, Other)
5. Calculated total sales and number of games by Year and Genre
6. Aggregated sales by Platform and Region to compare performance across markets
7. Calculated regional contribution percentages to Global Sales
8. Computed average sales per game by Year and Genre
9. Identified the top-selling game of each year using a ranking function

## Key Insights
- Action and Sports games dominate global sales in multiple years
- Certain platforms consistently outperform others (e.g., PS4, Nintendo Switch)
- North America and Europe account for the largest share of global sales
- Top-selling games per year often belong to popular franchises

## Dataset
- Name: Name of the video game
- Platform: Gaming platform (e.g., PS4, Xbox, Nintendo Switch)
- Year: Year of release
- Genre: Game genre (e.g., Action, Adventure, Sports)
- Publisher: Game publisher
- NA_Sales: Sales in North America (millions)
- EU_Sales: Sales in Europe (millions)
- JP_Sales: Sales in Japan (millions)
- Other_Sales: Sales in other regions (millions)
- Global_Sales: Total sales worldwide (millions)

## Tools & Technologies
- SQL (MySQL) for querying, analysis, and insights extraction




