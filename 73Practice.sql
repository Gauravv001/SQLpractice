-- Practice file 73
/*
Scenario: Creating a foreign key relationship between two tables

Question: How do you create a foreign key relationship where the
department_id column in the employees table references the
departments table?

The FOREIGN KEY constraint ensures that data in the employees
table's department_id column corresponds to valid entries in the
departments table

*/


DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;


CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    department VARCHAR(50) NOT NULL
);

CREATE TABLE departments(
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    CONSTRAINT FK
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);


