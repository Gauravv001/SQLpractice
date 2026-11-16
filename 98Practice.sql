-- Practice file 98


CREATE TABLE employees_target (
    employee_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2)
);

INSERT INTO employees_target VALUES
(1, 'John Doe', 75000),
(2, 'Jane Smith', 68000),
(3, 'Michael Johnson', 82000);

-- Source Table (New Data)
CREATE TABLE employees_source (
    employee_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2)
);

INSERT INTO employees_source VALUES
(2, 'Jane Smith', 70000),      -- Updated Salary
(3, 'Michael Johnson', 82000), -- Same
(4, 'Emily Davis', 59000);     -- New Employee


-- merge statement

MERGE employees_target t 
USING employees_source s
ON (t.employee_id = s.employee_id)

WHEN MATCHED THEN 
UPDATE SET t.salary = s.salary

WHEN NOT MATCHED THEN
    INSERT (
        employee_id,
        emp_name,
        salary
    )
    VALUES (
        s.employee_id,
        s.emp_name,
        s.salary
    );

-- MYSQL equivalent 
INSERT INTO employees_target
(employee_id, emp_name, salary)
VALUES
(2,'Jane Smith',70000)

ON DUPLICATE KEY UPDATE
salary = VALUES(salary);