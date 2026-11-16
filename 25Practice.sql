/*
You need to merge new employee records
with existing ones. If an employee exists,
update the salary; otherwise, insert the
new employee.
*/

DROP TABLE employees;

-- employee_records
CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    salary DECIMAL(10,2)
);

-- new_employee_records
CREATE TABLE new_employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    salary DECIMAL(10,2)
);


INSERT INTO employees (first_name, salary) VALUES
('JohnDoe', 50000),
('SamayRaina', 23000),
('ZakhirKhan', 45000),
('JameelJamali', 74900);


INSERT INTO new_employees (first_name, salary) VALUES
('JohnDoe', 53000),
('Ashwin', 33000),
('Ranveer', 63000),
('UzairBaloch', 88900);


SELECT * FROM employees;
SELECT * FROM new_employees;

/*Question:
How can you use the MERGE statement to perform an
upsert operation?
The MERGE statement allows you to insert or update records
based on whether the employee already exists

*/

MERGE INTO employees AS target
USING new_employees AS source
ON (target.employee_id = source.employee_id) -- Join condition

-- 1. When records match based on the ON condition
WHEN MATCHED THEN
    UPDATE SET target.salary = source.salary

-- 2. When records exist in Source but not in Target
WHEN NOT MATCHED THEN
    INSERT (first_name, salary)
    VALUES (source.first_name, source.salary)
