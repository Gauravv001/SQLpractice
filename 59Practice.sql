-- Practice file 59
/* Scenario: Recursive query to find the hierarchy of employees  */

Question: How can you retrieve the hierarchy of employees in an organization?


-- counting without using any functions 
-- employees - hierarchy 
WITH RECURSIVE cte_name as  (
    SELECT 1 AS n     /*base query*/

    UNION ALL

    SELECT n + 1 FROM cte_name    /*recursive query*/
    WHERE n < 10       
)
SELECT * FROM cte_name;


DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    manager_id INT
);

INSERT INTO employees VALUES
(1, 'John Doe', NULL),      -- CEO
(2, 'Jane Smith', 1),
(3, 'Michael Johnson', 1),
(4, 'Emily Davis', 2),
(5, 'David Brown', 2),
(6, 'Sarah Wilson', 2),
(7, 'Chris Taylor', 3),
(8, 'Jessica Anderson', 3),
(9, 'Daniel Thomas', 3),
(10, 'Sophia Moore', 1);


WITH RECURSIVE cte AS (
    SELECT employee_id,emp_name,manager_id FROM employees
    WHERE manager_id is NULL
    
    UNION ALL

    SELECT e.employee_id,e.emp_name,e.manager_id 
    FROM employees e
    inner join cte
    ON e.manager_id = cte.employee_id
)
SELECT * FROM cte;

-- Q9. How do you show hierarchy levels?
WITH RECURSIVE cte AS (

    SELECT employee_id,
           emp_name,
           manager_id,
           1 AS level
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    SELECT e.employee_id,
           e.emp_name,
           e.manager_id,
           cte.level + 1
    FROM employees e
    JOIN cte
      ON e.manager_id = cte.employee_id
)
SELECT *
FROM cte;




This is a very common follow-up question.

## Understanding the Question

Given:

| employee_id | emp_name         | manager_id |
| ----------- | ---------------- | ---------- |
| 1           | John Doe         | NULL       |
| 2           | Jane Smith       | 1          |
| 3           | Michael Johnson  | 1          |
| 4           | Emily Davis      | 2          |
| 5           | David Brown      | 2          |
| 6           | Sarah Wilson     | 2          |
| 7           | Chris Taylor     | 3          |
| 8           | Jessica Anderson | 3          |
| 9           | Daniel Thomas    | 3          |
| 10          | Sophia Moore     | 1          |

The interviewer may mean **two different things**.

---

# Case 1: Direct Reports

Question:

> How many employees directly report to each manager?

Example:

```text
John Doe
 ├─ Jane
 ├─ Michael
 └─ Sophia

Count = 3
```

Query:

```sql id="txr6lt"
SELECT
    manager_id,
    COUNT(*) AS employee_count
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id;
```

Output:

| manager_id | employee_count |
| ---------- | -------------- |
| 1          | 3              |
| 2          | 3              |
| 3          | 3              |

---

# Case 2: Total Employees Under a Manager

Question:

> Count all employees under a manager, including indirect reports.

Example:

```text
John Doe
│
├── Jane
│   ├── Emily
│   ├── David
│   └── Sarah
│
├── Michael
│   ├── Chris
│   ├── Jessica
│   └── Daniel
│
└── Sophia
```

Employees under John:

```text
Jane
Michael
Sophia
Emily
David
Sarah
Chris
Jessica
Daniel

Total = 9
```

Here, a simple `GROUP BY` won't work.

You need a Recursive CTE.

---

## Recursive Solution

```sql id="1ktw4z"
WITH RECURSIVE hierarchy AS (

    SELECT
        employee_id,
        manager_id,
        employee_id AS root_manager
    FROM employees

    UNION ALL

    SELECT
        e.employee_id,
        e.manager_id,
        h.root_manager
    FROM employees e
    JOIN hierarchy h
        ON e.manager_id = h.employee_id
)

SELECT
    root_manager AS manager_id,
    COUNT(*) - 1 AS total_reports
FROM hierarchy
GROUP BY root_manager
ORDER BY root_manager;
```

---

## Easier Interview Answer

Most interviewers asking this question expect the simpler version:

```sql
SELECT
    manager_id,
    COUNT(*) AS total_employees
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id;
```

Then you can impress them by adding:

> "If you mean all direct and indirect reports in the hierarchy, I would use a Recursive CTE instead of a simple GROUP BY."

### Interview Tip

Always clarify:

> "Do you want direct reports only, or direct plus indirect reports?"

That distinction often separates a good SQL answer from a great one.
