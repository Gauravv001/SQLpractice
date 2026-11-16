-- Practice file 80
/*
Scenario: Creating a Table with Conditional Unique Constraints
Question: How would you ensure that employees within the same
department cannot share the same email but allow duplicate
emails across different departments?

A conditional unique constraint can be implemented using a
composite unique index. This ensures that while employees in the
same department must have unique email addresses, employees
in different departments can share the same email.
*/


This is a **Composite Unique Constraint** interview question.

# First Understand the Requirement

We want:

✅ Same email allowed in different departments

❌ Same email NOT allowed in the same department

---

## Allowed

| employee | department | email                                   |
| -------- | ---------- | --------------------------------------- |
| John     | IT         | [john@gmail.com](mailto:john@gmail.com) |
| Jane     | HR         | [john@gmail.com](mailto:john@gmail.com) |

Different departments → Allowed ✅

---

## Not Allowed

| employee | department | email                                   |
| -------- | ---------- | --------------------------------------- |
| John     | IT         | [john@gmail.com](mailto:john@gmail.com) |
| Mike     | IT         | [john@gmail.com](mailto:john@gmail.com) |

Same department + same email → Not Allowed ❌

---

# Solution: Composite UNIQUE Constraint

```sql id="xru2wg"
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department_id INT,
    email VARCHAR(100),

    CONSTRAINT uq_dept_email
    UNIQUE (department_id, email)
);
```

---

# Insert Valid Data

```sql id="2gj7fr"
INSERT INTO employees VALUES
(1, 'John Doe', 101, 'john@gmail.com'),
(2, 'Jane Smith', 102, 'john@gmail.com'),
(3, 'Michael Johnson', 103, 'john@gmail.com');
```

Success ✅

Why?

```text id="tk2fmu"
(101, john@gmail.com)
(102, john@gmail.com)
(103, john@gmail.com)
```

Each combination is unique.

---

# Insert Invalid Data

```sql id="jqjw4k"
INSERT INTO employees VALUES
(4, 'David Brown', 101, 'john@gmail.com');
```

Error ❌

Because:

```text id="j3pnsy"
(101, john@gmail.com)
```

already exists.

---

# How Database Checks

The database does NOT check:

```text id="tf8i0v"
email only
```

It checks:

```text id="eh2z6j"
(department_id, email)
```

as a pair.

Think:

```text id="nn3grd"
Department + Email
=
One Unique Combination
```

---

# Alternative Syntax

```sql id="9pcezt"
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department_id INT,
    email VARCHAR(100),

    UNIQUE(department_id, email)
);
```

Same result.

---

# Interview Follow-Up

### Difference Between

```sql id="5sm2o0"
UNIQUE(email)
```

and

```sql id="a9bxy8"
UNIQUE(department_id, email)
```

### UNIQUE(email)

```text id="36sn6m"
john@gmail.com
```

can appear only once in the entire table.

---

### UNIQUE(department_id, email)

```text id="3r2n9v"
john@gmail.com
```

can appear many times.

But:

```text id="vq4l4s"
same department
+
same email
```

cannot repeat.

---

# Memory Trick

Imagine apartment buildings.

```text id="s2qfrf"
Flat 101 in Tower A
Flat 101 in Tower B
```

Allowed.

But:

```text id="rjskwy"
Flat 101 in Tower A
Flat 101 in Tower A
```

Not allowed.

Think:

```text id="v42j0i"
Tower + Flat Number
=
Unique Combination
```

Similarly:

```text id="u3pld8"
Department + Email
=
Unique Combination
```

---

# Interview One-Liner

> To enforce email uniqueness only within a department, I would create a composite unique constraint on `(department_id, email)`. This ensures that the same email cannot appear twice in the same department, while still allowing the email to be reused across different departments.

### Quick Recall

```text id="1xmb6v"
UNIQUE(email)
=
Email unique globally

UNIQUE(department_id, email)
=
Email unique within department
```

This pattern is called a **Composite Unique Constraint** or **Composite Unique Index**.
