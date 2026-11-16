-- 103Practice.sql
-- Scenario: Identifying Missing Order IDs
-- Using Window Functions
-- Question: How can you identify missing order IDs in a sequence
-- using a query?
-- You can use the LEAD() window function to find gaps between
-- consecutive order IDs. This helps identify if there are missing
-- entries in a sequential dataset

-- Write your SQL here.

DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
    order_id INT PRIMARY KEY
);

INSERT INTO orders VALUES
(101),
(102),
(103),
(105),
(106),
(109),
(110);


SELECT order_id as current_order_id,
        LEAD(order_id) OVER(ORDER BY order_id) as next_order_id
        -- ,LAG(order_id) OVER(ORDER BY order_id) as prev_order_id
FROM orders
;

-- Finding Gaps
WITH cte AS(
SELECT order_id as current_order_id,
        LEAD(order_id) OVER(ORDER BY order_id) as next_order_id
        -- ,LAG(order_id) OVER(ORDER BY order_id) as prev_order_id
FROM orders
)

SELECT * FROM cte 
WHERE next_order_id - current_order_id > 1;

-- Identify Missing IDs

WITH cte AS(
SELECT order_id as current_order_id,
        LEAD(order_id) OVER(ORDER BY order_id) as next_order_id
FROM orders
)
SELECT
    current_order_id + 1 as gap_starts_at,
    next_order_id - 1 AS gap_ends_at
FROM cte 
WHERE next_order_id - current_order_id > 1
;















