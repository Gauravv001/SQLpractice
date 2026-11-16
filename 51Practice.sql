/*
Scenario: Adding a new column to an existing table

Question: How would you add a new column, email, to the
employees table?

To store additional information, you can use the ALTER TABLE
statement to add a new column. This ensures the table structure
can evolve with changing data requirements. Newly added
columns will have NULL values for existing records
unless a DEFAULT value is specified.

*/


SELECT * FROM employees;

ALTER TABLE employees
ADD COLUMN age INT NOT NULL default 25;

UPDATE employees
SET age = 30
WHERE employee_id = 1;

UPDATE employees
SET age = 28
WHERE employee_id = 2;

UPDATE employees
SET age = 35
WHERE employee_id = 3;

-- Scenario: Removing a column from a table
ALTER TABLE employees
DROP COLUMN age;


-- Scenario: Renaming a column in a table
ALTER TABLE employees
RENAME COLUMN age to emp_age;

SELECT * FROM employees;


-- Scenario: Changing the data type of a column


--Syntax
ALTER TABLE table_name
MODIFY COLUMN column_name NEW_DATATYPE;

ALTER TABLE employees
MODIFY COLUMN emp_age VARCHAR(50);





