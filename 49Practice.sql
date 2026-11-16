/*
cenario: Ensuring data consistency
with a foreign key constraint
*/

-- Add your SQL practice code here
CREATE TABLE department(
    department_id INT PRIMARY KEY AUTO INCREMENT,
    department_name VARCHAR(50)
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO INCREMENT,
    employee_name VARCHAR(50),
    FOREIGN KEY dep_id 
    REFERENCES department(department_id)
);


CREATE TABLE child_table (
    column_name datatype,
    
    CONSTRAINT fk_name
    FOREIGN KEY (column_name)
    REFERENCES parent_table(parent_column)
);