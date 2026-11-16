/*
You want to check if there are employees earning more than 100,000.
*/

Question:
How can you use the EXISTS clause to verify the presence of
specific records?
The EXISTS clause checks if a subquery returns any rows.


-- Add your SQL practice code here
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    salary DECIMAL(10,2)
);

INSERT INTO employees (employee_id, employee_name, salary) VALUES
(1, 'Alice', 75000),
(2, 'Bob', 85000),
(3, 'Charlie', 95000),
(4, 'David', 105000),
(5, 'Eva', 120000),
(6, 'Frank', 98000),
(7, 'Grace', 110000),
(8, 'Helen', 67000);


SELECT count(employee_id) 
FROM employees 
WHERE salary > '100000';

-- ALTERNATIVE WAY OF DOING IT 
SELECT EXISTS (SELECT 1 FROM employees WHERE salary > '100000'); 


SELECT CASE
         WHEN EXISTS (
             SELECT 1
             FROM employees
             WHERE salary > 100000
         )
         THEN 'Yes'
         ELSE 'No'
       END AS employees_above_100k;



Why EXISTS is often preferred?

If your goal is simply to know whether at least one employee exists, EXISTS is usually faster on 
large datasets because the database can stop searching as soon as it finds the first matching row, 
whereas COUNT(*) typically counts all matching rows.