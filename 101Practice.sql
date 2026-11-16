-- 101Practice.sql
/*
Scenario: Updating Employee Bonuses Using a CASE Statement

Question: How can you update employee bonuses based on their salary using a CASE statement?

The CASE statement in SQL allows you to apply conditional logic inside a query. It evaluates conditions and returns specific values based on the result of those conditions. 
You can use it in UPDATE queries to assign different bonuses based on salary ranges..

*/


-- Write your SQL here.
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2),
    bonus DECIMAL(10,2)
);

INSERT INTO employees VALUES
(1, 'John Doe', 120000, NULL),
(2, 'Jane Smith', 85000, NULL),
(3, 'Michael Johnson', 65000, NULL),
(4, 'Emily Davis', 45000, NULL),
(5, 'David Brown', 30000, NULL);


-- Business Rule

-- Suppose HR says:

-- Salary >= 100000  → Bonus = 20000

-- Salary >= 70000   → Bonus = 10000

-- Salary >= 50000   → Bonus = 5000

-- Otherwise         → Bonus = 2000



UPDATE employees
SET Bonus = CASE
                    WHEN salary >= 100000 THEN 20000
                WHEN salary >= 70000 THEN 10000
    WHEN salary >= 50000 THEN 5000
ELSE 2000
END;



SELECT * FROM employees;