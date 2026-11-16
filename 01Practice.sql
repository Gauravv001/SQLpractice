/*
You need to retrieve the names and salaries of employees from the employees table, but only for those working in the
Finance department.

Question:
How would you use the SELECT statement with a WHERE clause to retrieve specific data based on a condition?

The SELECT statement is used to query specific columns
from a table and retrieve data based on certain conditions.

The WHERE clause filters the rows returned by the
query, ensuring only records meeting the specified criteria
are included in the result set. 

In this case, we want only the
employees working in the Finance department.
*/

-- Table Structure:
DROP TABLE IF EXISTS employees;
CREATE TABLE employees(
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

-- insert sample data
INSERT INTO employees (employee_id, first_name, last_name, department, salary) VALUES
(1, 'Alice', 'Smith', 'Finance', 60000),
(2, 'Bob', 'Johnson', 'General', 55000);
SELECT first_name,last_name,salary
FROM employees
WHERE department = 'Finance';

SELECT * FROM EMPLOYEES;