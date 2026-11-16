/*
You need to create a table that stores
product prices, including whole
numbers and decimal values.

Question:
Which data type should you use to store product prices in a table?

The DECIMAL data type is the most appropriate for storing prices since it provides high precision and control over
decimal places. Using DECIMAL avoids rounding issues that might arise with floating-point data types like FLOAT.

This structure ensures that prices like 123.45 or 99999.99 are
stored accurately without rounding errors.
*/

CREATE TABLE Product_Prices(
    product_id INT PRIMARY KEY auto_increment,
    product_name VARCHAR(100) NOT NULL,
    prices DECIMAL(10,2) -- upto 10 digits and 2 decimal points
);