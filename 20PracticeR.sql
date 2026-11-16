/*
You need to retrieve employees who joined within the last six months.


Question:
How can you use date functions and the WHERE clause to filter records by date range?
--> 
In SQL, date filtering is achieved using functions like
CURRENT_DATE or NOW(). You can subtract six months
using the INTERVAL keyword to find employees who joined
recently
*/

-- DROP table employees;
-- table structure
CREATE TABLE employees(
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    join_date DATE
);


INSERT INTO employees(first_name, join_date) VALUES
('John', '2026-03-15'),   -- within last 6 months
('Alice', '2026-01-10'),  -- within last 6 months
('Bob', '2025-12-01'),    -- within last 6 months
('Charlie', '2025-10-20'),-- within last 6 months (border case)
('David', '2025-08-15'),  -- older than 6 months
('Eva', '2024-12-25'),    -- older
('Frank', '2025-04-01'),  -- older
('Grace', '2026-02-05'),  -- within last 6 months
('Hannah', '2025-11-30'), -- within last 6 months
('Ishaan', '2025-06-18'); -- older


SELECT first_name, join_date
FROM employees
WHERE join_date >= CURRENT_DATE - INTERVAL 2 MONTH;


SELECT *
FROM employees
WHERE join_date >= CURDATE() - INTERVAL 6 MONTH;