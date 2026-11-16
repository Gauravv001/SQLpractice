/*
You want to list employees with their
managers. 
Managers are also stored in
the employees table.
*/

DROP TABLE employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    manager_id INT,
    FOREIGN KEY (manager_id) REFERENCES employees(employee_id)
);

INSERT INTO employees (employee_id, first_name, manager_id) VALUES
(1, 'Amit', NULL),     -- CEO (no manager)
(2, 'Neha', 1),        -- reports to Amit
(3, 'Ravi', 1),        -- reports to Amit
(4, 'Priya', 2),       -- reports to Neha
(5, 'Karan', 2),       -- reports to Neha
(6, 'Sneha', 3),       -- reports to Ravi
(7, 'Arjun', 3),       -- reports to Ravi
(8, 'Pooja', 4);       -- reports to Priya


SELECT * FROM employees;

/*
Question:
How can you use SELF JOIN to connect employees with their managers?
A SELF JOIN allows you to join a table with itself. Here, each
employee has a manager_id that references another
employee's employee_id.


This is called a Self Join
Always use table aliases (e, m) to avoid confusion
manager_id IS NULL → top-level employee (CEO)
*/

SELECT E1.first_name as employee_name, E2.first_name as manager_name
FROM employees E1
LEFT JOIN employees E2
on E1.manager_id = E2.employee_id
