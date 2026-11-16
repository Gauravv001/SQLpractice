-- -- Scenario: Setting a default value for a column
/* Question: How would you set a default value of 0 for the salary
column?
Setting a default value ensures that if no value is provided during
an insert, the column will automatically be assigned the default.
For Example: */

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10,2)
);


INSERT INTO employees (employee_id, employee_name, department_id, salary)
VALUES
(1, 'Alice', 101, 50000),
(2, 'Bob', 101, 60000),
(3, 'Charlie', 101, 70000),

(4, 'David', 102, 55000),
(5, 'Eva', 102, 65000),
(6, 'Frank', 102, 75000),

(7, 'Grace', 103, 80000),
(8, 'Helen', 103, 85000),
(9, 'Ian', 103, 90000);

ALTER TABLE employees
ADD COLUMN emp_age INT NOT NULL DEFAULT 0;

ALTER TABLE employees
  ALTER COLUMN emp_age SET DEFAULT 25;

/*
Scenario: Dropping a default value from a
column
Table Structure Before:
Question: How can you remove the default value from the salary
column?
*/


    SELECT * FROM employees;

ALTER TABLE employees
ALTER COLUMN emp_age DROP DEFAULT;

ALTER TABLE employees 
DROP emp_age ;