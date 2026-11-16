-- 106Practice.sql
-- New practice SQL file created.

-- Write your SQL here.
-- Scenario: Using Recursive CTEs for
-- Cumulative Sales
-- Question: How can you calculate cumulative sales using a
-- recursive CTE?
-- The MERGE statement combines INSERT, UPDATE, and DELETE
-- operations in one query, synchronizing data between two tables.



DROP TABLE IF EXISTS sales;

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    sale_date DATE,
    amount INT
);

INSERT INTO sales VALUES
(1,'2024-01-01',100),
(2,'2024-01-02',200),
(3,'2024-01-03',300),
(4,'2024-01-04',400),
(5,'2024-01-05',500);


SELECT * FROM sales;


WITH RECURSIVE cte AS (
    SELECT sale_id,
           sale_date,
           amount,
           amount AS running_amount
    FROM sales
    WHERE sale_id = 1
    UNION all
    SELECT s.sale_id,
           s.sale_date,
           s.amount,
           c.running_amount + s.amount
    FROM sales s
    JOIN cte c
      ON s.sale_id = c.sale_id + 1
)

SELECT *
FROM cte;