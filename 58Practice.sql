-- Practice file 58
/*
Scenario: Using a self-join to find
employees reporting to the same
manager.

Question: How would you find pairs of employees reporting to the
same manager?

*/


-- Create Table
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    manager_id INT
);

-- Insert Dummy Data
INSERT INTO employees VALUES
(1, 'John Doe', NULL),      -- CEO
(2, 'Jane Smith', 1),
(3, 'Michael Johnson', 1),
(4, 'Emily Davis', 2),
(5, 'David Brown', 2),
(6, 'Sarah Wilson', 2),
(7, 'Chris Taylor', 3),
(8, 'Jessica Anderson', 3),
(9, 'Daniel Thomas', 3),
(10, 'Sophia Moore', 1);


John Doe (1)
│
├── Jane Smith (2)
│   ├── Emily Davis (4)
│   ├── David Brown (5)
│   └── Sarah Wilson (6)
│
├── Michael Johnson (3)
│   ├── Chris Taylor (7)
│   ├── Jessica Anderson (8)
│   └── Daniel Thomas (9)
│
└── Sophia Moore (10)


SELECT E1.emp_name AS emp1, E2.emp_name as EMP2,E1.manager_id FROM employees E1
JOIN employees E2 ON E1.manager_id = E2.manager_id
WHERE E1.EMPLOYEE_ID < e2.EMPLOYEE_ID;

We use a self-join because employee and manager information is stored in the same table. We join on
manager_id to find employees reporting to the same manager, and use E1.employee_id < E2.employee_id 
to avoid self-matches and duplicate employee pairs.