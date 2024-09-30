-- *** Keys In SQL ***

-- 1. Primary Key:	Uniquely identifies each record; no NULL values. 
-- only one per table
CREATE TABLE Persons (
    PersonID int AUTO_INCREMENT PRIMARY KEY,
    LastName varchar(255),
    FirstName varchar(255)
);

-- 2. Foreign Key: uniquely identifies a row in another table.
-- creates a relationship between the two tables, ensuring referential integrity.
-- The values in the foreign key column must match values in the primary key column of the referenced table or be NULL.
CREATE TABLE Orders (
    OrderID int AUTO_INCREMENT PRIMARY KEY,
    PersonID int,
    FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
);

-- 3. Unique Key: Ensures all values in a column are unique; allows one NULL.
-- A table can have multiple unique keys.
CREATE TABLE Users (
    UserID int AUTO_INCREMENT PRIMARY KEY,
    Email varchar(255) UNIQUE
);

-- 4. Composite Key	Combines two or more columns to form a primary key.
-- useful in scenarios where no single column can uniquely identify a record.
CREATE TABLE CourseEnrollments (
    StudentID int,
    CourseID int,
    PRIMARY KEY (StudentID, CourseID)
);

--  5. Candidate Key
-- A Candidate Key is a column (or a set of columns) that can uniquely identify records in a table.
-- There can be multiple candidate keys in a table, and one of them is chosen as the primary key.
-- Example: In a Users table, both Email and Username could serve as candidate keys if they are both unique.

--  6. Alternate Key
-- An Alternate Key is a candidate key that is not chosen as the primary key. It still enforces uniqueness in the table.
-- Example: If Email is the primary key in a Users table, then Username could be considered an alternate key.