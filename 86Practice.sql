-- Practice file 86

/*

Scenario: Showing Complete Employee and Department Data

Question: How would you display a report with all employees and all departments, even if they don’t match?

A FULL OUTER JOIN retrieves all rows from both tables, with NULL values where there are no matches

*/

DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department_id INT
);

INSERT INTO employees VALUES
(1, 'John Doe', 101),
(2, 'Jane Smith', 102),
(3, 'Michael Johnson', 103),
(4, 'Emily Davis', 104);


CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO departments VALUES
(101, 'IT'),
(102, 'HR'),
(103, 'Finance'),
(105, 'Sales');


-- my sql doesnot supports FULL OUTER JOIN so use this union to implement the logic


SELECT
    e.emp_name,
    d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id

UNION

SELECT
    e.emp_name,
    d.department_name
FROM employees e
RIGHT JOIN departments d
ON e.department_id = d.department_id;

/*

A FULL OUTER JOIN returns all rows from both tables. 
Matching rows are combined, while non-matching rows from either table are returned with NULL values for the missing side. 
Since MySQL does not support FULL OUTER JOIN directly, it is typically simulated using a LEFT JOIN UNION RIGHT JOIN.

INNER JOIN
= Only Matches

LEFT JOIN
= All Left + Matches

RIGHT JOIN
= All Right + Matches

FULL OUTER JOIN
= Everything ❤️

*/