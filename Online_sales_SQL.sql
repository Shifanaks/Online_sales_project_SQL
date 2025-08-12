DROP TABLE IF EXISTS online_sales;

--create the table
CREATE TABLE online_sales (
    customer_id INT PRIMARY KEY,
	order_date TEXT,
	product_id INT,
	category_id INT,
    category_name VARCHAR(20),
    product_name VARCHAR(20),
    quantity INT,
	price NUMERIC(10, 2),
    payment_method VARCHAR(20),
	city VARCHAR(30),
	review_score INT,
	gender VARCHAR(1),
	age INT
);

--change the datatype of the column online_sales from TEXT to DATE
ALTER TABLE online_sales
ALTER COLUMN order_date TYPE DATE
USING TO_DATE(order_date, 'DD-MM-YYYY');

-- Count rows
SELECT COUNT(*) AS total_rows FROM online_sales;

-- View first 10 rows
SELECT * FROM online_sales LIMIT 10;

-- Check column names and types
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'online_sales';

--find the duplicates
SELECT order_date, price, product_id, review_score, gender, COUNT(*) AS duplicate_count
FROM online_sales
GROUP BY order_date, price, product_id, review_score, gender
HAVING COUNT(*) > 1
ORDER BY duplicate_count DESC;

-- Count NULLs per column
SELECT
    COUNT(*) FILTER (WHERE customer_id IS NULL) AS missing_customer_id,
    COUNT(*) FILTER (WHERE order_date IS NULL) AS missing_order_date,
    COUNT(*) FILTER (WHERE product_id IS NULL) AS missing_product_id,
    COUNT(*) FILTER (WHERE category_id IS NULL) AS missing_category_id,
	COUNT(*) FILTER (WHERE category_name IS NULL) AS missing_category_name,
	COUNT(*) FILTER (WHERE product_name IS NULL) AS missing_product_name,
	COUNT(*) FILTER (WHERE quantity IS NULL) AS missing_quantity,
	COUNT(*) FILTER (WHERE price IS NULL) AS missing_price,
	COUNT(*) FILTER (WHERE payment_method IS NULL) AS missing_payment_method,
	COUNT(*) FILTER (WHERE city IS NULL) AS missing_city,
	COUNT(*) FILTER (WHERE review_score IS NULL) AS missing_review_score,
	COUNT(*) FILTER (WHERE gender IS NULL) AS missing_gender,
	COUNT(*) FILTER (WHERE age IS NULL) AS missing_age
FROM online_sales;

--Drop the two clomns review_score and gender
ALTER TABLE online_sales
DROP COLUMN review_score,
DROP COLUMN gender;

--view first 10 rows
SELECT * FROM online_sales LIMIT 10;

--display the cleaned dataset
SELECT * FROM online_sales;

-- Check date range
SELECT MIN(order_date) AS start_date,
       MAX(order_date) AS end_date
FROM online_sales;

-- Total revenue
SELECT SUM(price) AS total_revenue FROM online_sales;

-- Number of unique customers
SELECT COUNT(DISTINCT customer_id) AS total_ciustomer FROM online_sales;

-- Monthly revenue and order trends
SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(price) AS monthly_revenue,
    COUNT(*) AS monthly_orders
FROM online_sales
WHERE order_date IS NOT NULL
GROUP BY year, month
ORDER BY year, month;

-- Top-selling products by revenue
SELECT 
    product_name,
    SUM(price) AS total_revenue,
    COUNT(*) AS total_orders
FROM online_sales
GROUP BY product_name
ORDER BY total_revenue DESC
LIMIT 10;

-- Revenue statistics
SELECT 
    MIN(price) AS min_price,
    MAX(price) AS max_price,
    AVG(price) AS avg_price,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY price) AS median_price
FROM online_sales
WHERE price IS NOT NULL;

-- Seasonal peaks (monthly average revenue)
SELECT
    EXTRACT(MONTH FROM order_date) AS month,
    AVG(price) AS avg_order_price,
    COUNT(*) AS total_orders
FROM online_sales
WHERE order_date IS NOT NULL
GROUP BY month
ORDER BY avg_order_price DESC;

-- Highest revenue day
SELECT order_date, SUM(price) AS total_revenue
FROM online_sales
GROUP BY order_date
ORDER BY total_revenue DESC
LIMIT 1;

-- Lowest revenue day (non-zero sales)
SELECT order_date, SUM(price) AS total_revenue
FROM online_sales
GROUP BY order_date
HAVING SUM(price) > 0
ORDER BY total_revenue ASC
LIMIT 1;

