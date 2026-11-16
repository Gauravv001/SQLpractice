-- Practice file 94
/*
Scenario: Removing Data Matching a Certain Condition

Question: How can you list employees who belong to HR but not IT using the EXCEPT operator?

The EXCEPT operator returns the rows from the first query that do not appear in the second query, helping you exclude specific matches.

*/

-- employee dataset 
DROP TABLE IF EXISTS employee_department;

CREATE TABLE employee_department (
    employee_id INT,
    emp_name VARCHAR(50),
    department_name VARCHAR(50)
);

INSERT INTO employee_department VALUES
(1, 'John Doe', 'IT'),
(1, 'John Doe', 'HR'),
(2, 'Jane Smith', 'IT'),
(3, 'Michael Johnson', 'HR'),
(4, 'Emily Davis', 'Finance'),
(5, 'David Brown', 'HR'),
(5, 'David Brown', 'IT');

select * from employee_department
where department_name in ('HR','IT');


SELECT emp_name FROM employee_department
WHERE department_name IN ('HR')
EXCEPT 
SELECT emp_name FROM employee_department
WHERE department_name IN ('IT');