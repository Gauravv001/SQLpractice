-- Practice file 91
/*
Scenario: Combining Employee Data from Two Departments Using UNION

Question: How can you combine the names of employees from two departments without duplicates?

Using the UNION operator ensures the result set contains unique employee names from the specified departments.
*/

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department_id INT
);

INSERT INTO employees VALUES
(1, 'John Doe', 101),
(2, 'Jane Smith', 101),
(3, 'Michael Johnson', 102),
(4, 'Emily Davis', 102),
(5, 'John Doe', 102),      -- Duplicate Name
(6, 'David Brown', 103);


-- Combine employee names from Department 101 and Department 102 without duplicates.

SELECT emp_name FROM employees WHERE department_id = '101'
UNION 
SELECT emp_name FROM employees WHERE department_id = '102';


/*
Scenario: Including Duplicates When Combining Employee Data Using UNION ALL
Question: How would you include duplicates when combining employee data from two departments?

The UNION ALL operator keeps all duplicates in the combined result.
*/

SELECT emp_name FROM employees WHERE department_id = '101'
UNION ALL
SELECT emp_name FROM employees WHERE department_id = '102';