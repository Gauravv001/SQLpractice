-- Practice file 61
/*
Scenario: Identifying employees with the same salary

Question: How would you find employees earning the same salary?
Use GROUP BY with HAVING to filter groups with more than one
employee sharing the same salary.
*/

-- Create Table
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2),
    department VARCHAR(50)
);

-- Insert Dummy Data
INSERT INTO employees VALUES
(1, 'John Doe', 75000.00, 'IT'),
(2, 'Jane Smith', 68000.00, 'HR'),
(3, 'Michael Johnson', 75000.00, 'Finance'),
(4, 'Emily Davis', 59000.00, 'Marketing'),
(5, 'David Brown', 91000.00, 'IT'),
(6, 'Sarah Wilson', 68000.00, 'Sales'),
(7, 'Chris Taylor', 66000.00, 'HR'),
(8, 'Jessica Anderson', 59000.00, 'Finance'),
(9, 'Daniel Thomas', 88000.00, 'IT'),
(10, 'Sophia Moore', 75000.00, 'Marketing');

SELECT salary,COUNT(*) from employees
group by salary
having COUNT(*) > 1;


-- employee count
SELECT *
FROM employees
WHERE salary IN (
    SELECT salary
    FROM employees
    GROUP BY salary
    HAVING COUNT(*) > 1
);

Interview Tip:

If the interviewer says: "Find employees with the same salary."
Ask: "Do you want the employee pairs, the duplicate salary values, or all employee records involved in duplicate salaries?"

