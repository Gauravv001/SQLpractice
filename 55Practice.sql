-- Practice file 55
/*

Scenario: Handling duplicate rows in a table

Table Before Deletion:
Question: How can you remove duplicate rows from a table, keeping only the first occurrence?

*/


DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2),
    department_id INT 
);


-- Insert Dummy Data (Contains Duplicates)
INSERT INTO employees (emp_name, salary, department_id) VALUES
('John Doe', 75000.00, 101),
('Jane Smith', 68000.00, 102),
('John Doe', 75000.00, 101),      -- Duplicate
('Michael Johnson', 82000.00, 101),
('Emily Davis', 59000.00, 103),
('John Doe', 75000.00, 101),      -- Duplicate
('Sarah Wilson', 72000.00, 104),
('Jane Smith', 68000.00, 102),    -- Duplicate
('David Brown', 91000.00, 101),
('Emily Davis', 59000.00, 103),   -- Duplicate
('Chris Taylor', 66000.00, 102);

WITH CTE AS (
    SELECT employee_id,
           department_id,
           salary,
           emp_name,
           ROW_NUMBER() OVER (
               PARTITION BY emp_name, department_id
               ORDER BY employee_id
           ) AS row_num
    FROM employees
)
DELETE FROM employees
WHERE employee_id IN (SELECT employee_id FROM cte WHERE ROW_NUM > 1);

SELECT emp_name,count(1)
FROM employees
group by 1
having count(1) > 1;