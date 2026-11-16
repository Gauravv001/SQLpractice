/*
Scenario: Managing failed transactions with ROLLBACK
*/

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10,2)
);

INSERT INTO employees VALUES
(1,'Alice',102,55000),
(2,'John',103,57000);

SELECT * FROM employees;

BEGIN;

-- Update salaries
UPDATE employees
SET salary = salary + 5000
WHERE employee_id = 1;

-- Check data inside transaction
SELECT * FROM employees;

ROLLBACK;

-- Check data after rollback
SELECT * FROM employees;