-- question 1: 
-- employee_filtering


-- You are given an employees table containing employee information.


-- create table

DROP table employees ;

CREATE TABLE employees(
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    city VARCHAR(50)
);

INSERT INTO employees
    (employee_id, employee_name, department, salary, city)
VALUES
    (101, 'Amit',  'IT',      70000, 'Delhi'),
    (102, 'Rahul', 'HR',      55000, 'Mumbai'),
    (103, 'Priya', 'IT',      85000, 'Delhi'),
    (104, 'Neha',  'Finance', 75000, 'Pune'),
    (105, 'Karan', 'IT',      60000, 'Gurgaon'),
    (106, 'Sneha', 'HR',      65000, 'Delhi');


SELECT * FROM employees;

-- emp from IT dept whose salary is greater than 60,000 

SELECT employee_id, employee_name, salary
FROM employees
WHERE department = 'IT'
AND salary > 60000;



/*
 
Find employees who are either 
from the IT department OR have a salary greater than 70,000.

*/


SELECT employee_id, employee_name, salary
FROM employees
WHERE department = 'IT' OR salary > 70000;



/*
Find employees 
who are from IT or HR, AND have a salary greater than 60,000.

*/

SELECT employee_id, employee_name, salary
FROM employees
WHERE  (department = 'IT' OR department = 'HR')
AND salary > 70000;


/*
DISTINCT employees
*/

SELECT DISTINCT department
FROM employees;


/*
What is the difference 
between DISTINCT and GROUP BY? Can you achieve the same result using GROUP BY?
*/

Select department
FROM employees
GROUP BY department;

/*
DISTINCT = remove duplicates and give you unique values. 

Key point: DISTINCT treats all NULL occurrences as one distinct result value.

So even if you have 100 NULLs, you'll get one NULL row.

GROUP BY = create groups + calculate something (based upon some aggregation).
GROUP BY puts all rows where department IS NULL into the same group.


*/



/*

Question3: 
You are analyzing employee compensation and 
want to identify the 3 highest-paid employees.
*/


Select employee_id, employee_name, salary
FROM employees 
ORDER BY salary DESC
limit 3;

/*
What if two employees have the same salary? I want all employees who fall within the top 3 salary levels
, not just 3 employees. How would you solve that?
*/

with ranked_salary as (
    Select employee_id, employee_name, salary,
DENSE_RANK() OVER (ORDER BY salary DESC) as salary_rank
FROM employees 
)

SELECT * from ranked_salary
Where salary_rank <= 3;





-- 1. second highest salary 

-- 1. Create table
CREATE TABLE employees (
    emp_id      INT PRIMARY KEY,
    emp_name    VARCHAR(50),
    department  VARCHAR(50),
    salary      INT
);

-- 2. Insert sample data (includes duplicate salaries on purpose, to test DISTINCT)
INSERT INTO employees (emp_id, emp_name, department, salary) VALUES
(1, 'Aarav Mehta',     'Engineering', 95000),
(2, 'Priya Nair',      'Engineering', 88000),
(3, 'Rohan Gupta',     'Sales',       72000),
(4, 'Sneha Iyer',      'Marketing',   65000),
(5, 'Karan Verma',     'Engineering', 95000),   -- duplicate of highest
(6, 'Anita Desai',     'Sales',       72000),   -- duplicate
(7, 'Vikram Singh',    'HR',          58000),
(8, 'Divya Kapoor',    'Engineering', 99000),   -- actual highest
(9, 'Rahul Chawla',    'Marketing',   65000),   -- duplicate
(10,'Meera Pillai',    'Sales',       81000);


SELECT * FROM employees;

-- Write a SQL query to find the second-highest distinct salary from the employees table.

SELECT max(salary) FROM employees
WHERE salary < (
    SELECT max(salary) 
FROM employees
);


-- better approach 
WITH salaries as(
    SELECT salary,
    DENSE_RANK() OVER (ORDER BY salary DESC) as ranked_salary
    FROM employees
)

SELECT DISTINCT SALARY 
FROM salaries
WHERE ranked_salary = 2;


