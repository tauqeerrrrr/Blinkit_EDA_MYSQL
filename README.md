Data Cleaning & Standardization:

Normalized inconsistent values in Item Fat Content (e.g., mapping 'LF' and 'low fat' to 'Low Fat', 'reg' to 'Regular') to ensure cleaner grouping and aggregation.

Duplicate Data Handling:

Identified and flagged duplicate rows using ROW_NUMBER() window function across multiple fields to ensure data quality.

Sales Analysis by Fat Content:

Found that "Low Fat" items contribute more to total sales compared to "Regular" items, indicating consumer preference.

Top-Selling Item Types:

Identified the most frequently sold item categories using count of Item Identifier grouped by Item Type.

Outlet-Level Insights:

Found that Medium-sized outlets and Tier 1 location outlets generate the highest sales.

Created a pivot table-style breakdown of sales by Outlet Location Type and Outlet Size.

Item Type-Level Performance:

Ranked Item Types by total and average sales, revealing which products perform best overall.

Used window functions to calculate contribution percent of each type to overall sales.

Year-wise Sales & Trends:

Aggregated sales by Outlet Establishment Year and Item Type to uncover historical performance trends.

Outlet Type Distribution:

Found that certain outlet types appear more frequently in the dataset, suggesting strategic focus or business expansion patterns.

