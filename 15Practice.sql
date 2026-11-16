/*
    You need to create a list of employees who belong to either the Finance or IT department.
*/

-- DROP TABLE employees;

CREATE TABLE employees(
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) 
 );

INSERT INTO employees(first_name,last_name,department,salary) VALUES
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

SELECT count(1) FROM employees;

/*
Question: How can you use the IN operator to filter multiple values?
--> The IN operator allows filtering a column against multiple values. 
In this scenario, it ensures only employees from the Finance or IT departments are retrieved.
*/

SELECT first_name,department
FROM employees
WHERE department IN ('Finance', 'IT')
ORDER BY first_name;