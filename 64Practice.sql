-- Practice file 64
/*
Scenario: Locking a table to prevent other
transactions from accessing it

Question: How would you lock a table to ensure that only your
transaction can make changes to it?
When performing sensitive operations, locking a table ensures
that other transactions cannot modify or read from it until your
operation is complete. SQL uses LOCK TABLE to prevent conflicts
between concurrent transactions.
*/




DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2),
    department VARCHAR(50)
);

INSERT INTO employees VALUES
(1, 'John Doe', 75000.00, 'IT'),
(2, 'Jane Smith', 68000.00, 'HR'),
(3, 'Michael Johnson', 82000.00, 'Finance'),
(4, 'Emily Davis', 59000.00, 'Marketing'),
(5, 'David Brown', 91000.00, 'IT');


-- Locking the Table (MySQL)
-- Suppose you're about to give all employees a salary increase and don't want anyone else modifying the table.


LOCK TABLES employees WRITE;

UPDATE employees
SET salary = salary * 1.10;

SELECT *
FROM employees;

UNLOCK TABLES;
/*
To prevent concurrent modifications, I can acquire a write lock using LOCK TABLES employees WRITE. 
This ensures my session has exclusive write access while other transactions are blocked from making changes. 
Once the operation is complete, I release the lock using UNLOCK TABLES.
*/