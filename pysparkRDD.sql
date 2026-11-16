



---

# 7. Transformations



---

# 8. Actions



---

# Lazy Evaluation

```python
rdd1 = sc.parallelize([1,2,3])

rdd2 = rdd1.map(lambda x:x*2)

rdd3 = rdd2.filter(lambda x>2)
```

Nothing runs yet.

Only when:

```python
rdd3.collect()
```

Spark creates execution plan.

---

# 10. Lineage

 

Check:

```python
rdd.toDebugString()
```

Example:

```text
RDD1
 ↓ map
RDD2
 ↓ filter
RDD3
```

Used for recovery.

---

# 11. Persistence

Without cache:

```text
Action 1 -> recompute
Action 2 -> recompute
Action 3 -> recompute
```

---

Cache:

```python
rdd.cache()
```

or

```python
rdd.persist()
```

Stored in memory.

---

# 12. Cache vs Persist

| Cache       | Persist               |
| ----------- | --------------------- |
| Memory only | Memory + Disk options |
| Shortcut    | Flexible              |

```python
rdd.cache()
```

```python
rdd.persist()
```

---

# 13. Narrow vs Wide Transformations

Very important.

---

## Narrow

Child partition depends on one parent partition.

Examples:

```python
map()
filter()
flatMap()
```

```text
P1 → P1
P2 → P2
```

No shuffle.

Fast.

---

## Wide

Child partition depends on multiple partitions.

Examples:

```python
groupByKey()
reduceByKey()
join()
distinct()
```

```text
P1 ↘
     P3
P2 ↗
```

Shuffle happens.

Slow.

---

# 14. Shuffle

Data movement across executors.

Most expensive Spark operation.

Triggered by:

```python
groupByKey
join
distinct
repartition
reduceByKey
```

Interview:

**Why is shuffle expensive?**

* Disk I/O
* Network I/O
* Serialization
* Deserialization

---

# 15. Pair RDD

RDD containing key-value pairs.

```python
rdd = sc.parallelize([
("A",1),
("A",2),
("B",3)
])
```

---

# 16. reduceByKey()

Most asked question.

```python
rdd.reduceByKey(lambda x,y:x+y)
```

Output:

```text
A 3
B 3
```

---

# 17. groupByKey vs reduceByKey

Extremely common interview question.

### groupByKey

```python
rdd.groupByKey()
```

Moves all values.

```text
A -> [1,2,3]
```

Large shuffle.

---

### reduceByKey

```python
rdd.reduceByKey(lambda x,y:x+y)
```

Local aggregation first.

Less shuffle.

Faster.

### Interview Answer

**Always prefer reduceByKey over groupByKey for aggregation.**

---

# 18. coalesce vs repartition

### repartition()

```python
rdd.repartition(10)
```

Shuffle occurs.

Can increase/decrease partitions.

---

### coalesce()

```python
rdd.coalesce(2)
```

Usually no shuffle.

Used to reduce partitions.

---

# 19. Broadcast Variables

Used to send small lookup tables.

```python
lookup = sc.broadcast(
    {"A":"India"}
)
```

Avoids sending repeatedly.

---

# 20. Accumulators

Used for counters.

```python
acc = sc.accumulator(0)

rdd.foreach(lambda x: acc.add(x))

print(acc.value)
```

---

# 21. Common Interview Questions

### Q1. What is RDD?

Distributed immutable collection processed in parallel.

---

### Q2. Why immutable?

Ensures fault tolerance and consistency.

---

### Q3. How does RDD recover from failure?

Using lineage.

---

### Q4. Difference between RDD and DataFrame?

| RDD         | DataFrame  |
| ----------- | ---------- |
| Low level   | High level |
| No schema   | Schema     |
| No Catalyst | Catalyst   |
| Slower      | Faster     |
| Type safe   | Structured |

---

### Q5. What is lineage?

Execution history used for recovery.

---

### Q6. What is lazy evaluation?

Transformations are not executed until an action is called.

---

### Q7. What is a shuffle?

Movement of data across partitions/executors.

---

### Q8. Why is reduceByKey better than groupByKey?

Performs local aggregation before shuffle, reducing network traffic.

---

### Q9. What is partitioning?

Splitting RDD into chunks for parallel processing.

---

