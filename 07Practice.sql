/*
You want to retrieve employees whose salaries are not 40,000.

Question:
How can you use the != operator to exclude certain values in SQL?

*/


SELECT employee_id,first_name,salary
FROM employees
WHERE salary != 40000;