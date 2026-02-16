## Data Cleaning & Preparation
1. Loaded the CSV using Pandas and checked the first rows (`df.head()`), data types (`df.dtypes`) and summary statistics (`df.describe()`).
2. Checked for **missing values** and **duplicated rows**.
3. Converted `Order Date` column to **datetime format** to allow time-based analysis.
4. Created new columns for analysis:
   - `Order_Year` → to group sales by year

---

## Analysis & Insights

### 1. Sales by Year
- Calculated total sales per year using `groupby`.
- **Insight:** 2017 had the highest total sales.
- Visualization: Bar chart showing sales trend over the years.

### 2. Profit by Category
- Aggregated total profit per product category.
- **Insight:** The Technology category generated the highest total sales.
- Visualization: Bar chart / pie chart showing profit distribution by category.

### 3. Sales by Segment
- Grouped sales by customer segment (Consumer, Corporate, Home Office).
- **Insight:** The Consumer segment has the highest total sales.
- Visualization: Bar chart showing sales by segment.
