-- Practice file 85
/*
Scenario: Retrieving All Employees with Their Department Details or NULL

Question: How can you retrieve all employees, even those without a department, using a LEFT JOIN?

A LEFT JOIN retrieves all rows from the left table (employees), even if there are no matching rows in the right table (departments).

*/

-- employee table
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
(4, 'Emily Davis', NULL),
(5, 'David Brown', 101);

-- departments table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO departments VALUES
(101, 'IT'),
(102, 'HR'),
(103, 'Finance');


SELECT * FROM employees ; 
select * FROM departments ;


SELECT e.employee_id, e.emp_name, d.department_name
FROM employees e
LEFT JOIN departments d
    ON e.department_id = d.department_id;


/*
Scenario: Identifying Unassigned Departments

Question: How can you retrieve all departments, including those without any employees assigned?

Using a RIGHT JOIN, we ensure all departments are included, even if there are no employees assigned to them

*/

-- right join --> all right table rows + matching employees rows
SELECT e.emp_name,d.department_name
FROM employees e
RIGHT JOIN departments d
    ON  e.department_id = d.department_id;


-- left join   
SELECT e.emp_name,d.department_name
FROM departments d
LEFT JOIN employees e
    ON  d.department_id = e.department_id;

