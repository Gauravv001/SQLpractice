-- Practice file 56
/*
Scenario: Combining multiple result sets with UNION

For Example:
Question: How would you combine employees and contractors
into a single result set without duplicates
*/

-- Employees Table
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50)
);

INSERT INTO employees VALUES
(1, 'John Doe', 'IT'),
(2, 'Jane Smith', 'HR'),
(3, 'Michael Johnson', 'Finance'),
(4, 'Emily Davis', 'Marketing'),
(5, 'Sarah Wilson', 'Sales');


-- Contractors Table
DROP TABLE IF EXISTS contractors;

CREATE TABLE contractors (
    contractor_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50)
);

INSERT INTO contractors VALUES
(101, 'David Brown', 'IT'),
(102, 'Chris Taylor', 'Finance'),
(103, 'John Doe', 'IT'),        -- Duplicate of employee
(104, 'Jessica Anderson', 'HR'),
(105, 'Emily Davis', 'Marketing'); -- Duplicate of employee


SELECT emp_name FROM employees
UNION ALL
SELECT emp_name FROM contractors;