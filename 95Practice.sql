-- Practice file 95
/*
Scenario: Using a Recursive CTE to
Generate Hierarchical Data
Question: How would you display employee hierarchies using a
recursive CTE?
A recursive CTE helps you retrieve hierarchical data, such as
managers and subordinates

*/

WITH RECURSIVE cte AS(
    select 1 as n 
    union all
    select n+1 from cte
    where n < 10 
)
select * from cte;


DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    manager_id INT
);

INSERT INTO employees VALUES
(1, 'John Doe', NULL),      -- CEO
(2, 'Jane Smith', 1),
(3, 'Michael Johnson', 1),
(4, 'Emily Davis', 2),
(5, 'David Brown', 2),
(6, 'Sarah Wilson', 2),
(7, 'Chris Taylor', 3),
(8, 'Jessica Anderson', 3),
(9, 'Daniel Thomas', 3),
(10, 'Sophia Moore', 1);


WITH RECURSIVE cte_emp AS(
    SELECT employee_id,emp_name,manager_id,1 as level
    FROM employees
    WHERE manager_id is NULL

    union all

    select e.employee_id,e.emp_name,e.manager_id,c.level +1
    from employees e
    inner join cte_emp c
    on e.manager_id = c.employee_id
)

SELECT * FROM cte_emp
;