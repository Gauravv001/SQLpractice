-- Practice file 60
/*
cenario: Calculating running totals using a window function

Question: How would you calculate a running total of salaries?

*/

-- Running Total / Cumulative Sum questions.
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2)
);

-- Insert Dummy Data
INSERT INTO employees VALUES
(1, 'John Doe', 50000.00),
(2, 'Jane Smith', 60000.00),
(3, 'Michael Johnson', 55000.00),
(4, 'Emily Davis', 70000.00),
(5, 'David Brown', 65000.00),
(6, 'Sarah Wilson', 80000.00);


-- SUM(column_name) OVER (ORDER BY some_column)
SELECT emp_name,salary, sum(salary) Over(order by employee_id) as cummu_sum
From employees;