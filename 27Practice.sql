/*
You want to display the total number of
employees in each department,
including departments with no
employees.
*/

/*Question:
How can you use LEFT OUTER JOIN to retrieve all
departments?

Using a LEFT OUTER JOIN, all departments are retrieved,
even if no employees exis

*/

drop table employees;
drop table departments;

-- Table Structure:
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

INSERT INTO departments (department_id, department_name) VALUES
(1, 'HR'),
(2, 'Engineering'),
(3, 'Sales'),
(4, 'Finance'),
(5, NULL);

INSERT INTO employees (employee_id, department_id) VALUES
(101, 1),
(102, 2),
(103, 2),
(104, 3),
(105, 4),
(106, 2),
(107, 1);


SELECT D.department_name,count(E.employee_id) as employee_count FROM departments D
left outer join employees E
on D.department_id = E.department_id
group by D.department_name;