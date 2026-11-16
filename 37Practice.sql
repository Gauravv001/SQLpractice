/*
You need to count employees in each department but only display departments with more than five employees.
*/

-- Add your SQL practice code here
Question:
How can you use GROUP BY with HAVING to filter grouped data?
The GROUP BY clause groups rows by department, and
the HAVING clause filters those with more than five
employees.

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department VARCHAR(50)
);

INSERT INTO employees (employee_id, employee_name, department) VALUES
(1, 'Alice', 'IT'),
(2, 'Bob', 'IT'),
(3, 'Charlie', 'IT'),
(4, 'David', 'IT'),
(5, 'Eva', 'IT'),
(6, 'Frank', 'IT'),
(7, 'Grace', 'HR'),
(8, 'Helen', 'HR'),
(9, 'Ian', 'HR'),
(10, 'Jack', 'Finance'),
(11, 'Karen', 'Finance'),
(12, 'Leo', 'Finance'),
(13, 'Mike', 'Finance'),
(14, 'Nancy', 'Finance'),
(15, 'Olivia', 'Finance'),
(16, 'Peter', 'Sales'),
(17, 'Quinn', 'Sales'),
(18, 'Ryan', 'Sales'),
(19, 'Sarah', 'Sales'),
(20, 'Tom', 'Sales'),
(21, 'Uma', 'Sales'),
(22, 'Victor', 'Sales');


SELECT COUNT(employee_id) as emp_coun, department
FROM employees
GROUP BY department
HAVING COUNT(employee_id) > 5;