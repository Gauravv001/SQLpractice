-- 110Practice.sql
-- Practice SQL file with space for a question statement.

/*
Question statement:


Scenario: Assign dense ranks to
employees within a department based on
performance scores.
Question: How can you assign dense ranks to employees based on
their performance within each department?
The DENSE_RANK() function assigns ranks without leaving gaps
between them, even if multiple rows have the same value. This
makes it ideal for scenarios where a continuous ranking is
required, such as ranking employees by performance

-- Assign dense ranks to employees within each department based on performance scores.

*/
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department_id INT,
    performance_score INT
);

INSERT INTO employees VALUES
(1,'John Doe',101,95),
(2,'Jane Smith',101,90),
(3,'Michael Johnson',101,90),
(4,'Chris Taylor',101,80),

(5,'Emily Davis',102,92),
(6,'David Brown',102,88),
(7,'Sarah Wilson',102,88),
(8,'Sophia Moore',102,75);


SELECT *,
       DENSE_RANK() OVER(PARTITION BY department_id ORDER BY performance_score DESC) as d_rnk
FROM employees; 