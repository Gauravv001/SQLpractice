/*
You want to create a table that stores whether employees are active or inactive.

Question:
Which data type should you use to store true/false values
in SQL?

The BOOLEAN data type stores TRUE or FALSE values,
ideal for representing binary states.
*/

CREATE TABLE employee_status (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    is_active BOOLEAN  -- TRUE if active, FALSE if inactive
);

-- This structure ensures each employee's status is stored accurately