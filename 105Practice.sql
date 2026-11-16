-- 105Practice.sql
-- First Understand the Problem

-- Suppose your manager asks:

-- 1. Give me department-wise salary totals

-- 2. Give me location-wise salary totals

-- 3. Give me department+location salary totals

-- Without GROUPING SETS, you'd write:

-- Query 1

-- UNION ALL

-- Query 2

-- UNION ALL

-- Query 3

-- GROUPING SETS does all of this in one query.

-- Write your SQL here.
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    location VARCHAR(50),
    salary DECIMAL(10,2)
);

INSERT INTO employees VALUES
(1, 'John Doe', 'IT', 'Delhi', 50000),
(2, 'Jane Smith', 'IT', 'Mumbai', 60000),
(3, 'Michael Johnson', 'HR', 'Delhi', 40000),
(4, 'Emily Davis', 'HR', 'Mumbai', 45000),
(5, 'David Brown', 'Finance', 'Delhi', 70000);


-- normal group by 
 
-- Departments totals

SELECT department, SUM(salary)
FROM employees
GROUP BY department;

-- group by based on location

SELECT location, SUM(salary)
FROM employees
GROUP BY location;

-- department + location

SELECT department,location, SUM(salary)
FROM employees
GROUP BY department,location;


-- GROUPING SETS SOLUTION

SELECT
    department,
    location,
    SUM(salary) AS total_salary
FROM employees
GROUP BY GROUPING SETS
(
    (department),
    (location),
    (department, location)
);