-- Practice file 70
/*
Scenario: Using temporary tables for
intermediate calculations

Question: How would you use a temporary table to store
intermediate results?
Temporary tables store data temporarily for intermediate
processing and are dropped automatically after the session
ends.

*/

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2),
    department VARCHAR(50)
);

INSERT INTO employees VALUES
(1, 'John Doe', 75000.00, 'IT'),
(2, 'Jane Smith', 68000.00, 'HR'),
(3, 'Michael Johnson', 82000.00, 'Finance'),
(4, 'Emily Davis', 39000.00, 'Marketing'),
(5, 'David Brown', 91000.00, 'IT'),
(6, 'Sarah Wilson', 72000.00, 'Sales'),
(7, 'Chris Taylor', 66000.00, 'HR'),
(8, 'Jessica Anderson', 61000.00, 'Finance');

CREATE TEMPORARY TABLE emp_salary_tab AS
SELECT employee_id,emp_name,salary FROM employees
WHERE salary > 50000;

DROP TEMPORARY TABLE emp_salary_tab;



-- you can select this temp table
SELECT * FROM emp_salary_tab;



-- UPDATE TEMP TABLE
UPDATE emp_salary_tab
SET salary = 55000
WHERE employee_id = 5;