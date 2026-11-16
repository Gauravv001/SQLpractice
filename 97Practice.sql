-- Practice file 97
/*
Scenario: Ranking Employees Within Departments

Question: How can you rank employees by salary within their departments?

The RANK() function assigns ranks to employees within each department based on their salary

*/

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10,2)
);

INSERT INTO employees VALUES
(1, 'John Doe', 101, 75000),
(2, 'Jane Smith', 101, 90000),
(3, 'Michael Johnson', 101, 90000),
(4, 'Emily Davis', 102, 65000),
(5, 'David Brown', 102, 80000),
(6, 'Sarah Wilson', 102, 70000);


-- Rank employees by salary within each department.

SELECT  employee_id,
    emp_name,
    department_id,
    salary,
    RANK() OVER(PARTITION BY department_id ORDER BY salary desc) as rnk
FROM employees;
