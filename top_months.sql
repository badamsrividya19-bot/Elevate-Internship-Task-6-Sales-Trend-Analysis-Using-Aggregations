-- top_months.sql
-- Top 3 months by revenue (Postgres / MySQL)
WITH monthly AS (
  SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS monthly_revenue
  FROM orders
  GROUP BY 1,2
)
SELECT year, month, monthly_revenue
FROM monthly
ORDER BY monthly_revenue DESC
LIMIT 3;
