-- Practice file 78
## Full-Text Search (30-Second Interview Recap)

### What is it?

A **Full-Text Index** is a special index used for **fast searching of text data**.

Instead of:

```sql
SELECT *
FROM employees
WHERE first_name LIKE '%john%';
```

Use:

```sql
SELECT *
FROM employees
WHERE MATCH(first_name)
AGAINST('john');
```

---

### Why use it?

For large tables:

```text
LIKE '%john%'
```

❌ Scans many rows

```text
FULLTEXT INDEX
```

✅ Uses an optimized text-search index

---

### Create Full-Text Index

```sql
CREATE FULLTEXT INDEX idx_first_name
ON employees(first_name);
```

---

### Search Query

```sql
SELECT *
FROM employees
WHERE MATCH(first_name)
AGAINST('john');
```

---

### Internal Working

Normal Index:

```text
John → Row 1
Mike → Row 2
```

Full-Text Index (Inverted Index):

```text
john → rows 1,5,8
mike → rows 2,7
```

### Interview Keyword

⭐ **Inverted Index**

> Stores Word → Rows mapping.

---

### FULLTEXT vs LIKE

| LIKE                 | FULLTEXT            |
| -------------------- | ------------------- |
| Slower on large text | Faster              |
| Pattern matching     | Text search         |
| No inverted index    | Uses inverted index |
| `%john%`             | `MATCH AGAINST`     |

---

### Memory Trick

Think of **Google Search**:

```text
LIKE
=
Read every page

FULLTEXT
=
Google already knows
where the word exists
```

---

### One-Line Interview Answer

> A Full-Text Index is used for efficient text searching. It creates an inverted index and allows fast searches using `MATCH()` and `AGAINST()`, which is much more efficient than using `LIKE '%value%'` on large datasets.
