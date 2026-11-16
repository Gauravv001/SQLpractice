-- Practice file 69
-- What is Row-Level Security?
/*
Scenario: Implementing row-level security

Question: How can you restrict access to employees based on their department?
Row-level security (RLS) allows filtering rows based on user permissions.

*/

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2),
    department VARCHAR(50)
);

INSERT INTO employees VALUES
(1, 'John Doe', 75000.00, 'IT'),
(2, 'Jane Smith', 68000.00, 'HR'),
(3, 'Michael Johnson', 82000.00, 'Finance'),
(4, 'Emily Davis', 59000.00, 'IT'),
(5, 'David Brown', 91000.00, 'HR'),
(6, 'Sarah Wilson', 72000.00, 'Finance');

/*
Suppose:

IT Manager      → Can see only IT employees
HR Manager      → Can see only HR employees
Finance Manager → Can see only Finance employees

Even though everyone queries the same table, they should only see rows belonging to their department.

This is called Row-Level Security (RLS).

*/

SELECT * FROM employees;

# Real Row-Level Security (PostgreSQL)

-- Many enterprise databases support RLS natively.

-- Enable RLS:

BEGIN;
ALTER TABLE employees ENABLE ROW LEVEL SECURITY;

-- Create policy:


CREATE POLICY department_policy
ON employees
FOR SELECT
USING (
    department = current_user
);

Meaning:

```text
Logged-in IT user
→ sees only IT rows

Logged-in HR user
→ sees only HR rows
```

---

# SQL Server Equivalent

SQL Server uses:

* Security Policies
* Predicate Functions

to implement row filtering.

---

# Snowflake Equivalent

Snowflake uses:

```text
Row Access Policies
```

Example concept:

```sql
CREATE ROW ACCESS POLICY dept_policy
AS (department STRING)
RETURNS BOOLEAN ->
    CURRENT_ROLE() = department;
```

---

# Interview Explanation

Suppose you're working in a bank:

```text
HR Department
    ↓
Can see HR employees

IT Department
    ↓
Can see IT employees

Finance Department
    ↓
Can see Finance employees
```

Nobody can view other departments' data.

---

# Interview Follow-Up

### Why use Row-Level Security?

* Data privacy
* Regulatory compliance
* Multi-tenant applications
* Department-specific access

---

### Row-Level vs Column-Level Security

#### Row-Level Security

Controls:

```text
Which rows can be seen?
```

Example:

```text
HR can only see HR employees
```

---

#### Column-Level Security

Controls:

```text
Which columns can be seen?
```

Example:

```text
HR can see employee names
But cannot see salaries
```

---

# Interview Answer (30 Seconds)

> Row-Level Security restricts access to specific rows based on user context, such as department or role. For example, HR users may only see employees belonging to the HR department. This can be implemented using native RLS features such as PostgreSQL policies, Snowflake Row Access Policies, or by creating filtered views that expose only authorized rows.

### Pattern Name

This belongs to:

* Row-Level Security (RLS)
* Data Access Control
* Authorization
* Data Governance

### Quick Memory Trick

```text
Row-Level Security
=
Which rows can I see?

Column-Level Security
=
Which columns can I see?
```
