/*

You need to find employees whose names contain the letter 'a'

Question: How can you use the LIKE operator to search for patterns in SQL?

The LIKE operator allows searching for patterns in text. In this scenario, % acts as a wildcard that matches any sequence of characters.

*/

SELECT employee_id,first_name,department
FROM employees
WHERE first_name LIKE '%a%';