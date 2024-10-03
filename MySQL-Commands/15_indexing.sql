-- Indexing is used to (Performance tunning)optimise the performance of a database by minimising the number of disk accesses required when a query is processed.
-- Indexing creates a lookup table with the column and pointer to the memory location of the row, containing this column
-- Btrees ds is used to store the indexing as it is a multilevel format of tree based indexing, which has balanced binary search trees.

-- use indexing only on read intensive databases as after updation or deletion we have to again sort the indexes

use companydb2;

CREATE INDEX idx_lastname ON Employees (LastName);

SHOW INDEX FROM employees;

SELECT * FROM Employees WHERE LastName = 'Doe';

DROP INDEX idx_lastname ON Employees;


