-- Practice file 93
/*
Scenario: Finding Common Employees Across Multiple Departments

Question: How would you find employees who belong to both the HR and IT departments? 

The INTERSECT operator returns only the rows that appear in both result sets, identifying employees belonging to multiple departments.
*/


| Operator       | Meaning                            |
| -------------- | ---------------------------------- |
| UNION          | Combine + Remove Duplicates        |
| UNION ALL      | Combine + Keep Duplicates          |
| INTERSECT      | Common Rows Only                   |
| EXCEPT / MINUS | Rows in First Query but Not Second |







SELECT emp_name,employee_id FROM employee_department
WHERE department_name IN ('IT','HR')
GROUP BY emp_name,employee_id
HAVING COUNT(DISTINCT department_name) = 2
;





-- my sql doesn't supports INTERSECT directly 

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
(5, 'David Brown', 'IT'),
(5, 'David Brown', 'HR');