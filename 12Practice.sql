/* 
    You want to calculate the total salary for each department
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
How can you use the GROUP BY clause to aggregate data?
--> The GROUP BY clause groups rows with the same values, allowing aggregate functions like SUM() to be applied to each
group. 

In this scenario, we group employees by department and calculate the total salary for each department.
*/
SELECT 
    department,
    sum(salary) as total_salary -- aggregate functions like SUM()
FROM employees
GROUP BY department
ORDER BY total_salary desc;