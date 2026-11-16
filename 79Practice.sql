-- Practice file 79
/*
Scenario: Creating a Function to Calculate Bonuses
Question: How can you create a function to calculate a 10%
bonus for each employee’s salary?
A user-defined function simplifies repeated calculations

*/

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2)
);

INSERT INTO employees VALUES
(1, 'John Doe', 75000.00),
(2, 'Jane Smith', 68000.00),
(3, 'Michael Johnson', 82000.00),
(4, 'Emily Davis', 59000.00),
(5, 'David Brown', 91000.00);


DELIMITER //

CREATE FUNCTION calculate_bonus (
    salary decimal(10,2)
)
RETURNS decimal(10,2)

DETERMINISTIC

BEGIN

    return salary * 0.10;

END //

DELIMITER ;

/*
DELIMITER //

CREATE FUNCTION function_name (
    parameter_name data_type
)
RETURNS return_data_type

DETERMINISTIC

BEGIN

    -- logic

    RETURN value;

END //

DELIMITER ;
*/



SELECT salary,emp_name,calculate_bonus(salary) as bonus
FROM employees;