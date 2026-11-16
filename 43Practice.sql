/*
Inserting multiple rows at once

Question:
How would you add multiple employees to the employees
table?
*/

-- Add your SQL practice code here

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10,2)
);


INSERT INTO employees (employee_id,employee_name,department_id,salary) VALUES
(1,'Alice',102,55000),
(2,'John',103,57000)
;

select * from employees ; 