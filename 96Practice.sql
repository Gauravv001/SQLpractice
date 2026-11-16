-- Practice file 96
/*
Scenario: Generating Subtotals Using ROLLUP
Question: How would you calculate total salaries per department and the grand total using ROLLUP?

The ROLLUP operator generates subtotals and grand totals within a grouped result

*/

SELECT department,sum(salary) as total_sal
FROM employees
GROUP BY department;


/*

Give me salary totals department-wise and also overall company total.

*/

-- overall company total
SELECT department,sum(salary) as total_sal
FROM employees
GROUP BY department WITH ROLLUP;


# what is null ?? --> total salary 

/*
Without ROLLUP:
Query 1 → Department Totals

Query 2 → Grand Total

With ROLLUP:
One Query


*/




DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

INSERT INTO employees VALUES
(1, 'John Doe', 'IT', 50000),
(2, 'Jane Smith', 'IT', 60000),
(3, 'Michael Johnson', 'HR', 55000),
(4, 'Emily Davis', 'HR', 65000),
(5, 'David Brown', 'Finance', 70000);