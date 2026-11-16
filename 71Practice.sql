-- Practice file 71
/*
Scenario: Creating a new table to store employee data

Question: How would you create a new table named employees
with columns for employee ID, first name, last name, and hire
date, ensuring that the employee ID is the primary key?



The CREATE TABLE statement allows us to define the structure of
a new table. In this case, the employee_id column is set as the
primary key, meaning that it must contain unique, non-null values
to uniquely identify each row. The NOT NULL constraint ensures
that first_name, last_name, and hire_date cannot be left
empty

*/

DROP TABLE IF EXISTS employees;


CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    hire_date DATE NOT NULL
); 


/* Scenario: Altering an existing table to add a new column

Question: How can you add a new column email to the employees table, ensuring it stores unique values...
*/

ALTER TABLE employees 
ADD COLUMN email VARCHAR(100) UNIQUE; 
 

describe employees;

   
/*

Scenario: Dropping an unwanted column
from a table
Question: How do you remove the email column from the
employees table?

*/

ALTER TABLE employees
DROP COLUMN salary;