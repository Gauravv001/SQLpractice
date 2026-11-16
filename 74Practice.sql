-- Practice file 74
/*
Scenario: Handling deletion of related rows with foreign keys
Question: How can you ensure that when a department is deleted,all employees in that department are also deleted?
The ON DELETE CASCADE clause ensures that child rows (employees) are automatically deleted when the parent row (department) is deleted

*/

DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

-- Step 2: Create Child Table (Employees)

-- Notice the ON DELETE CASCADE.

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2),
    department_id INT,

    CONSTRAINT fk_department
    FOREIGN KEY (department_id)
    REFERENCES departments(department_id)
    ON DELETE CASCADE
);


INSERT INTO departments VALUES
(101, 'IT'),
(102, 'HR'),
(103, 'Finance');

SELECT * FROM employees ;

INSERT INTO employees VALUES
(1, 'John Doe', 75000.00, 101),
(2, 'Jane Smith', 68000.00, 102),
(3, 'Michael Johnson', 82000.00, 101),
(4, 'Emily Davis', 59000.00, 103),
(5, 'David Brown', 91000.00, 101);


SELECT * FROM departments;

-- Step 4: Delete a Department
DELETE FROM departments
WHERE department_id = 101;


To automatically delete all employees when a department is deleted, 
I would define a foreign key on department_id with the ON DELETE CASCADE option.  

This ensures referential integrity by automatically removing all child records associated with the deleted parent record.

 ## For interviews, you only need to remember **4 major ON DELETE actions**.

--
# 1. ON DELETE CASCADE

```sql
FOREIGN KEY (department_id)
REFERENCES departments(department_id)
ON DELETE CASCADE
```

### What happens?

```text
Delete Parent
↓
Delete Children
```

### Example

Delete Department:

```text
IT Department
```

Automatically delete:

```text
John
Mike
David
```

### Memory Trick

🌊 **CASCADE = Waterfall**

```text
Parent falls
↓
Children fall too
```

Think:

```text
Waterfall
↓
Everything below gets washed away
```

------------------------------------------------------------

# 2. ON DELETE SET NULL

```sql
FOREIGN KEY (department_id)
REFERENCES departments(department_id)
ON DELETE SET NULL
```

### What happens?

```text
Delete Parent
↓
Keep Child
↓
Remove Relationship
```

### Example

Before:

| Employee | Dept |
| -------- | ---- |
| John     | IT   |

Delete IT Department

After:

| Employee | Dept |
| -------- | ---- |
| John     | NULL |

John survives.

Only department reference disappears.

### Memory Trick

👨‍👦 Child becomes an orphan

```text
Parent deleted
↓
Child remains
↓
No parent
```

Think:

```text
SET NULL
=
Orphan Child
```

---

# 3. ON DELETE RESTRICT

```sql
FOREIGN KEY (department_id)
REFERENCES departments(department_id)
ON DELETE RESTRICT
```

### What happens?

```text
Children exist
↓
Parent cannot be deleted
```

### Example

Department:

```text
IT
```

Employees:

```text
John
Mike
David
```

Try:

```sql
DELETE FROM departments
WHERE department_id = 101;
```

❌ Error

### Memory Trick

🚔 Security Guard

```text
Trying to delete parent?
↓
Children exist?
↓
STOP!
```

Think:

```text
RESTRICT
=
Restricted Access
```

---

# 4. ON DELETE NO ACTION

```sql
FOREIGN KEY (department_id)
REFERENCES departments(department_id)
ON DELETE NO ACTION
```

### What happens?

Practically similar to RESTRICT in most databases.

```text
Children exist
↓
Parent cannot be deleted
```

### Memory Trick

🧍 "Do Nothing"

```text
Delete request arrives
↓
Database says:
"No Action"
↓
Deletion fails
```

Think:

```text
NO ACTION
=
No deletion allowed
```

---

# Ultimate Interview Table

| ON DELETE | Child Rows                        | Memory Trick      |
| --------- | --------------------------------- | ----------------- |
| CASCADE   | Deleted                           | 🌊 Waterfall      |
| SET NULL  | Survive, parent reference removed | 👶 Orphan Child   |
| RESTRICT  | Prevent parent deletion           | 🚔 Security Guard |
| NO ACTION | Prevent parent deletion           | 🧍 Do Nothing     |

---

# Super Easy Story

Imagine:

```text
Department = Parent
Employees = Children
```

### CASCADE

```text
Parent dies
↓
Children die
```

### SET NULL

```text
Parent dies
↓
Children survive
↓
Become orphans
```

### RESTRICT

```text
Parent tries to die
↓
Guard says:
"No, you have children!"
```

### NO ACTION

```text
Parent tries to die
↓
Database ignores request
```

---

### 10-Second Interview Recall

```text
CASCADE   = Kill everyone 🌊

SET NULL  = Keep children, remove parent 👶

RESTRICT  = Don't allow deletion 🚔

NO ACTION = Same as RESTRICT 🧍
```

If you remember **Waterfall → Orphan → Security Guard → Do Nothing**, you'll never confuse the `ON DELETE` options in an interview.
