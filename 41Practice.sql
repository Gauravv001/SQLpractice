/*
Updating employee salaries based on performance
*/

-- Add your SQL practice code here
Question:
How can you increase the salary of employees in the
employees table by 10% for those in department 101?
The UPDATE statement modifies rows with a condition


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
(3, 'Charlie', 102, 55000),
(4, 'David', 101, 70000),
(5, 'Eva', 103, 65000),
(6, 'Frank', 102, 58000),
(7, 'Grace', 101, 80000),
(8, 'Helen', 103, 62000);

UPDATE employees
SET salary = salary * 1.1
WHERE department_id = 101;

SELECT * FROM employees 
WHERE department_id = 101;