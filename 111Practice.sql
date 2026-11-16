-- 111Practice.sql
-- Practice SQL file with space for a question statement.

/*
Question statement:

Scenario: Divide employees into 4 equal groups based on their hire date.
Question: How can you use the NTILE() function to divide employees into 4 equal groups based on hire date?
The NTILE() function distributes rows into a specified number of
buckets. If the rows don't divide evenly, earlier buckets will
contain an extra row.



Divide employees into 4 equal groups based on hire date.


| Function     | Purpose                  |
| ------------ | ------------------------ |
| ROW_NUMBER() | Unique numbering         |
| RANK()       | Ranking with gaps        |
| DENSE_RANK() | Ranking without gaps     |
| NTILE()      | Divide into equal groups |

*/


DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    hire_date DATE
);

INSERT INTO employees VALUES
(1,'John Doe','2020-01-15'),
(2,'Jane Smith','2020-03-20'),
(3,'Michael Johnson','2020-05-10'),
(4,'Emily Davis','2020-07-12'),
(5,'David Brown','2020-09-18'),
(6,'Sarah Wilson','2020-11-25'),
(7,'Chris Taylor','2021-01-10'),
(8,'Sophia Moore','2021-03-15');


SELECT
    employee_id,
    emp_name,
    hire_date,

    NTILE(4) OVER(
        ORDER BY hire_date
    ) AS employee_group

FROM employees;