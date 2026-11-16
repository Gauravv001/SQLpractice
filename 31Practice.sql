/*
You need to compare two columns in the
same table to find discrepancies.

Question:
How can you compare two columns within the same table
using SQL?
*/

-- Add your SQL practice code here
DROP TABLE employees;

Create table employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    salary INT NOT NULL,
    expected_salary INT NOT NULL
);


INSERT INTO employees (employee_id, first_name,salary,expected_salary) VALUES 
(1,'Alice',80000,85000),
(2,'Bob',95000,95000);

/*SQL allows you to compare two columns using the WHERE
clause. This is helpful for checking if values in two columns
differ, such as salary and expected_salary.*/

Select * from employees 
where salary <> expected_salary ;