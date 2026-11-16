/*
You need to filter employees with salaries between 30,000 and 60,000.

Question:
How can you use comparison operators to filter records based on a salary range?
Comparison operators such as >= and <= can filter rows
based on specific ranges. The AND operator combines these
conditions, ensuring both are satisfied

*/

DROP TABLE IF EXISTS employees;

CREATE TABLE employees(
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2)
);
INSERT INTO employees (first_name, last_name, department, salary) VALUES
('Alice','Smith','Finance',62000),
('Bob','Johnson','IT',75000),
('Charlie','Brown','Marketing',58000),
('David','Wilson','IT',82000),
('Eva','Davis','HR',24000),
('Frank','Miller','Finance',71000),
('Grace','Taylor','Sales',67000),
('Hannah','Anderson','IT',90000),
('Ian','Thomas','Marketing',60000),
('Julia','Moore','Sales',65000),
('Kevin','Martin','Finance',73000),
('Laura','Jackson','HR',56000);
select * from employees;

SELECT first_name,last_name,salary 
FROM employees
WHERE salary >= 30000 AND salary <= 60000;


-- 👉 BETWEEN is inclusive
SELECT first_name,last_name,salary 
FROM employees
WHERE salary BETWEEN 30000 AND 60000;