/*
Deleting records of employees who left the company
*/

-- Add your SQL practice code here
Question:
How would you delete all employees with IDs between 10 and 20?

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
(5, 'Bob', 101, 60000),
(10, 'Charlie', 102, 55000),
(12, 'David', 103, 70000),
(15, 'Eva', 101, 65000),
(18, 'Frank', 102, 58000),
(20, 'Grace', 103, 80000),
(22, 'Helen', 101, 62000),
(25, 'Ian', 102, 75000);

SELECT * FROM employees
WHERE employee_id BETWEEN 10 AND 20;

DELETE  FROM employees
WHERE employee_id BETWEEN 10 AND 20;