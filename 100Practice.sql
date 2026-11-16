/*

Scenario: Using Window Functions for Row Numbering and Ranking

Question: How would you use ROW_NUMBER() and RANK() to rank employees by salary within departments?

The ROW_NUMBER() and RANK() functions assign row numbers and ranks based on salary, but they differ in handling ties..


*/


SELECT *, RANK() OVER(PARTITION BY department_id ORDER BY salary DESC) AS rnk,
          ROW_NUMBER() OVER(PARTITION BY department_id ORDER BY salary DESC) AS rw_num
FROM employees;
 

| emp_name | salary | ROW_NUMBER | RANK |
| -------- | ------ | ---------- | ---- |
| John     | 90000  | 1          | 1    |
| Jane     | 90000  | 2          | 1    |
| Michael  | 75000  | 3          | 3    |



| emp_name | salary | ROW_NUMBER | RANK |
| -------- | ------ | ---------- | ---- |
| Emily    | 80000  | 1          | 1    |
| David    | 70000  | 2          | 2    |
| Sarah    | 70000  | 3          | 2    |




DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10,2)
);

INSERT INTO employees VALUES
(1, 'John Doe', 101, 90000),
(2, 'Jane Smith', 101, 90000),
(3, 'Michael Johnson', 101, 75000),
(4, 'Emily Davis', 102, 80000),
(5, 'David Brown', 102, 70000),
(6, 'Sarah Wilson', 102, 70000);


SELECT * FROM employees;