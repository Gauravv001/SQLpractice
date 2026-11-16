/*
You want to rank employees within each department based on their salary.
*/

Question:
How can you use the RANK() function with PARTITION BY?
The RANK() function assigns ranks to rows within each
department, resetting for each partition.

SELECT employee_name,
    department,
    salary,
    RANK() OVER(PARTITION BY DEPARTMENT ORDER BY SALARY DESC) AS RANK_EMP
FROM EMPLOYEES;

-- Add your SQL practice code here
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

INSERT INTO employees (employee_id, employee_name, department, salary) VALUES
(1, 'Alice',   'IT',      90000),
(2, 'Bob',     'IT',      120000),
(3, 'Charlie', 'IT',      100000),
(4, 'David',   'HR',       70000),
(5, 'Eva',     'HR',       85000),
(6, 'Frank',   'HR',       85000),
(7, 'Grace',   'Finance', 110000),
(8, 'Helen',   'Finance', 130000),
(9, 'Ian',     'Finance', 105000);