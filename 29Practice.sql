/*
You want to ensure that each
employee email is unique
*/

/*
Question:
How can you use the UNIQUE constraint?
The UNIQUE constraint ensures that no two employees have
the same email
*/

CREATE TABLE employee (
    email VARCHAR(50) UNIQUE  -- ensure uniquness across the two rows. 
);