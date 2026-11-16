/*
Scenario: Grouping employee records by department
*/

-- Add your SQL practice code here
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10,2)
);


INSERT INTO employees (employee_id, employee_name, department_id, salary)
VALUES
(1, 'Alice', 101, 50000),
(2, 'Bob', 101, 60000),
(3, 'Charlie', 101, 70000),

(4, 'David', 102, 55000),
(5, 'Eva', 102, 65000),
(6, 'Frank', 102, 75000),

(7, 'Grace', 103, 80000),
(8, 'Helen', 103, 85000),
(9, 'Ian', 103, 90000);


SELECT department_id, AVG(salary) as avg_salary
FROM employees
GROUP BY department_id;