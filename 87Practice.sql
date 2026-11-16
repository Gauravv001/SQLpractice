-- Practice file 87
/*
Scenario: Listing Managers and Subordinates from the Same Table

Question: How can you list employees along with their managers using a SELF JOIN?

A SELF JOIN joins a table with itself. This is useful when the table
contains hierarchical data, like managers and employees.

*/

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    manager_id INT
);

INSERT INTO employees VALUES
(1, 'John Doe', NULL),      -- CEO
(2, 'Jane Smith', 1),
(3, 'Michael Johnson', 1),
(4, 'Emily Davis', 2),
(5, 'David Brown', 2),
(6, 'Sarah Wilson', 3);


SELECT e1.emp_name,e2.emp_name
FROM employees e1
LEFT JOIN employees e2
    ON  e1.manager_id = e2.employee_id;

SELECT
    e.emp_name AS employee_name,
    m.emp_name AS manager_name
FROM employees e
LEFT JOIN employees m
    ON e.manager_id = m.employee_id;        