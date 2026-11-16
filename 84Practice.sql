-- Practice file 84
/*
Scenario: Filtering Employees Based on Matching Department Data

Question: How would you retrieve the names of employees who are part of a valid department using an INNER JOIN?
An INNER JOIN only retrieves rows where there are matching
values in both joined tables. In this scenario, we want to ensure
that only employees assigned to valid departments are shown.

*/

--department_tables
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO departments VALUES
(101, 'IT'),
(102, 'HR'),
(103, 'Finance');

-- employee_table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department_id INT
);

INSERT INTO employees VALUES
(1, 'John Doe', 101),
(2, 'Jane Smith', 102),
(3, 'Michael Johnson', 103),
(4, 'Emily Davis', 104),   -- Invalid Department
(5, 'David Brown', 101);

-- inner join  --> intersection all matching rows in both the tables
SELECT e.emp_name,e.employee_id,d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id;

-- left join --> all employees rows + matching department rows
SELECT e.emp_name,e.employee_id,d.department_name
FROM employees e
LEFT OUTER JOIN departments d
ON e.department_id = d.department_id;


-- RIGHT JOIN  --> ALL Department rows + matching employees rows
SELECT e.emp_name,e.employee_id,d.department_name
FROM employees e
RIGHT OUTER JOIN departments d
ON e.department_id = d.department_id;


SELECT e.emp_name,e.employee_id,d.department_name
FROM employees e
CROSS JOIN departments d
ON e.department_id = d.department_id;


/*
| Join  | Returns             | Memory Trick          |
| ----- | ------------------- | --------------------- |
| INNER | Matching only       | 🤝 Handshake          |
| LEFT  | All left + matches  | ⬅️ Left Boss          |
| RIGHT | All right + matches | ➡️ Right Boss         |
| FULL  | Everything          | ❤️ Nobody Left Behind |
| CROSS | Every combination   | 💥 Explosion          |
| SELF  | Table joins itself  | 🪞 Mirror             |
*/

