-- Practice file 81
/*

Scenario: Using Window Functions to Calculate Running Totals

Question: How can you calculate a running total of salaries for
employees ordered by their hire date?

A window function calculates cumulative totals within a specific
partition or order. In this case, the running total of salaries is
calculated based on hire_date

*/
-- How can you calculate a running total of salaries ordered by hire date?

SELECT salary,
        sum(salary)
        OVER(order by hire_date) as running_sum
FROM employees;

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    hire_date DATE,
    salary DECIMAL(10,2)
);

INSERT INTO employees VALUES
(1, 'John Doe', '2023-01-15', 50000),
(2, 'Jane Smith', '2023-02-10', 60000),
(3, 'Michael Johnson', '2023-03-05', 55000),
(4, 'Emily Davis', '2023-04-20', 70000),
(5, 'David Brown', '2023-05-18', 65000);