### Q10. Why are RDDs rarely used nowadays?

Because DataFrames:

* Use Catalyst Optimizer
* Use Tungsten Engine
* Generate optimized execution plans
* Require less code
* Perform better

---

## Practical RDD Questions Often Asked

### Word Count

```python
rdd = sc.textFile("file.txt")

(rdd
 .flatMap(lambda x:x.split())
 .map(lambda word:(word,1))
 .reduceByKey(lambda x,y:x+y)
 .collect())
```

---

### Remove Duplicates

```python
rdd.distinct()
```

---

### Find Maximum

```python
rdd.reduce(lambda x,y:max(x,y))
```

---

### Count Even Numbers

```python
rdd.filter(lambda x:x%2==0).count()
```

---

### Sort Data

```python
rdd.sortBy(lambda x:x)
```

---

For a **2.5-year Data Engineer interview**, expect deep questions on:

* RDD vs DataFrame vs Dataset
* Transformations vs Actions
* Lazy Evaluation
* Lineage
* Narrow vs Wide Transformations
* Shuffle
* Partitions
* Cache vs Persist
* reduceByKey vs groupByKey
* repartition vs coalesce

These are the Spark fundamentals interviewers use to judge whether you truly understand Spark internals.



# RDD Operations

## 1. Transformations

Create a new RDD.

Examples:

```python
map()
filter()
flatMap()
distinct()
union()
```

Transformations create new RDDs.

### Lazy

Nothing executes immediately.

---

## map()

```python
rdd.map(lambda x:x*2)
```

Output:

```text
[2,4,6,8]
```

---

## filter()

```python
rdd.filter(lambda x:x>2)
```

Output:

```text
[3,4,5]
```

---

## flatMap()

```python
rdd = sc.parallelize(["hello world"])
```

```python
rdd.flatMap(lambda x:x.split())
```

Output:

```text
hello
world
```

---

## distinct()

```python
rdd.distinct()
```

Removes duplicates.

---

## union()

```python
rdd1.union(rdd2)
```

Combines data.

Duplicates remain.

---

## intersection()

```python
rdd1.intersection(rdd2)
```

Common values.

---

## subtract()

```python
rdd1.subtract(rdd2)
```

Difference.








---

### Example

```python
rdd = spark.sparkContext.parallelize([1,2,3,4])

new_rdd = rdd.map(lambda x: x*2)
```

Output:

```text
2
4
6
8
```

---

## 2. Actions

Return results.

Examples:

```python
collect()
count()
take()
first()
reduce()
```


Actions trigger execution.

---

## collect()

```python
rdd.collect()
```

Returns all data to driver.

Dangerous for huge datasets.

---

## count()

```python
rdd.count()
```

---

## first()

```python
rdd.first()
```

---

## take()

```python
rdd.take(5)
```

---

## reduce()

```python
rdd.reduce(lambda x,y:x+y)
```

---

## saveAsTextFile()

```python
rdd.saveAsTextFile("output")
```



# What is a Partition?

RDD data is divided into partitions.

Example:

```python
rdd = sc.parallelize(range(100),4)
```

Partitions:

```text
Partition 1
Partition 2
Partition 3
Partition 4
```

---

Check partitions:

```python
rdd.getNumPartitions()
```



# In Real Projects

For a Data Engineer at Accenture or in most modern Spark projects:

You'll usually see:

```python
df = spark.read.parquet(...)
df = spark.read.table(...)
df = spark.read.csv(...)
```

You rarely see:

```python
rdd = sc.parallelize(...)
```

because DataFrames are preferred.

---

# Interview Answer (2.5 Years Experience)

> RDD (Resilient Distributed Dataset) is Spark's fundamental distributed data structure. It stores data across multiple partitions and enables parallel processing with fault tolerance through lineage. RDD supports low-level transformations and actions but does not have schema information or query optimization. While RDD provides flexibility and fine-grained control, modern Spark applications primarily use DataFrames because they support schema enforcement, SQL operations, Catalyst optimization, and better performance.

---

# One-Liner Memory Trick

```text
RDD = Raw Distributed Data
DataFrame = Structured Optimized Data
```

Or:

```text
RDD = Control
DataFrame = Performance
```

That's the easiest way to remember why Spark moved from **RDD → DataFrame → Dataset** over time.
