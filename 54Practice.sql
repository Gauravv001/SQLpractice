-- Practice file 54
-- Scenario: Creating an index on the salary column

DROP TABLE IF EXISTS employees;

CREATE TABLE employees(
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2)
);


INSERT INTO employees (first_name, last_name, department, salary) VALUES
('John', 'Doe', 'IT', 75000.00),
('Jane', 'Smith', 'HR', 65000.00),
('Michael', 'Johnson', 'Finance', 82000.00),
('Emily', 'Davis', 'Marketing', 68000.00),
('David', 'Brown', 'IT', 90000.00),
('Sarah', 'Wilson', 'Sales', 72000.00),
('Chris', 'Taylor', 'Finance', 78000.00),
('Jessica', 'Anderson', 'HR', 61000.00),
('Daniel', 'Thomas', 'Marketing', 70000.00),
('Sophia', 'Moore', 'Sales', 74000.00);



-- Create Index on Salary
CREATE INDEX idx_salary
ON employees (salary);

-- Verify Data
SELECT * FROM employees;

-- Verify Index
SHOW INDEX FROM employees;

-- Scenario: Dropping an index from a table
DROP INDEX idx_salary ON employees;