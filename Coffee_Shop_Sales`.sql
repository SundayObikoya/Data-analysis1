-- DROP TABLE IF EXISTS table_name

DROP TABLE IF EXISTS Coffee_Shop_Sales

/*CREATE TABLE table_name (
  column1 datatype1 [constraints],
  column2 datatype2 [constraints],...)*/

CREATE TABLE Coffee_Shop_Sales (
    "transaction_id" INT NOT NULL,
    "transaction_date" DATE,
    "months" VARCHAR (20) NOT NULL,
    "transaction_time" TIME,
    "transaction_qty" INT NOT NULL,
    "store_id" INT NOT NULL,
    "store_location" VARCHAR (100) NOT NULL,
	"product_id" INT	NOT NULL,
	"unit_price" DECIMAL NOT NULL,
	"product_category" VARCHAR (100) NOT NULL,
	"product_type" VARCHAR (100) NOT NULL,
	"product_detail" VARCHAR (100) NOT NULL,
    "sales_amount" DECIMAL NOT NULL )

-- Uploading Coffee_Shop_Sales data to SQL from CSV file

COPY Coffee_Shop_Sales FROM 'C:\Users\User\OneDrive\Desktop\Coffee_Shop_Sales.csv' DELIMITER ',' CSV HEADER;

--Retrieving Coffee_Shop_Sales TABLE FROM THE DATABASE
SELECT *
FROM Coffee_Shop_Sales



--PROJECT QUESTIONS

-- 1. Count the number of transactions in the dataset

/* SYNTAX FOR THIS
   SELECT COUNT(col_name)
   FROM table_name */

SELECT COUNT(transaction_id)
FROM coffee_shop_sales


-- 2. Retrieve all records where the sales amount is greater than 100.

/* SYNTAX FOR THIS
   SELECT *, col_name
   FROM table_name
   WHERE col_name < 100 */

SELECT *, sales_amount
FROM coffee_shop_sales
WHERE sales_amount < 100


-- 3. Find the total sales amount for each store

/* SYNTAX FOR THIS
   SELECT Col1, SUM(col2)
   FROM table_name
   GROUP BY table_name.col1 */

SELECT store_id, SUM(Sales_amount)
FROM coffee_shop_sales
GROUP BY coffee_shop_sales.store_id


-- 4. List the unique product categories available in the dataset.

/* SYNTAX FOR THIS
   SELECT DISTINCT Col_name
   FROM table_name */

SELECT DISTINCT product_category
FROM coffee_shop_sales


/* 5. Retrieve transactions where the product type is 'Housewares'
      and the sales amount is between 50 and 100. */

/* SYNTAX FOR THIS
   SELECT *
   FROM table_name
   WHERE Col1 = 'Housewares' AND col2 BETWEEN 50 AND 100 */
 
SELECT *
FROM coffee_shop_sales
WHERE  Product_type = 'Housewares' AND sales_amount BETWEEN 50 AND 100


-- 6. Calculate the average sales amount per transaction

*/ this question seems incomplete as average sales amount will be easily
   possible when we have a grouping. For instance average sales amount
   for product_type, store_location, product_category e.t.c */
   
SELECT *, (sales_amount/transaction_qty) AS avg_sales
FROM coffee_shop_sales


-- 7. Find the store with the highest total sales.

/* SYNTAX FOR THIS
   SELECT Col1, SUM(col2) AS col.name
   FROM table_name
   GROUP BY table_name.col1 
   ORDER BY col.name DESC
   LIMIT 1 */

SELECT store_id, SUM(Sales_amount) AS total_sales_amount
FROM coffee_shop_sales
GROUP BY coffee_shop_sales.store_id
ORDER BY total_sales_amount DESC
LIMIT 1


/* 8.	Count the number of transactions for each product category 
        and sort the result by the count in descending order.*/

/* SYNTAX FOR THIS
   SELECT Col1, COUNT(col2) AS col.name
   FROM table_name
   GROUP BY col1 
   ORDER BY col.name DESC */


SELECT product_category, COUNT(transaction_id) AS number_of_transaction
FROM coffee_shop_sales
GROUP BY product_category
ORDER BY number_of_transaction DESC

-- 9. Find the average sales amount per transaction for each product type.

/* SYNTAX FOR THIS
   SELECT Col1, AVG(col2) AS col.name
   FROM table_name
   GROUP BY col1 
   ORDER BY col.name */

SELECT product_type, ROUND(AVG(sales_amount),2) AS avg_sales_amount
FROM coffee_shop_sales
GROUP BY product_type
ORDER BY avg_sales_amount

--10. Find the total sales amount for each Month.

/* SYNTAX FOR THIS
   SELECT Col1, SUM(col2) AS col.name
   FROM table_name
   GROUP BY col1 
   ORDER BY col.name */

SELECT months, SUM(sales_amount) AS total_sales_amount
FROM coffee_shop_sales
GROUP BY months
ORDER BY total_sales_amount
