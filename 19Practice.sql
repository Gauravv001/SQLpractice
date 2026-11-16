/*
You want to join the employees table with the departments table to display employee names along with their department names.
*/

-- drop table employees;
CREATE TABLE employees(
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    department_id INT
);

-- drop table departments;
CREATE TABLE departments(
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(50) NOT NULL
);

select * from employees;

INSERT INTO employees (first_name, department_id) VALUES
('Amit', 1),     -- Engineering
('Neha', 2),     -- HR
('Ravi', 1),     -- Engineering
('Priya', 3),    -- Finance
('Karan', 4),    -- Marketing
('Sneha', 5),    -- Sales
('Arjun', 1),    -- Engineering
('Pooja', 2),    -- HR
('Rahul', NULL); -- No department assigned

INSERT INTO departments (department_name) VALUES
('Engineering'),
('HR'),
('Finance'),
('Marketing'),
('Sales');

/*
Question:
How can you use the JOIN clause to combine data from
multiple tables?
The JOIN clause combines rows from two or more tables
based on a related column. In this scenario, the
department_id column links the employees and
departments tables
*/
SELECT e.first_name,d.department_name
FROM employees e
JOIN departments d
on e.department_id = d.department_id;