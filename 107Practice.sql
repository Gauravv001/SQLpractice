-- 107Practice.sql
-- New practice SQL file created.

-- Scenario: Assign unique row numbers to
-- employees within each department based
-- on their salaries.
-- Question: How can you assign unique row numbers to employees
-- in each department using the ROW_NUMBER() function?
-- The ROW_NUMBER() function generates a unique sequential
-- number for each row in a result set. Using PARTITION BY allows
-- resetting the row number for each partition (in this case, each
-- department). This is particularly useful when ranking employees or
-- generating identifiers within a department, especially for ordered
-- datasets such as salaries.


-- Write your SQL here.

SELECT *,
      ROW_NUMBER() OVER(PARTITION BY department_id ORDER BY salary DESC) as rw_no
    FROM employees;

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
(3,'Michael Johnson',101,80000),
(4,'Emily Davis',102,70000),
(5,'David Brown',102,60000),
(6,'Sarah Wilson',102,50000);


