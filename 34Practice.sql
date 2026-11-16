/*
You need to insert data into one table by selecting it from another
Question:
How can you use INSERT INTO ... SELECT to copy data between tables?
The INSERT INTO ... SELECT statement inserts data from one
table into another. Both tables must have matching column
types

*/
Table 1: employees_2025
Table 2: employees_2026

--both tables must have matching columns 

INSERT INTO employees_2026(employee_id,first_name,salary,department)
SELECT employee_id,first_name,salary,department
FROM employees_2025;



-- Add your SQL practice code here
