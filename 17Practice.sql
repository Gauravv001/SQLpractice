/*
    You need to find employees who don’t belong to the HR department.
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

SELECT count(1) FROM employees; -- 12

/*

Question: How can you use the NOT IN operator to exclude certain values?
--> The NOT IN operator excludes rows where the column value matches any value in a specified list. In this case, it filters out employees from the HR department.

*/
-- don't belongs to 'HR' department
SELECT first_name,department
FROM employees
WHERE Department NOT IN ('HR');

SELECT first_name,department
FROM employees
WHERE Department != 'HR';