-- Practice file 83
/*


Scenario: Performing Conditional Updates with Case Statements
Question: How would you update employees' salaries based on
their performance rating using a CASE statement?

The CASE statement allows you to apply conditional logic within
SQL queries, such as updating salaries based on performance
ratings.

Business Rule

Suppose HR says:

Excellent → 20% hike
Good → 10% hike
Average → 5% hike

*/

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2),
    performance_rating VARCHAR(20)
);

INSERT INTO employees VALUES
(1, 'John Doe', 50000, 'Excellent'),
(2, 'Jane Smith', 60000, 'Good'),
(3, 'Michael Johnson', 55000, 'Average'),
(4, 'Emily Davis', 70000, 'Excellent'),
(5, 'David Brown', 65000, 'Good');


SELECT emp_name,salary as prev_salary,performance_rating,
    CASE 
        WHEN performance_rating = 'Excellent' THEN salary * 1.2
        WHEN performance_rating = 'Good' THEN salary * 1.1
        WHEN performance_rating = 'Average' THEN salary * 0.5
        ElSE salary 
    END AS salary_increment

FROM employees
;


-- ((salary_increment - prev_Salary)/prev_salary) * 100 as percentage_change