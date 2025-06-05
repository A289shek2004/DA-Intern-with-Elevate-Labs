CREATE DATABASE Salesdb;
USE Salesdb;
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(10,2),
    product_id INT );
    
-- 1. Monthly Revenue and Order Volume
SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM orders
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;

--  2. Monthly Revenue Trend (Specific Year)
SELECT 
    MONTH(order_date) AS month,
    SUM(amount) AS monthly_revenue
FROM orders
WHERE YEAR(order_date) = 2024
GROUP BY MONTH(order_date)
ORDER BY month;

-- 3. Top 3 Months by Revenue
SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(amount) AS revenue
FROM orders
GROUP BY year, month
ORDER BY revenue DESC
LIMIT 3;

--  4. Count of Orders per Product per Month
SELECT 
    product_id,
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY product_id, year, month
ORDER BY product_id, year, month;

--  5. Handling NULL Amounts Gracefully
SELECT 
    MONTH(order_date) AS month,
    SUM(COALESCE(amount, 0)) AS monthly_revenue
FROM orders
GROUP BY MONTH(order_date);

