-- Scenario: Adding a foreign key constrain to a table

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

drop table if exists departments;
drop table if exists employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    department_id INT, CONSTRAINT fk_employees_department
    FOREIGN KEY (department_id)
    REFERENCES departments(department_id)
);

SELECT  * FROM EMPLOYEES;

CREATE TABLE child_table (
    column_name datatype,
    
    CONSTRAINT fk_name
    FOREIGN KEY (column_name)
    REFERENCES parent_table(parent_column)
);