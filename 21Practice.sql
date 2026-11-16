/*
You want to generate a list of employees with their total annual bonuses. 
Bonuses are 10% of their salary.
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

-- select query
/*
Question:
How can you use arithmetic operators to calculate derived values?
The * operator allows you to calculate the annual bonus as 10% of the employee's salary.
*/

SELECT 
        first_name,
        last_name,
        salary,
        (salary*0.10) as total_annual_Bonus
FROM employees;