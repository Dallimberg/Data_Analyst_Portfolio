Retail Sales Analysis – Python Superstore Project

Project Context
This project analyzes retail sales data to uncover business insights and understand sales trends across years, categories, and customer segments. 
The goal is to clean, prepare, and analyze the data to support decision-making and visualize key metrics effectively.

Objective
- Clean and prepare the dataset for analysis
- Understand total sales trends over the years
- Analyze profit distribution by product category
- Explore sales performance by customer segment

Solution / Approach
- Loaded the CSV dataset using Pandas
- Checked first rows, data types, and summary statistics
- Identified and handled missing values and duplicated rows
- Converted 'Order_Date' to datetime format for time-based analysis
- Created new columns for analysis, including 'Order_Year'
- Conducted analysis and visualized insights using Python:
  - Sales by Year: total sales per year; 2017 had the highest sales
  - Profit by Category: Technology category leads in total sales
  - Sales by Segment: Consumer segment has the highest total sales
- Visualizations: bar charts and pie charts for trends and distribution

Key Insights
- 2017 had the highest total sales
- Technology category generated the highest total profit
- Consumer segment dominates overall sales

Tools & Technologies
- Python (Pandas, Matplotlib)
- Jupyter Notebook / Python IDE

Files
- superstore_data.csv – Original dataset
- superstore_analysis.ipynb – Notebook with data cleaning, analysis, and visualizations

Author
Erick Dallimberg Tamayo Bosquez
