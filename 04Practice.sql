/*
The HR department has been closed,
and all employees in HR must be
removed from the database.

Question:
How can you use the DELETE statement to remove specific
records?

The DELETE statement removes rows from a table. 
In this case, you must use the WHERE clause to delete only
employees belonging to the HR department. Without
the WHERE clause, all rows would be deleted.
*/

-- let say we have 1 record/ employee named john doe in HR department. 
-- deleting all the employees from HR department
DELETE FROM employees
WHERE department = 'HR';
