/*
You need to delete duplicate rows from
a table, keeping only one instance of
each duplicate.
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
('Alice','Smith','Finance',62000),
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
How can you identify and remove duplicate rows using ROW_NUMBER()?
--> Using ROW_NUMBER() with PARTITION BY, you can mark duplicate rows and delete them by keeping only the first occurrence.
*/

WITH CTE AS (
    SELECT *, ROW_NUMBER() OVER(PARTITION BY first_name,department ORDER BY employee_id) as rw_number
FROM employees
)
DELETE FROM employees
WHERE employee_id IN (SELECT employee_id FROM CTE WHERE rw_number > 1);