/*
You want to keep duplicates while combining two datasets
*/

/*
  You need to combine employees from two tables: employees_2023 and employees_2024.
*/

-- Create employees_2023 table
CREATE TABLE employees_2023(
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL
);

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
How can you use UNION ALL to retain all rows, including duplicates?
--> The UNION ALL operator combines result sets and keeps all rows, including duplicates. It is more efficient since it doesn’t check for duplicates.
*/
SELECT employee_id, first_name FROM employees_2023
UNION ALL
SELECT employee_id, first_name FROM employees_2024;

/*
    Using UNION ALL (keeps duplicates, faster)
*/