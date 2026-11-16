-- Practice file 67






DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    employee_details JSON
);


INSERT INTO employees VALUES
(
    1,
    'John Doe',
    '{"city":"New York","department":"IT","experience":5}'
),
(
    2,
    'Jane Smith',
    '{"city":"Chicago","department":"HR","experience":3}'
),
(
    3,
    'Michael Johnson',
    '{"city":"Boston","department":"Finance","experience":7}'
),
(
    4,
    'Emily Davis',
    '{"city":"Seattle","department":"Marketing","experience":4}'
);


SELECT *
FROM employees;


-- extract the data from JSON --
SELECT
    emp_name,
    JSON_EXTRACT(employee_details, '$.city') AS city
FROM employees;


-- mysql shortcut
SELECT
    emp_name,
    employee_details->>'$.city' AS city
FROM employees;


-- Filter Using JSON
SELECT *
FROM employees
WHERE employee_details->>'$.city' = 'New York';


-- extract multiple feilds
SELECT
    emp_name,
    employee_details->>'$.department' AS department,
    employee_details->>'$.experience' AS experience
FROM employees;


# Why Use JSON?
# Suppose employee information changes frequently:

```json
{
  "city":"Gurgaon",
  "skills":["SQL","Python","Spark"],
  "certification":"GH-300"
}
```

Creating separate columns for every attribute becomes difficult.

JSON allows flexible storage.

---

# Interview Follow-Up Questions

### When would you use JSON?

**Answer:**

When:

* Schema changes frequently.
* Data is semi-structured.
* Different rows may have different attributes.

---

### Difference Between Structured and JSON Data?

**Structured**

```text
employee_id
emp_name
salary
department
```

Fixed schema.

---

**JSON**

```json
{
  "department":"IT",
  "skills":["Python","SQL"]
}
```

Flexible schema.

---

# Interview Answer (30 Seconds)

> JSON data can be stored using a JSON column type. Values can be queried using functions such as `JSON_EXTRACT()` or operators like `->>` in MySQL/PostgreSQL. JSON is useful for storing semi-structured or flexible data where attributes may vary between records.

### Pattern Name

This belongs to:

* JSON Processing
* Semi-Structured Data
* Document Storage in SQL
* JSON Functions

Whenever you hear:

> "Store flexible or semi-structured data"

Think:

```sql
JSON
JSON_EXTRACT()
->>
```

These are the key concepts interviewers usually test.
