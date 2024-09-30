-- create Database
create database practice;

-- use database
use practice;

-- *** DDL(Structure,AutoCommit) ***
-- 1. Create Table
CREATE TABLE Persons (
    PersonID int AUTO_INCREMENT PRIMARY KEY,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
);

-- 2. Alter table structure
-- 	2A. ADD Column
ALTER TABLE Persons ADD Email varchar(255);
-- 	2B Modify column
ALTER TABLE persons MODIFY email varchar(300);
--  2C Drop Column
ALTER TABLE persons DROP COLUMN Email;
--  2D Rename column
ALTER TABLE table_name RENAME COLUMN old_name to new_name;

-- 3. Drop(deletes whole structure of Table)
drop table practice;

-- 4. Truncate(Deletes only data, structure remains intact)
truncate table practice;

-- 5. Rename
RENAME TABLE Old_Table_Name TO New_Table_Name;  
-- *** - ***


-- *** DML(Table,No AutoCommit) ***
-- 1 insert data
-- 	1A. Single Record
INSERT INTO Persons (LastName, FirstName, Address, City) 
VALUES ('Smith', 'John', '123 Main St', 'New York');
-- 	1B. Multiple records
INSERT INTO Persons (LastName, FirstName, Address, City)
VALUES 
('Doe', 'Jane', '456 Elm St', 'Los Angeles'),
('Johnson', 'Mark', '789 Oak St', 'Chicago');
-- 	1C. specific column
INSERT INTO Persons (LastName, City)
VALUES ('Brown', 'San Diego');

-- 2 Update Record
UPDATE Persons 
SET FirstName = 'Peter'
WHERE PersonID = 4;

-- 3 Delete
-- 	3A deletes record
DELETE FROM Persons 
WHERE PersonID = 4;
-- 	3B Deletes all records from table
DELETE FROM Persons;
-- *** - ***


-- *** DCL (DATA Control Language) ***
-- 	1. GRANT command is used to give users specific privileges on database objects.
-- grant a user named user1 the ability to select and insert data
GRANT SELECT, INSERT ON Persons TO 'user1'@'localhost';
SHOW GRANTS FOR 'user1'@'localhost';

-- 	2. Revoke command is used to remove specific privileges from users.
REVOKE SELECT ON Persons FROM 'user1'@'localhost';
-- *** - ***


-- *** TCL(Transaction Control Language) ***
-- 	1. COMMIT: Saves all the changes made in the current transaction.
START TRANSACTION;  -- Start the transaction
INSERT INTO Persons (LastName, FirstName, Address, City) 
VALUES ('Smith', 'John', '123 Main St', 'New York');
INSERT INTO Persons (LastName, FirstName, Address, City) 
VALUES ('Doe', 'Jane', '456 Elm St', 'Los Angeles');
COMMIT;  -- Save the changes

-- 	2. ROLLBACK: Undoes changes made in the current transaction.
START TRANSACTION;  -- Start the transaction
INSERT INTO Persons (LastName, FirstName, Address, City) 
VALUES ('Johnson', 'Mark', '789 Oak St', 'Chicago');
ROLLBACK;  -- Undo the changes made in this transaction

-- 	3. SAVEPOINT: Creates a point within a transaction to which you can later roll back.
START TRANSACTION;  -- Start the transaction
INSERT INTO Persons (LastName, FirstName, Address, City) 
VALUES ('Anderson', 'Peter', '101 Pine St', 'San Francisco');
SAVEPOINT savepoint1;  -- Create a savepoint
INSERT INTO Persons (LastName, FirstName, Address, City) 
VALUES ('Taylor', 'Alice', '202 Maple St', 'Miami');
ROLLBACK TO savepoint1;  -- This will undo the last insert but keep the first insert
COMMIT;  -- Save changes up to the first insert
-- *** - ***


-- *** DQL ***
SELECT * FROM  Persons;