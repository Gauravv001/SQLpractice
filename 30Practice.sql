/*
You need to find the second highest salary from the employees table.
*/

/*
Question: How can you retrieve the second highest salary using SQL?
*/

DROP TABLE employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    salary INT NOT NULL
);

INSERT INTO employees  (employee_id, first_name, salary) VALUES
    (1, 'Alice',100000),
    (2, 'Bob',95000),
    (3, 'Charlie',90000);

SELECT MAX(salary) AS second_highest_salary
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
);

SELECT DISTINCT salary
FROM employees
ORDER BY salary DESC
LIMIT 1 OFFSET 1;

SELECT salary
FROM (
    SELECT salary,
           DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
    FROM employees
) t
WHERE rnk = 2;

What interviewers expect

If asked: "Which approach is best for a large table?"

A strong answer is:

"If there is no index on salary, I would use the MAX() approach because it avoids sorting the entire table. 
If there is an index on salary, ORDER BY salary DESC LIMIT 1 OFFSET 1 can be extremely efficient because the database can use a descending index scan and stop after 
reading a few entries. 
Window functions are more suitable when ranking multiple rows, not for finding a single value like the second-highest salary."