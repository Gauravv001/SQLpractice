/*
Ensuring all employees have unique email addresses
*/

-- Add your SQL practice code here

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    email VARCHAR(50) UNIQUE
);

INSERT INTO employees (employee_id,email) VALUES
(1,'ABC@gmail.com'),
(2,'AB@gmail.com')
; 