-- 102Practice.sql

-- Scenario: Calculating Percentage
-- Contribution Using Window Functions
-- Question: How can you calculate the percentage contribution of
-- each employee’s salary to the total salary within their
-- department?
-- The SUM() function with the OVER clause calculates totals without
-- collapsing rows. By dividing an employee's salary by the
-- department's total salary, you can compute the percentage
-- contribution of each employee


-- Write your SQL here.
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10,2)
);

INSERT INTO employees VALUES
(1, 'John Doe', 101, 50000),
(2, 'Jane Smith', 101, 30000),
(3, 'Michael Johnson', 101, 20000),
(4, 'Emily Davis', 102, 40000),
(5, 'David Brown', 102, 60000);


SELECT * FROM employees; 

SELECT *, SUM(salary) OVER(PARTITION BY department_id) AS tot_Sal,
ROUND(salary * 100.0/ SUM(salary) OVER(PARTITION BY department_id), 2) as contri_pct
FROM employees;