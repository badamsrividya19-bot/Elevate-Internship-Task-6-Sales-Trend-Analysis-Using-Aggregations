-- aggregation_sqlite.sql
-- Monthly revenue & distinct order volume per year & month (SQLite)
SELECT
  CAST(strftime('%Y', order_date) AS INTEGER) AS year,
  CAST(strftime('%m', order_date) AS INTEGER) AS month,
  SUM(amount) AS monthly_revenue,
  COUNT(DISTINCT order_id) AS monthly_order_volume
FROM orders
WHERE order_date BETWEEN '2023-01-01' AND '2024-12-31'
GROUP BY year, month
ORDER BY year, month;
