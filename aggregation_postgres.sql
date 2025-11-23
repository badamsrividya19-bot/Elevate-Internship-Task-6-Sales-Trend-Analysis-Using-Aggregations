-- aggregation_postgres.sql
-- Monthly revenue & distinct order volume per year & month (Postgres / MySQL)
SELECT
  EXTRACT(YEAR FROM order_date) AS year,
  EXTRACT(MONTH FROM order_date) AS month,
  SUM(amount) AS monthly_revenue,
  COUNT(DISTINCT order_id) AS monthly_order_volume
FROM orders
WHERE order_date BETWEEN DATE '2023-01-01' AND DATE '2024-12-31'
GROUP BY 1,2
ORDER BY 1,2;
