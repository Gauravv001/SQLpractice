-- Practice file 72
/*
Scenario: Creating a table with a composite primary key
Question: How would you create a student_courses table with student_id and course_id as a composite primary key

*/

CREATE TABLE student_courses (
    student_id INT,
    course_id INT,
    PRIMARY KEY(student_id,course_id)
);


describe student_courses;