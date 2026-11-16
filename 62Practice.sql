-- Practice file 62
/*
Scenario: Handling NULL values in SQL

Question: How can you replace NULL salaries with a default value of 0 when retrieving data?
The COALESCE() function returns the first non-null value from a list, making it useful for replacing NULL values.

*/

-- Create Table
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2),
    department VARCHAR(50)
);

-- Insert Dummy Data (Some Salaries are NULL)
INSERT INTO employees VALUES
(1, 'John Doe', 75000.00, 'IT'),
(2, 'Jane Smith', NULL, 'HR'),
(3, 'Michael Johnson', 82000.00, 'Finance'),
(4, 'Emily Davis', NULL, 'Marketing'),
(5, 'David Brown', 91000.00, 'IT'),
(6, 'Sarah Wilson', 72000.00, 'Sales'),
(7, 'Chris Taylor', NULL, 'HR'),
(8, 'Jessica Anderson', 61000.00, 'Finance'),
(9, 'Daniel Thomas', NULL, 'IT'),
(10, 'Sophia Moore', 70000.00, 'Marketing');

-- COALESCE = "Give me the first non-NULL value"
SELECT emp_name,COALESCE(salary,'0') as salary
FROM employees;