-- Practice file 99
/*
Scenario: Identifying and Handling
Duplicate Data with ROW_NUMBER()
Question: How would you identify and remove duplicate
employee records based on the employee's name using the
ROW_NUMBER() function?
The ROW_NUMBER() function assigns a unique sequential number
to each row within a partition, ordered by a specific column. When
duplicate records exist, this function helps keep only the first
occurrence while identifying and deleting the rest

*/

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2)
);

INSERT INTO employees VALUES
(1, 'John Doe', 75000),
(2, 'Jane Smith', 68000),
(3, 'John Doe', 75000),     -- Duplicate
(4, 'Michael Johnson', 82000),
(5, 'John Doe', 75000),     -- Duplicate
(6, 'Emily Davis', 59000),
(7, 'Jane Smith', 68000);   -- Duplicate



WITH cte_emp AS(
    SELECT employee_id,emp_name,salary,
    ROW_NUMBER() OVER(PARTITION BY emp_name ORDER BY employee_id) as rnk
    FROM employees
)
select * from cte_emp 
where rnk > 1; 

WITH cte_emp AS(
    SELECT employee_id,emp_name,salary,
    ROW_NUMBER() OVER(PARTITION BY emp_name ORDER BY employee_id) as rnk
    FROM employees
)
DELETE FROM employees
WHERE employee_id IN (SELECT employee_id FROM cte_emp WHERE rnk > 1); 