-- Practice file 82
/*

Scenario: Using Common Table Expressions (CTE) for Modular Queries 
Question: How can you use a CTE to write modular queries in the employees table?

*/

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

INSERT INTO employees VALUES
(1, 'John Doe', 'IT', 75000),
(2, 'Jane Smith', 'HR', 68000),
(3, 'Michael Johnson', 'Finance', 82000),
(4, 'Emily Davis', 'IT', 59000),
(5, 'David Brown', 'IT', 91000),
(6, 'Sarah Wilson', 'Sales', 72000);


-- without CTE your query becomes bulkier
SELECT *
FROM (
    SELECT *
    FROM employees
    WHERE salary > 70000
) x
WHERE department = 'IT';


-- with cte it looks more cleaner
WITH CTE as (
    select * from employees
    where salary > 70000
)

select * from cte
where department = 'IT';


/*
How Long Does a CTE Exist?

Only for the next query.

Query Starts
↓
CTE Created
↓
Query Ends
↓
CTE Gone

Unlike a table, it is not stored permanently.

*/

| Feature              | CTE | Temporary Table |
| -------------------- | --- | --------------- |
| Permanent            | ❌   | ❌               |
| Exists for one query | ✅   | ❌               |
| Exists for session   | ❌   | ✅               |
| Improves readability | ✅   | Somewhat        |
| Can be recursive     | ✅   | ❌               |


/*

A CTE (Common Table Expression) is a temporary named result set defined using the WITH clause. 
It helps break complex SQL queries into smaller, more readable and reusable steps, improving modularity and maintainability.

*/



