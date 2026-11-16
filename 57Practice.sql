-- Practice file 57

/*
Scenario: Fetching the top N salaries
Resulting Table:

Question: How would you retrieve the top 2 highest salaries from
the employees table?
*/


SELECT * FROM EMPLOYEES
ORDER BY SALARY DESC
LIMIT 2;



WITH CTE AS (
    SELECT emp_name,
           salary,
           DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
    FROM employees
)
SELECT *
FROM CTE
WHERE rnk <= 2;


SELECT emp_name,MAX(SALARY) FROM employees
GROUP BY 1;

-- Create Table
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2),
    department_id INT
);

-- Insert Dummy Data
INSERT INTO employees (emp_name, salary, department_id) VALUES
('John Doe', 75000.00, 101),
('Jane Smith', 68000.00, 102),
('Michael Johnson', 95000.00, 101),
('Emily Davis', 59000.00, 103),
('David Brown', 91000.00, 101),
('Sarah Wilson', 72000.00, 104),
('Chris Taylor', 66000.00, 102),
('Jessica Anderson', 61000.00, 103),
('Daniel Thomas', 88000.00, 104),
('Sophia Moore', 70000.00, 102);