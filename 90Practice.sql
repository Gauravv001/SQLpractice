-- Practice file 90
/*

Scenario: Finding Employees with the Highest Salary in Each Department Using a Correlated Subquery

Question: How would you retrieve the names of the highest-paid employees in each department using a correlated subquery?
A correlated subquery compares each employee's salary with the highest salary within their department

*/

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10,2)
);

INSERT INTO employees VALUES
(1, 'John Doe', 101, 75000),
(2, 'Jane Smith', 101, 90000),
(3, 'Michael Johnson', 102, 82000),
(4, 'Emily Davis', 102, 95000),
(5, 'David Brown', 103, 70000),
(6, 'Sarah Wilson', 103, 70000);

-- highest paid employee from each department

SELECT e.emp_name, e.department_id,e.salary
FROM employees e
WHERE e.salary = (
    SELECT MAX(salary)
    FROM employees 
    WHERE department_id = e.department_id
);

WITH cte AS (
    SELECT *,
           DENSE_RANK() OVER(
               PARTITION BY department_id
               ORDER BY salary DESC
           ) AS rnk
    FROM employees
)
SELECT *
FROM cte
WHERE rnk = 1;