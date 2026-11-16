-- Practice file 75
/*
A clustered index determines the physical storage order of rows. In SQL Server, it can be created explicitly using CREATE CLUSTERED INDEX. 
In MySQL InnoDB, the primary key automatically becomes the clustered index, so defining employee_id as the primary key is sufficient to create a clustered index on that column.

*/

Clustered Index= Actual Data Sorted
Non-Clustered Index= Pointer to Data


A clustered index determines the physical order of rows in a table, and its leaf nodes contain the actual data. 
A non-clustered index stores index keys and pointers to the data rows. 
A table can have only one clustered index but multiple non-clustered indexes. In MySQL InnoDB, the primary key is clustered by default.

