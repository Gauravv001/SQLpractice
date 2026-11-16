/*
You need to find all employees who have
not submitted their projects.
*/

/*Question:
How can you use LEFT JOIN and IS NULL to find unmatched
rows?
A LEFT JOIN helps find rows in one table that have no
matching rows in another.
You need to find all employees who have
not submitted their projects.*/

drop table employees;

-- Table Structure:
CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50)
);

drop table project_submissions;
CREATE TABLE project_submissions (
    submission_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

INSERT INTO employees (first_name) VALUES
('Amit'),
('Neha'),
('Ravi'),
('Priya'),
('Karan'),
('Sneha'),
('Arjun'),
('Pooja');


INSERT INTO project_submissions (employee_id) VALUES
(1), (1),
(2),
(3),
(4), (4), (4),
(6),
(7), (7),
(8);


select * from employees;

select * from project_submissions;

SELECT e.first_name 
FROM employees e
LEFT JOIN project_submissions ps
ON e.employee_id = ps.employee_id
WHERE ps.employee_id is NULL; 
