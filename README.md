# Elevate Internship — Task 6  
## Sales Trend Analysis Using SQL Aggregations

This repository contains the submission for Elevate Internship — Task 6, which focuses on analyzing sales trends using SQL aggregation techniques. The objective is to compute monthly revenue, monthly order volume, and identify top-performing months based on sales data.

---

## 1. Project Overview

The analysis is performed on an `orders` dataset where each entry represents a customer transaction.  
Using SQL queries, the following tasks were completed:

- Aggregating data by year and month  
- Calculating total monthly revenue  
- Calculating unique monthly order count  
- Identifying top 3 months based on revenue  
- Providing scripts compatible with PostgreSQL, MySQL, and SQLite  

The repository includes SQL scripts, sample data, and the final report in PDF format.

---

## 2. Dataset Structure

The dataset follows the structure below:

| Column Name | Description |
|-------------|-------------|
| order_id | Unique identifier for each order |
| order_date | Date of the transaction |
| amount | Revenue generated |
| product_id | Product identifier |

Sample data for testing is included in `setup.sql`.

---

## 3. Repository Contents

| File Name | Description |
|-----------|-------------|
| elevate_task6_sales_trend_analysis.pdf | Final report containing queries and explanations |
| aggregation_postgres.sql | SQL script for monthly revenue and order volume (Postgres/MySQL) |
| aggregation_sqlite.sql | SQL script for monthly revenue and order volume (SQLite) |
| top_months.sql | Query to extract the three highest-revenue months |
| setup.sql | Schema creation and sample data insertion |
| README.md | Documentation for this project |
| original_task.pdf | Original task document provided by Elevate Internship |

---

## 4. SQL Queries

### 4.1 Monthly Revenue & Order Volume (PostgreSQL / MySQL)
```sql
SELECT
  EXTRACT(YEAR FROM order_date) AS year,
  EXTRACT(MONTH FROM order_date) AS month,
  SUM(amount) AS monthly_revenue,
  COUNT(DISTINCT order_id) AS monthly_order_volume
FROM orders
GROUP BY 1,2
ORDER BY 1,2;
**4.2 Monthly Revenue & Order Volume (SQLite)**
SELECT
  CAST(strftime('%Y', order_date) AS INTEGER) AS year,
  CAST(strftime('%m', order_date) AS INTEGER) AS month,
  SUM(amount) AS monthly_revenue,
  COUNT(DISTINCT order_id) AS monthly_order_volume
FROM orders
GROUP BY year, month
ORDER BY year, month;
**4.3 Top 3 Months by Revenue**
WITH monthly AS (
  SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS monthly_revenue
  FROM orders
  GROUP BY 1,2
)
SELECT *
FROM monthly
ORDER BY monthly_revenue DESC
LIMIT 3;
5. Sample Output Format
Year	Month	Monthly Revenue	Monthly Order Volume
2024	1	180.49	2
2024	2	230.00	2
2024	3	435.00	3
6. How to Run the Queries
Using SQLite

Create database and insert sample data:

sqlite3 sales.db < setup.sql


Run aggregations:

sqlite3 sales.db < aggregation_sqlite.sql

Using PostgreSQL
psql -f setup.sql
psql -f aggregation_postgres.sql

Using MySQL
mysql < setup.sql
mysql < aggregation_postgres.sql

7. Notes

COUNT(DISTINCT order_id) ensures unique order counts.

SUM(amount) computes total monthly revenue.

Queries are compatible with multiple SQL engines.

Indexing order_date is recommended for large datasets.

8. Author

Badam Sri Vidya
Elevate Internship — Task 6 Submission
B.Tech CSE (Data Science)
