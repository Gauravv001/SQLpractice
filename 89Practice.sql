-- Practice file 89
/*
Scenario: Retrieving Employees in a Specific Department Using a Subquery

Question: How would you find employees working in the 'Sales' department using a subquery?
In this scenario, a single-row subquery returns the department ID for 'Sales' and uses it in the outer query to filter employees

*/




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


-- employee table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department_id INT
);

INSERT INTO employees VALUES
(1, 'John Doe', 101),
(2, 'Jane Smith', 104),
(3, 'Michael Johnson', 103),
(4, 'Emily Davis', 104),
(5, 'David Brown', 101),
(6, 'Sarah Wilson', 104);

SELECT count(emp_name) FROM employees WHERE department_id IN (SELECT department_id FROM departments WHERE department_name = 'sales');
SELECT count(emp_name) FROM employees WHERE department_id = (SELECT department_id FROM departments WHERE department_name = 'sales');


So if an interviewer asks:

"What happens if a subquery returns multiple rows and you use =?"

Answer:

The query fails with a "Subquery returns more than 1 row" error. In such cases, IN should be used instead of =.