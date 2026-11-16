/*
You need to create a table that records
the current timestamp when a row is
inserted.
*/

/*Question:
How can you use DEFAULT with the TIMESTAMP column?

Using DEFAULT CURRENT_TIMESTAMP, SQL automatically
records the insertion time.
*/

CREATE TABLE logs(
    log_id INT PRIMARY KEY,
    description VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

desc logs;

select * from logs;

insert into logs(log_id,description)
values(10231, 'row1');