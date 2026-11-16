/*
Scenario: Automatically updating a log table when employees are added

whenever there is an entry in employees table you update it in log table.
*/

-- Add your SQL practice code here

DROP TRIGGER IF EXISTS trg_employee_insert;
DROP TABLE IF EXISTS employee_logs;
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10,2)
);


CREATE TABLE employee_logs (
    employee_id INT,
    action VARCHAR(50)
);


INSERT INTO employees
VALUES (1, 'Alice', 101, 50000);

SELECT * FROM employee_logs;

SHOW TRIGGERS;

DELIMITER $$
CREATE TRIGGER trg_employee_insert
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
    INSERT INTO employee_logs (employee_id, action)
    VALUES (NEW.employee_id, 'Inserted');
END$$
DELIMITER ;