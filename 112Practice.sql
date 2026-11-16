-- 112Practice.sql
-- Practice SQL file with space for a question statement.

/*
Question statement:



Calculate cumulative (running) sales using a Recursive CTE.


*/

DROP TABLE IF EXISTS sales;

CREATE TABLE sales (
    month VARCHAR(10),
    sales INT
);

INSERT INTO sales VALUES
('Jan',100),
('Feb',200),
('Mar',150);

WITH RECURSIVE

MonthlySales AS
(
    SELECT
        month,
        sales,
        ROW_NUMBER() OVER(ORDER BY month) AS rn
    FROM sales
),

RecursiveSales AS
(
    SELECT
        month,
        sales,
        rn,
        sales AS cumulative_sales
    FROM MonthlySales
    WHERE rn = 1

    UNION ALL

    SELECT
        ms.month,
        ms.sales,
        ms.rn,
        rs.cumulative_sales + ms.sales
    FROM MonthlySales ms
    JOIN RecursiveSales rs
        ON ms.rn = rs.rn + 1
)

SELECT
    month,
    sales,
    cumulative_sales
FROM RecursiveSales;



