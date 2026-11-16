-- Practice file 65



DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2),
    department VARCHAR(50),

    CHECK (salary >= 30000)
);


INSERT INTO employees VALUES
(1, 'John Doe', 75000.00, 'IT'),
(2, 'Jane Smith', 68000.00, 'HR'),
(3, 'Michael Johnson', 82000.00, 'Finance'),
(4, 'Emily Davis', 59000.00, 'Marketing');



INSERT INTO employees VALUES
(5, 'David Brown', 25000.00, 'IT');



Interview Answer: 

A CHECK constraint enforces a condition on column values. 
To ensure employee salaries cannot be less than 30,000, I can define CHECK (salary >= 30000) on the salary column. 
Any INSERT or UPDATE that violates this condition will be rejected by the database.

Pattern Name:
This question belongs to:

Constraints
Data Integrity
CHECK Constraint Validation
Business Rule Enforcement

Whenever you hear: "Ensure a value follows a rule"