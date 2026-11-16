/*
You need to add a new employee named John Doe to the employees table 
with a salary of 50,000 and a department of HR.

Question:
How can you use the INSERT statement to add a new record
to the employees table?

The INSERT statement allows you to add a new record to a
table by specifying the column names and corresponding
values. 
You must ensure that the values match the data types
and constraints (e.g., NOT NULL) defined in the table
*/
DROP TABLE IF EXISTS employees;

CREATE TABLE employees(
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2)
);

INSERT INTO employees(first_name,last_name,department,salary) VALUES
('John','Doe','HR',50000);

select * from employees;
