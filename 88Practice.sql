-- Practice file 88
/*

Scenario: Generating All Possible Combinations of Employees and Departments

Question: How would you generate every possible combination of employees and departments?
A CROSS JOIN creates a Cartesian product, generating every possible combination of rows from two tables.

*/

DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    emp_name VARCHAR(50)
);

INSERT INTO employees VALUES
(1, 'John Doe'),
(2, 'Jane Smith'),
(3, 'Michael Johnson');


CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO departments VALUES
(101, 'IT'),
(102, 'HR'),
(103, 'Finance');


-- How would you generate every possible combination of employees and departments?

SELECT * FROM employees e CROSS JOIN departments d;