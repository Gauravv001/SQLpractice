/*
You need to retrieve the top 5 highest-paid
employees from the employees table

*/
DROP TABLE employees;

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
Question:
How would you use the ORDER BY and LIMIT clauses to get the top records?
--> The ORDER BY clause sorts the data, and the LIMIT clause restricts the number of rows returned. 
--> To retrieve the top 5 highest-paid employees, you need to sort the salary in descending order and use LIMIT 5.
*/
-- top 5 highest salaries
SELECT first_name,last_name,salary
FROM employees
ORDER BY salary desc limit 5;