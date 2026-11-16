/*
You want to delete employees who don’t belong to a specified list of departments.
*/

-- Add your SQL practice code here
Question:
How can you use the NOT IN operator to filter and delete specific rows?
The NOT IN operator excludes rows matching any value in the
specified list.




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
(3,'Charile',50000,'HR'),  -- deleted
(4,'Martin',50000,'Finance');


DELETE FROM employees
where department NOT IN ('IT','Finance');

select * from employees;