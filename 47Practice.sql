/*
Practice Question 47
*/

-- Add your SQL practice code here
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10,2)
);


-- Create Log Table

DROP TABLE IF EXISTS employee_log;

CREATE TABLE employee_log (
    log_id INT PRIMARY KEY,
    employee_id INT,
    action_performed VARCHAR(50),
    log_date DATETIME
);

INSERT INTO employees
VALUES
(1, 'Alice', 101, 50000),
(2, 'Bob', 102, 60000);


-- Create Trigger
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS employee_log;

CREATE TABLE employees (
    employee_id INTEGER PRIMARY KEY,
    employee_name TEXT
);

CREATE TABLE employee_log (
    employee_id INTEGER,
    action_performed TEXT,
    log_date TEXT
);

DELIMITER $$

CREATE TRIGGER trg_employee_insert
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
    INSERT INTO employee_log
    (
        employee_id,
        action_performed,
        log_date
    )
    VALUES
    (
        NEW.employee_id,
        'EMPLOYEE ADDED',
        NOW()
    );
END$$

DELIMITER ;

INSERT INTO employees
VALUES (1, 'Alice');

SELECT * FROM employee_log;

SELECT sqlite_version();