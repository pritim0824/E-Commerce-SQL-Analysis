
CREATE DATABASE ecommerce_analysis;
USE ecommerce_analysis;

SHOW DATABASES;

USE ecommerce_analysis;

SHOW TABLES;

SELECT *
FROM orders
LIMIT 10;

SELECT COUNT(*) AS total_records
FROM orders;


USE ecommerce_analysis;

SELECT *
FROM `dataset for data analytics 3rd project`
LIMIT 10;

SELECT COUNT(*) AS total_records
FROM `dataset for data analytics 3rd project`;

SELECT
    PaymentMethod,
    COUNT(*) AS total_orders,
    SUM(TotalPrice) AS total_sales
FROM `dataset for data analytics 3rd project`
GROUP BY PaymentMethod
ORDER BY total_sales DESC;

SELECT
    PaymentMethod,
    COUNT(*) AS total_orders,
    SUM(TotalPrice) AS total_sales,
    AVG(TotalPrice) AS average_order_value
FROM `dataset for data analytics 3rd project`
GROUP BY PaymentMethod
ORDER BY total_sales DESC;

SELECT
    Product,
    SUM(Quantity) AS total_quantity_sold,
    COUNT(*) AS total_orders,
    SUM(TotalPrice) AS total_sales
FROM `dataset for data analytics 3rd project`
GROUP BY Product
ORDER BY total_sales DESC;

SELECT
    OrderStatus,
    COUNT(*) AS total_orders,
    SUM(TotalPrice) AS total_sales,
    AVG(TotalPrice) AS average_order_value
FROM `dataset for data analytics 3rd project`
GROUP BY OrderStatus
ORDER BY total_orders DESC;

SELECT
    DATE_FORMAT(STR_TO_DATE(`Date`, '%Y-%m-%d'), '%Y-%m') AS sales_month,
    COUNT(*) AS total_orders,
    ROUND(SUM(TotalPrice), 2) AS total_sales,
    ROUND(AVG(TotalPrice), 2) AS average_order_value
FROM `dataset for data analytics 3rd project`
GROUP BY sales_month
ORDER BY sales_month;

SELECT
    DATE_FORMAT(STR_TO_DATE(`Date`, '%Y-%m-%d'), '%Y-%m') AS sales_month,
    COUNT(*) AS total_orders,
    ROUND(SUM(TotalPrice), 2) AS total_sales,
    ROUND(AVG(TotalPrice), 2) AS average_order_value
FROM `dataset for data analytics 3rd project`
GROUP BY sales_month
ORDER BY sales_month;

SELECT
    Product,
    SUM(Quantity) AS total_quantity_sold,
    ROUND(SUM(TotalPrice), 2) AS total_sales
FROM `dataset for data analytics 3rd project`
GROUP BY Product
HAVING SUM(TotalPrice) > 50000
ORDER BY total_sales DESC;

SELECT
    Product,
    SUM(Quantity) AS total_quantity_sold,
    ROUND(SUM(TotalPrice), 2) AS total_sales
FROM `dataset for data analytics 3rd project`
GROUP BY Product
HAVING SUM(TotalPrice) > 50000
ORDER BY total_sales DESC;

SELECT
    PaymentMethod,
    ROUND(SUM(TotalPrice), 2) AS total_sales,
    ROUND(
        SUM(TotalPrice) * 100.0 /
        (SELECT SUM(TotalPrice)
         FROM `dataset for data analytics 3rd project`),
        2
    ) AS sales_percentage
FROM `dataset for data analytics 3rd project`
GROUP BY PaymentMethod
ORDER BY sales_percentage DESC;

SELECT
    OrderStatus,
    COUNT(*) AS total_orders,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*)
         FROM `dataset for data analytics 3rd project`),
        2
    ) AS order_percentage
FROM `dataset for data analytics 3rd project`
GROUP BY OrderStatus
ORDER BY total_orders DESC;


