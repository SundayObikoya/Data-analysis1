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
