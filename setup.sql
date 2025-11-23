-- setup.sql
-- Sample schema and data for testing the aggregation queries
CREATE TABLE IF NOT EXISTS orders (
  order_id    TEXT PRIMARY KEY,
  order_date  DATE,
  amount      NUMERIC,
  product_id  TEXT
);

INSERT INTO orders (order_id, order_date, amount, product_id) VALUES
('O001','2024-01-05', 120.50, 'P001'),
('O002','2024-01-15', 59.99,  'P002'),
('O003','2024-02-03', 220.00, 'P001'),
('O004','2024-02-20', 10.00,  'P003'),
('O005','2024-03-01', 340.00, 'P002'),
('O006','2024-03-15', 80.00,  'P004'),
('O007','2024-03-20', 15.00,  'P005'),
('O008','2024-04-02', 50.00,  'P002'),
('O009','2024-04-10', 200.00, 'P001'),
('O010','2024-04-21', 125.50, 'P006');
