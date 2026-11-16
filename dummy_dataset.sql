/*
Dummy dataset for SQL practice
Includes departments, employees, projects, and employee_projects
*/

DROP TABLE IF EXISTS employee_projects;
DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department_id INT REFERENCES departments(department_id),
    salary INT NOT NULL,
    hire_date DATE
);

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    start_date DATE,
    end_date DATE
);

CREATE TABLE employee_projects (
    employee_id INT REFERENCES employees(employee_id),
    project_id INT REFERENCES projects(project_id),
    role VARCHAR(50),
    PRIMARY KEY (employee_id, project_id)
);

INSERT INTO departments (department_id, department_name) VALUES
(101, 'Engineering'),
(102, 'Sales'),
(103, 'HR');

INSERT INTO employees (employee_id, first_name, last_name, department_id, salary, hire_date) VALUES
(1, 'Alice', 'Smith', 101, 90000, '2018-03-12'),
(2, 'Bob', 'Johnson', 101, 80000, '2019-07-01'),
(3, 'Charlie', 'Lee', 102, 75000, '2020-01-15'),
(4, 'David', 'Kim', 103, 65000, '2017-10-30'),
(5, 'Eva', 'Brown', 102, 70000, '2021-05-20'),
(6, 'Frank', 'Garcia', 101, 88000, '2016-11-02'),
(7, 'Grace', 'Martinez', 103, 60000, '2022-02-14'),
(8, 'Helen', 'Davis', 101, 95000, '2015-06-25'),
(9, 'Ian', 'Miller', 102, 72000, '2019-09-10'),
(10, 'Jane', 'Wilson', 103, 68000, '2020-12-01');

INSERT INTO projects (project_id, project_name, start_date, end_date) VALUES
(201, 'Website Redesign', '2022-01-10', '2022-06-30'),
(202, 'CRM Migration', '2021-03-01', '2021-12-15'),
(203, 'Mobile App', '2023-02-01', NULL),
(204, 'Recruiting Drive', '2022-08-01', '2022-11-30'),
(205, 'Q4 Sales Push', '2022-10-01', '2022-12-31');

INSERT INTO employee_projects (employee_id, project_id, role) VALUES
(1, 201, 'Lead Developer'),
(2, 201, 'Developer'),
(6, 201, 'Architect'),
(2, 202, 'Developer'),
(3, 202, 'Sales Lead'),
(5, 205, 'Account Manager'),
(9, 205, 'Sales Rep'),
(4, 204, 'HR Coordinator'),
(7, 204, 'Recruiter'),
(8, 203, 'Mobile Lead');

-- Example queries
-- SELECT * FROM employees;
-- SELECT e.first_name, e.salary, d.department_name FROM employees e JOIN departments d USING (department_id);
-- SELECT p.project_name, COUNT(ep.employee_id) AS members FROM projects p LEFT JOIN employee_projects ep ON p.project_id = ep.project_id GROUP BY p.project_name;