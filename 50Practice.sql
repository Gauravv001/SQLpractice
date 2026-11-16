/*
Scenario: Creating a view to show high-earning employees
*/

-- Add your SQL practice code here
/*A View is a virtual table based on the result of a SQL query. It doesn't store data itself; it stores the query.

CREATE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition;
*/

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10,2)
);

INSERT INTO employees
VALUES
(1,'Alice',101,50000),
(2,'Bob',102,60000),
(3,'Charlie',101,70000),
(4,'David',103,80000);

CREATE VIEW tempv AS
SELECT * 
FROM employees
WHERE salary > '60000';

SELECT * FROM tempv;

A View is a virtual table created from a SQL query. 
It does not store data physically; 
instead, it retrieves data from the underlying table(s) whenever it is queried. 

Views are commonly used for security, abstraction, and simplifying complex queries.

