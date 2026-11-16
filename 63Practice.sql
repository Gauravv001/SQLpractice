-- Practice file 63
/*
Scenario: Creating a materialized view for performance optimization

Question: How would you create a materialized view to store high
salary employees?

*/


DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2),
    department VARCHAR(50)
);

INSERT INTO employees VALUES
(1, 'John Doe', 75000.00, 'IT'),
(2, 'Jane Smith', 68000.00, 'HR'),
(3, 'Michael Johnson', 120000.00, 'Finance'),
(4, 'Emily Davis', 59000.00, 'Marketing'),
(5, 'David Brown', 150000.00, 'IT'),
(6, 'Sarah Wilson', 72000.00, 'Sales'),
(7, 'Chris Taylor', 110000.00, 'HR'),
(8, 'Jessica Anderson', 61000.00, 'Finance'),
(9, 'Daniel Thomas', 130000.00, 'IT'),
(10, 'Sophia Moore', 70000.00, 'Marketing');

-- mysql doesn't support M veiw 

/*
A materialized view stores the result of a query physically on disk, unlike a normal view which stores only the query definition. 
It is used to improve performance for frequently executed and expensive queries. For example, 
we can create a materialized view containing employees with salaries greater than 100,000 and 
periodically refresh it to keep the data up to date.
*/

CREATE MATERIALIZED VIEW high_salary_employees AS
SELECT
    employee_id,
    emp_name,
    salary,
    department
FROM employees
WHERE salary > 100000;


-- Refreshing a Materialized View
REFRESH MATERIALIZED VIEW high_salary_employees;