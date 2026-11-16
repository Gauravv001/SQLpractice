/*
You need to assign unique IDs to each
result row, grouped by department and
ordered by salary.
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

/*
Question:
How can you use ROW_NUMBER() with PARTITION BY?

ROW_NUMBER() assigns a unique number to each row,
and PARTITION BY ensures the numbering resets for each
department
*/

SELECT first_name,department, ROW_NUMBER() over(PARTITION BY department ORDER BY salary DESC) AS unique_id
FROM employees;
