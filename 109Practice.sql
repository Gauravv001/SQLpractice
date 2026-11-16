-- 109Practice.sql


-- Scenario: Identify the top 3 earners in
-- each department.
-- Question: How can you use RANK() to identify the top 3 earners
-- in each department?
-- The RANK() function with PARTITION BY allows you to calculate
-- ranks within a group (in this case, departments). You can then
-- filter the top 3 earners using a WHERE clause


DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10,2)
);

INSERT INTO employees VALUES
(1,'John Doe',101,90000),
(2,'Jane Smith',101,85000),
(3,'Michael Johnson',101,85000),
(4,'Chris Taylor',101,70000),

(5,'Emily Davis',102,80000),
(6,'David Brown',102,75000),
(7,'Sarah Wilson',102,70000),
(8,'Sophia Moore',102,65000),

(9,'Daniel Thomas',103,95000),
(10,'Jessica Anderson',103,60000);

WITH CTE AS (
    SELECT *, RANK() OVER(
    PARTITION BY department_id
    ORDER BY salary DESC) rnk
FROM employees
)
SELECT * FROM CTE
WHERE rnk <= 3
;
