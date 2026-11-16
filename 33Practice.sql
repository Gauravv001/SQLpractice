/*
You want to update multiple columns
for an employee in one query.

Question:
How can you use the UPDATE statement to modify multiple
columns?
*/

-- Add your SQL practice code here
DROP TABLE employees;

Create table employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    salary INT NOT NULL,
    department VARCHAR(50) NOT NULL
);


INSERT INTO employees (employee_id, first_name,salary,department) VALUES 
(1,'Alice',70000,'sales')
;

SELECT * FROM employees ;

UPDATE employees
SET salary = 75000, department = 'IT'
WHERE employee_id = '1'; 

-- This query updates Alice’s salary and department.