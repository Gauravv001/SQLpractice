-- Practice file 77
This is a more advanced **Foreign Key Design** question.

# First Understand the Problem

Suppose we create two tables:

## Departments

```text
department_id
manager_id
```

## Employees

```text
employee_id
department_id
```

Now imagine:

```text
Departments
    ↓ references
Employees

Employees
    ↓ references
Departments
```

Both tables depend on each other.

This is called a **Circular Reference**.

---

# Bad Design (Circular Reference)

```sql
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    manager_id INT
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department_id INT,

    FOREIGN KEY (department_id)
    REFERENCES departments(department_id)
);

ALTER TABLE departments
ADD CONSTRAINT fk_manager
FOREIGN KEY (manager_id)
REFERENCES employees(employee_id);
```

---

## Problem

Department needs:

```text
manager_id
```

before insertion.

But manager is an employee.

Employee needs:

```text
department_id
```

before insertion.

Now SQL asks:

```text
Insert department first?
```

Cannot.

Manager doesn't exist.

---

SQL asks:

```text
Insert employee first?
```

Cannot.

Department doesn't exist.

---

### Chicken and Egg Problem 🐔🥚

```text
Department needs Employee

Employee needs Department

Who comes first?
```

This is the circular reference issue.

---

# Dummy Dataset

Let's say:

## Department

| department_id | department_name | manager_id |
| ------------- | --------------- | ---------- |
| 101           | IT              | 1          |

---

## Employee

| employee_id | emp_name | department_id |
| ----------- | -------- | ------------- |
| 1           | John Doe | 101           |

Impossible to insert directly because each depends on the other.

---

# Solution 1 (Most Common)

Insert first, then update.

### Create Tables

```sql
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    manager_id INT
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department_id INT,

    FOREIGN KEY (department_id)
    REFERENCES departments(department_id)
);
```

---

### Insert Department First

```sql
INSERT INTO departments
VALUES (101, 'IT', NULL);
```

---

### Insert Employee

```sql
INSERT INTO employees
VALUES (1, 'John Doe', 101);
```

---

### Update Manager

```sql
UPDATE departments
SET manager_id = 1
WHERE department_id = 101;
```

Now both references exist.

---

# Solution 2 (Deferred Constraints)

Supported in databases like:

* PostgreSQL
* Oracle Database

Example:

```sql
DEFERRABLE INITIALLY DEFERRED
```

SQL waits until transaction commit to validate foreign keys.

Not supported by MySQL.

---

# Solution 3 (Best Design)

Avoid bidirectional foreign keys.

Instead:

```text
Departments
     ↓
Employees
```

Only one direction.

### Departments

```sql
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);
```

### Employees

```sql
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department_id INT,

    FOREIGN KEY (department_id)
    REFERENCES departments(department_id)
);
```

Much simpler.

---

# Interview Follow-Up

### What is a Circular Reference?

**Answer:**

> A circular reference occurs when two or more tables depend on each other through foreign keys, creating insertion and deletion order challenges.

---

### Why is it a Problem?

```text
Insert A
↓
Needs B

Insert B
↓
Needs A
```

Deadlock in data creation.

---

### How do you avoid it?

1. Insert then update.
2. Use deferred constraints.
3. Prefer one-way foreign key relationships.

---

# Memory Trick

Imagine:

```text
Department
   needs
Manager

Manager
   needs
Department
```

```text
Department ←→ Employee
```

Both pointing at each other.

Think:

🐔 + 🥚

```text
Chicken needs Egg

Egg needs Chicken

Who comes first?
```

That's exactly a circular reference.

---

# Interview Answer (30 Seconds)

> Circular references occur when two tables reference each other through foreign keys. This can create insertion order problems because each table depends on the other. C
ommon solutions include inserting records first and updating references later, using deferred constraints in databases that support them, 
or redesigning the schema to avoid bidirectional foreign key relationships whenever possible.

### Quick Recall

```text
Circular Reference
=
A depends on B

B depends on A

Solution:
Insert → Update
or
Avoid two-way foreign keys
```
