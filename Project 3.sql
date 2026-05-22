CREATE DATABASE ecommerce_db;
USE ecommerce_db;

SELECT * FROM orders LIMIT 10;

-- Show first 10 rows
SELECT * FROM orders LIMIT 10;

-- Total number of orders
SELECT COUNT(*) AS Total_Orders
FROM orders;

-- Total revenue
SELECT SUM(TotalPrice) AS Total_Revenue
FROM orders;

-- Average order value
SELECT AVG(TotalPrice) AS Average_Order_Value
FROM orders;

-- Product wise revenue
SELECT Product,
SUM(TotalPrice) AS Revenue
FROM orders
GROUP BY Product
ORDER BY Revenue DESC;

-- Orders by payment method
SELECT PaymentMethod,
COUNT(*) AS Total_Orders
FROM orders
GROUP BY PaymentMethod
ORDER BY Total_Orders DESC;

-- Orders by status
SELECT OrderStatus,
COUNT(*) AS Total_Orders
FROM orders
GROUP BY OrderStatus
ORDER BY Total_Orders DESC;

-- Average revenue by product
SELECT Product,
AVG(TotalPrice) AS Avg_Revenue
FROM orders
GROUP BY Product
ORDER BY Avg_Revenue DESC;

-- Top 10 highest value orders
SELECT OrderID, Product, TotalPrice
FROM orders
ORDER BY TotalPrice DESC
LIMIT 10;

-- Online payment orders above 5000
SELECT *
FROM orders
WHERE PaymentMethod = 'Online'
AND TotalPrice > 5000;

-- Total quantity sold by product
SELECT Product,
SUM(Quantity) AS Total_Quantity
FROM orders
GROUP BY Product
ORDER BY Total_Quantity DESC;

-- Revenue by referral source
SELECT ReferralSource,
SUM(TotalPrice) AS Revenue
FROM orders
GROUP BY ReferralSource
ORDER BY Revenue DESC;

-- Most expensive order
SELECT *
FROM orders
ORDER BY TotalPrice DESC
LIMIT 1;

-- Products with revenue above 150000
SELECT Product,
SUM(TotalPrice) AS Revenue
FROM orders
GROUP BY Product
HAVING Revenue > 150000
ORDER BY Revenue DESC;

-- Number of orders for each product
SELECT Product,
COUNT(*) AS Order_Count
FROM orders
GROUP BY Product
ORDER BY Order_Count DESC;

-- Monthly revenue
SELECT 
DATE_FORMAT(Date, '%Y-%m') AS Month,
SUM(TotalPrice) AS Revenue
FROM orders
GROUP BY Month
ORDER BY Month;

-- Delivered orders only
SELECT *
FROM orders
WHERE OrderStatus = 'Delivered';

-- Products with quantity more than 5
SELECT *
FROM orders
WHERE Quantity > 5;