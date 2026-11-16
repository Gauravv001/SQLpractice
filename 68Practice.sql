-- Practice file 68
/*

Scenario: Creating an updatable view Updating Through the View:
Question: How can you create a view that allows updates to the underlying table?


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
(4, 'Emily Davis', 59000.00, 'Marketing'),
(5, 'David Brown', 91000.00, 'IT');

CREATE VIEW emp_view AS
SELECT employee_id, emp_name,salary,department
FROM employees
WHERE salary > 55000;


SELECT * FROM emp_view;

-- Create an Updatable View means Single table
-- No GROUP BY
-- No Aggregate Functions
-- No DISTINCT


-- now make a update in salary where emp_id  = 1

UPDATE employees
SET salary = 95000
WHERE employee_id = 1;

An updatable view is a view through which INSERT, UPDATE, and DELETE operations can be performed on the underlying table.
To create one, the view should generally be based on a single table and avoid constructs 
such as GROUP BY, DISTINCT, aggregate functions, and UNION. Updates made through the view are automatically reflected in the base table.

/*
Simple View
=
Updatable

Complex View
(GROUP BY, AVG, DISTINCT)
=
Not Updatable
*/