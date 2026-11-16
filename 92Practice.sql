-- Practice file 92
/*
Scenario: Finding Employees Not Belonging to a Specific Department

Question: How can you retrieve employees who are not in the 'IT' department using a subquery

*/

SELECT e.emp_name,d.department_name FROM employees e
LEFT OUTER JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_id NOT IN (SELECT department_id FROM departments WHERE department_name = 'IT');


DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO departments VALUES
(101, 'IT'),
(102, 'HR'),
(103, 'Finance'),
(104, 'Sales');

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department_id INT
);

INSERT INTO employees VALUES
(1, 'John Doe', 101),
(2, 'Jane Smith', 102),
(3, 'Michael Johnson', 103),
(4, 'Emily Davis', 104),
(5, 'David Brown', 101);


SELECT * FROM employees; 
SELECT * FROM departments; 


