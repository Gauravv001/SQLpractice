-- Practice file 76

-- Cleanup
DROP TABLE IF EXISTS employees;

-- Create Table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    email VARCHAR(100),
    salary DECIMAL(10,2)
);

-- Valid Inserts
INSERT INTO employees VALUES
(4, 'John Doe', 'jon@gmail.com', 70500),
(2, 'Jane Smith', 'jane@gmail.com', 68000),
(3, 'Michael Johnson', 'michael@gmail.com', 82000);

-- Verify Data
SELECT * FROM employees;


ALTER TABLE employees
ADD CONSTRAINT unique_email UNIQUE(email);
