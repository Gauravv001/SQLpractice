/*
You want to calculate the cumulative salary for employees ordered by department.
*/

-- Add your SQL practice code here
Question:
How can you use SUM() with OVER() to compute cumulative
totals?
The SUM() function with OVER() computes a running total
for each row within a partition.




-- Add your SQL practice code here
DROP TABLE employees;

Create table employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    salary INT NOT NULL,
    department VARCHAR(50) NOT NULL
);


INSERT INTO employees (employee_id, first_name,salary,department) VALUES 
(1,'Alice',60000,'IT'),
(2,'Bob',70000,'IT'),
(3,'Charle',50000,'HR')
;


SELECT department,first_name, sum(salary) OVER(partition by department order by salary) as cum_sum_salary
from employees;