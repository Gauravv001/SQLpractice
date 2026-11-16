/*
  You need to combine employees from two tables: employees_2023 and employees_2024.
*/

DROP TABLE employees_2023;
-- Create employees_2023 table
CREATE TABLE employees_2023(
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL
);

DROP TABLE employees_2024;
-- Create employees_2024 table
CREATE TABLE employees_2024(
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL
);


-- Insert data into employees_2023
INSERT INTO employees_2023 (first_name) VALUES
('Amit'),
('Neha'),
('Ravi'),
('Priya');

-- Insert data into employees_2024
INSERT INTO employees_2024 (first_name) VALUES
('Amit'),
('Sneha'),
('Arjun'),
('Pooja');

/*
Question:
How would you use the UNION operator to combine the data?
--> The UNION operator combines the result sets of two SELECT queries and removes duplicates.
*/
SELECT employee_id, first_name FROM employees_2023
UNION
SELECT employee_id, first_name FROM employees_2024;

