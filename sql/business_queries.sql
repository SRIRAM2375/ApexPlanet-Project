-- ==========================================
-- ApexPlanet Task 2
-- Superstore SQL Business Analysis
-- ==========================================


-- 1. Top 10 Customers by Sales
WITH customer_sales AS (
    SELECT
        "Customer ID",
        "Customer Name",
        SUM("Sales") AS total_sales
    FROM sales
    GROUP BY
        "Customer ID",
        "Customer Name"
)
SELECT
    "Customer Name",
    total_sales,
    RANK() OVER (
        ORDER BY total_sales DESC
    ) AS customer_rank
FROM customer_sales
ORDER BY customer_rank
LIMIT 10;


-- 2. Top 10 Products by Sales
SELECT
    "Product ID",
    "Product Name",
    SUM("Sales") AS total_sales
FROM sales
GROUP BY
    "Product ID",
    "Product Name"
ORDER BY total_sales DESC
LIMIT 10;


-- 3. Top 10 Products by Profit
SELECT
    "Product ID",
    "Product Name",
    SUM("Profit") AS total_profit
FROM sales
GROUP BY
    "Product ID",
    "Product Name"
ORDER BY total_profit DESC
LIMIT 10;


-- 4. Loss-Making Products
SELECT
    "Product ID",
    "Product Name",
    SUM("Profit") AS total_profit
FROM sales
GROUP BY
    "Product ID",
    "Product Name"
HAVING SUM("Profit") < 0
ORDER BY total_profit ASC
LIMIT 10;


-- 5. Sales and Profit by Region
SELECT
    "Region",
    SUM("Sales") AS total_sales,
    SUM("Profit") AS total_profit
FROM sales
GROUP BY "Region"
ORDER BY total_sales DESC;


-- 6. Category Performance
SELECT
    "Category",
    SUM("Sales") AS total_sales,
    SUM("Profit") AS total_profit,
    AVG("Profit") AS average_profit
FROM sales
GROUP BY "Category"
ORDER BY total_profit DESC;


-- 7. Customer Segment Performance
SELECT
    "Segment",
    COUNT(DISTINCT "Customer ID") AS customers,
    SUM("Sales") AS total_sales,
    SUM("Profit") AS total_profit
FROM sales
GROUP BY "Segment"
ORDER BY total_profit DESC;


-- 8. Monthly Sales Trend
WITH monthly_sales AS (
    SELECT
        strftime('%Y-%m', "Order Date") AS month,
        SUM("Sales") AS total_sales
    FROM sales
    GROUP BY month
)
SELECT
    month,
    total_sales,
    LAG(total_sales) OVER (
        ORDER BY month
    ) AS previous_month_sales
FROM monthly_sales
ORDER BY month;


-- 9. Average Order Value
SELECT
    COUNT(DISTINCT "Order ID") AS total_orders,
    SUM("Sales") AS total_sales,
    SUM("Sales") / COUNT(DISTINCT "Order ID") AS average_order_value
FROM sales;


-- 10. High-Sales / Low-Profit Customers
SELECT
    "Customer ID",
    "Customer Name",
    SUM("Sales") AS total_sales,
    SUM("Profit") AS total_profit
FROM sales
GROUP BY
    "Customer ID",
    "Customer Name"
HAVING
    SUM("Sales") > (
        SELECT AVG(customer_sales)
        FROM (
            SELECT SUM("Sales") AS customer_sales
            FROM sales
            GROUP BY "Customer ID"
        )
    )
    AND SUM("Profit") < 0
ORDER BY total_sales DESC;