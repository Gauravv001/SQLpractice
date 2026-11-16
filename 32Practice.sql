/*
You need to identify duplicate employee
names in the employees table.

Question:
How can you use GROUP BY and HAVING to find duplicate
entries?
The GROUP BY clause groups rows with identical values,
and the HAVING clause filters groups with more than one
row.
*/

-- Add your SQL practice code here
DROP TABLE employees;

Create table employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL
);


INSERT INTO employees (employee_id, first_name,department) VALUES 
(1,'Alice','IT'),
(2,'Alice','HR'),
(3,'Bob','Finance')
;

Select first_name,count(1) from employees 
Group by first_name
Having count(1) > 1 ;