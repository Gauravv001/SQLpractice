-- Practice file 66
/*

Scenario: Implementing soft deletes using a status column
Question: How would you implement a soft delete for employees?
Instead of physically deleting rows, soft deletes mark records as
inactive using a status column.

*/


DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY, 
    emp_name VARCHAR(50),
    salary DECIMAL(10,2),
    status VARCHAR(20)
);

INSERT INTO employees VALUES
(1, 'John Doe', 75000.00, 'ACTIVE'),
(2, 'Jane Smith', 68000.00, 'ACTIVE'),
(3, 'Michael Johnson', 82000.00, 'ACTIVE'),
(4, 'Emily Davis', 59000.00, 'ACTIVE'),
(5, 'David Brown', 91000.00, 'ACTIVE');


UPDATE employees
SET status = 'INACTIVE'
WHERE employee_id  = 2;


select * from employees;