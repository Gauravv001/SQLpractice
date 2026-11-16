-- 104Practice.sql


-- Scenario: Detecting the First and Last
-- Orders by Each Customer
-- Question: How can you find the first and last orders placed by
-- each customer?
-- Use ROW_NUMBER() to assign row numbers to orders, ordered
-- by date, and identify the first and last orders for each customer

DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2)
);

INSERT INTO orders VALUES
(101, 1, '2024-01-05', 500),
(102, 1, '2024-02-10', 700),
(103, 1, '2024-03-15', 900),

(104, 2, '2024-01-08', 300),
(105, 2, '2024-04-20', 800),

(106, 3, '2024-02-01', 600),
(107, 3, '2024-02-25', 400),
(108, 3, '2024-05-01', 1000);



SELECT * FROM orders;

WITH cte AS (
    SELECT *,
           ROW_NUMBER() OVER(
               PARTITION BY customer_id
               ORDER BY order_date
           ) AS first_rn,

           ROW_NUMBER() OVER(
               PARTITION BY customer_id
               ORDER BY order_date DESC
           ) AS last_rn
    FROM orders
)
SELECT *
FROM cte
WHERE first_rn = 1
   OR last_rn = 1;