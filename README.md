# Online_sales_project_SQL

## Project Overview
This project performs Exploratory Data Analysis (EDA) and Sales Trend Analysis on an online retail dataset using PostgreSQL in pgAdmin 4.  The main goal is to analyse monthly revenue, order volume, and other key sales insights.

## Datase Used
- <a href="https://github.com/Shifanaks/Online_sales_project_SQL/blob/main/synthetic_online_retail_data.csv">Row Dataset</a>
- Source - Kaggle
- Data Contents:
    - customer_id	-	Unique customer identifier (ranging from 10000 to 99999)
    - order_date	-	Order date (a random date within the last year)
    - product_id	-	Product identifier (ranging from 100 to 999)
    - category_id	-	Product category identifier (10, 20, 30, 40, or 50)
    - category_name	-	Product category name (Electronics, Fashion, Home & Living, Books & Stationery, Sports & Outdoors)
    - product_name	-	Product name (randomly selected from a list of products within the corresponding category)
    - quantity	-	Quantity of the product ordered (ranging from 1 to 5)
    - price	-	Unit price of the product (ranging from 10.00 to 500.00, with two decimal places)
    - payment_method	-	Payment method used (Credit Card, Bank Transfer, Cash on Delivery)
    - city	-	Customer's city (generated using Faker's city() method, so the locations will depend on the Faker locale you used)
    - review_score	-	Customer's product rating (ranging from 1 to 5, or None with a 20% probability)
    - gender	-	Customer's gender (M/F, or None with a 10% probability)
    - age	-	Customer's age (ranging from 18 to 75)


## Tools Used
- PostgreSQL (SQL queries)
- pgAdmin 4 (database management)


## SQL Queries

### Steps

- create the table
- change the datatype of the column online_sales from TEXT to DATE
- Count rows
- Check column names and types
- find the duplicates
- Count NULLs per column
- Drop the two clomns review_score and gender
- display the cleaned dataset
- Check date range
- Total revenue
- Number of unique customers
- Monthly revenue and order trends
- Top-selling products by revenue
- Revenue statistics
- Seasonal peaks (monthly average revenue)
- Highest revenue day
- Lowest revenue day (non-zero sales

## Result Tables

### Cleaned dataset
- <a href="https://github.com/Shifanaks/Online_sales_project_SQL/blob/main/cleaned_online_sales_dataset.csv">Cleaned Dataset</a>

### Monthly Revenue
- <a href="https://github.com/Shifanaks/Online_sales_project_SQL/blob/main/monthly_revenue.csv">Monthly Revenue Detailst</a>

### Monthly Revenue By Order Trend
- <a href="https://github.com/Shifanaks/Online_sales_project_SQL/blob/main/monthly_revenue_by_order_trend.csv">Monthly Revenue By Order Trend Details</a>

### Revenue Statistics
- <a href="https://github.com/Shifanaks/Online_sales_project_SQL/blob/main/revenue_statistics.csv">Revenue Statistics Details</a>

### Top Selling Products BY Revenue
- <a href="https://github.com/Shifanaks/Online_sales_project_SQL/blob/main/top_selling_product_by_revenue.csv">Top Selling Products BY Revenue Details</a>

### Highest Revenue Day
- <a href="https://github.com/Shifanaks/Online_sales_project_SQL/blob/main/highest_revenue_day.csv">Highest Revenue Day Details</a>

## Lowest Revenue Day
- <a href="https://github.com/Shifanaks/Online_sales_project_SQL/blob/main/lowest_revenue_day.csv">Lowest Revenue Day Details</a>


## SQL Script
- <a href="https://github.com/Shifanaks/Online_sales_project_SQL/blob/main/Online_sales_SQL.sql">SQL Script</a>
