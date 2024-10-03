-- ACID refers to four key properties that ensure reliable and consistent transaction processing. 
-- Transactions are single logical unit of work by set of operations.

-- The ACID acronym stands for:
-- 1 Atomicity This means that all operations within the transaction must either complete successfully or fail entirely. 
--  	If any part of the transaction fails, the entire transaction is rolled back, and no changes are made to the database.
-- 2 Consistency Consistency ensures that a database starts in a consistent state and ends in a consistent state after a transaction is executed.
-- 3 Isolation Isolation ensures that the operations within a transaction are invisible to other transactions until the transaction is committed. 
--      Different transactions should not interfere with one another.
-- 4 Durability Durability guarantees that once a transaction is committed, it will be permanently saved in the database, even in the case of a 
--      system crash or power failure

START TRANSACTION;

-- Atomicity: Either both updates succeed or none
-- Consistency: Ensure balance is correctly transferred, without violating constraints
-- Isolation: Other transactions do not interfere with this process
-- Durability: After COMMIT, changes are saved permanently

UPDATE Accounts
SET balance = balance - 200
WHERE account_number = '123456'; -- Deduct $200 from Account A

UPDATE Accounts
SET balance = balance + 200
WHERE account_number = '654321'; -- Add $200 to Account B

COMMIT;

-- ***-***

-- Normalization is the process of organizing data in a database to minimize redundancy and improve data integrity. 
-- The goal is to divide large tables into smaller, related tables and establish relationships between them to avoid anomalies 
-- during insertions, updates, and deletions.


-- 1st Normal Form (1NF): Table should not contains the multivalued attributes(each column should be atomic)
-- 2nd Normal Form (2NF): 1 table to be in 1NF. 2 The table should not possess partial dependency.(PD- Only part of primary key identify non-prime atri)
-- 3rd Normal Form (3NF): 1 table to be in 2NF. 2 The table should not possess trasitive dependency.(TD-NON prime attribute identifies non prime att)
-- Boyce-Codd Normal Form (BCNF): 1 table to be in 2NF. 2 every RHS attribute of the functional dependencies should depend on the super key of that particular table.

