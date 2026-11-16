/*
You need to increase the salary of all
employees in the IT department by 10%

10%

Question:
How would you use the UPDATE statement to modify
existing records?

The UPDATE statement modifies existing rows in a table.
You use the SET clause to specify the column(s) to be
updated and the WHERE clause to target specific rows. In
this case, we increase the salary of all employees in the IT
department by 10%.

*/
DROP TABLE IF EXISTS employees;

CREATE TABLE employees(
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary VARCHAR(50) NOT NULL
)

INSERT INTO employees (employee_id, first_name, last_name, department, salary) VALUES
(1, 'Alice', 'Smith', 'IT', 50000),
(2, 'Bob', 'Johnson', 'IT', 60000);

-- SELECT
SELECT * FROM employees;

-- update salary by 10%
UPDATE employees
SET salary = salary*1.10
WHERE department = 'IT';