/*
Difference between ROW_NUMBER(), DENSE_RANK() and RANK() ??

ROW_NUMBER() — "just number every row 1, 2, 3... no ties allowed, ever."
RANK() — "ties share a rank, but leaves a gap afterward, like Olympic medal rankings — two golds means no silver, next is bronze."
DENSE_RANK() — "ties share a rank, no gap afterward — most useful for 'Nth highest distinct value' problems."
 
*/


DROP TABLE employees;

-- 1. Create table
CREATE TABLE employees (
    emp_id      INT PRIMARY KEY,
    emp_name    VARCHAR(50),
    department  VARCHAR(50),
    salary      INT
);

-- 2. Insert sample data — 5-6 employees per department, with a tie in Engineering
INSERT INTO employees (emp_id, emp_name, department, salary) VALUES
-- Engineering (6 employees, includes a tie at 95000)
(1,  'Aarav Mehta',   'Engineering', 99000),
(2,  'Priya Nair',    'Engineering', 95000),
(3,  'Karan Verma',   'Engineering', 95000),
(4,  'Divya Kapoor',  'Engineering', 88000),
(5,  'Rohan Gupta',   'Engineering', 82000),
(6,  'Sneha Iyer',    'Engineering', 75000),
(7,  'Vikram Singh',  'Sales', 90000),
(8,  'Anita Desai',   'Sales', 85000),
(9,  'Meera Pillai',  'Sales', 80000),
(10, 'Rahul Chawla',  'Sales', 72000),
(11, 'Ishaan Kapoor', 'Sales', 68000),
(12, 'Neha Joshi',    'Marketing', 78000),
(13, 'Aditya Rao',    'Marketing', 71000),
(14, 'Simran Kaur',   'Marketing', 65000),
(15, 'Yash Malhotra', 'Marketing', 60000),
(16, 'Kavita Menon',  'HR', 58000),
(17, 'Arjun Bhatt',   'HR', 55000);


with highese_paid_emp as(
    SELECT *,
    ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary desc)
    as Top_highest_salaries
    FROM employees
)

SELECT * FROM highese_paid_emp
WHERE Top_highest_salaries <= 3 ;


--3. Find employees earning more than their department average


SELECT *
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees e2
    WHERE e2.department = e.department
);



CREATE TABLE employees_nulls (
    emp_id      INT PRIMARY KEY,
    emp_name    VARCHAR(50),
    department  VARCHAR(50),
    salary      INT,
    manager_id  INT,
    bonus       INT
);

INSERT INTO employees_nulls (emp_id, emp_name, department, salary, manager_id, bonus) VALUES
(1,  'Aarav Mehta',   'Engineering', 99000, 5,    10000),
(2,  'Priya Nair',    'Engineering', 95000, 5,    NULL),   -- no bonus given
(3,  'Karan Verma',   'Engineering', 95000, NULL, 5000),   -- no manager (top of hierarchy)
(4,  'Divya Kapoor',  NULL,          88000, 1,    NULL),   -- department not recorded
(5,  'Rohan Gupta',   'Engineering', NULL,  NULL, NULL),   -- salary not disclosed, is the top manager
(6,  'Sneha Iyer',    'Sales',       75000, 7,    2000),
(7,  'Vikram Singh',  'Sales',       90000, NULL, NULL),   -- department head, no bonus
(8,  'Anita Desai',   'Marketing',   NULL,  9,    1500),   -- salary missing
(9,  'Meera Pillai',  'Marketing',   80000, NULL, NULL);


SELECT e1.emp_name, e2.emp_name AS manager
FROM employees_nulls e1
INNER JOIN employees_nulls e2 ON e1.manager_id = e2.emp_id;


CREATE TABLE T1 (value INT);
CREATE TABLE T2 (value INT);

INSERT INTO T1 VALUES
(1),
(0),
(0),
(1);

INSERT INTO T2 VALUES
(1),
(0),
(1);


SELECT *
FROM T1 t1
LEFT JOIN T2 t2
ON t1.T1 = t2.T2;