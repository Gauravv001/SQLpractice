-- 108Practice.sql
-- New practice SQL file created.

-- Scenario: Rank employees across the
-- organization based on their salaries.
-- Question: How can you use the RANK() function to assign ranks to
-- employees across the entire organization based on salary?
-- The RANK() function assigns identical ranks to rows with equal
-- values. If there are ties, it leaves gaps in the sequence. This is
-- useful for identifying overall leaders in performance or earnings,
-- accounting for ties without disrupting the rank logic

-- Rank employees across the entire organization based on salary.


-- Write your SQL here.
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10,2)
);

INSERT INTO employees VALUES
(1,'John Doe',101,90000),
(2,'Jane Smith',101,80000),
(3,'Michael Johnson',102,80000),
(4,'Emily Davis',102,70000),
(5,'David Brown',103,60000),
(6,'Sarah Wilson',101,50000);


SELECT *, RANK() OVER(ORDER BY salary DESC) rnk
FROM employees;
