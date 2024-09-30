-- Constraints: are rules enforced on data columns to maintain the integrity, validity, and consistency of the data in the database.
-- 1. NOT NULL	Ensures that a column cannot have a NULL value.
-- 2. UNIQUE	Ensures that all values in a column (or group of columns) are unique.
-- 3. PRIMARY KEY	Uniquely identifies each record in a table, combining UNIQUE and NOT NULL.
-- 4. FOREIGN KEY	Creates a relationship between two tables and ensures referential integrity.
-- 5. CHECK	Ensures that all values in a column satisfy a specific condition. (Available from MySQL 8.0+)
-- 6. DEFAULT	Assigns a default value to a column when no value is provided.
-- 7. AUTO_INCREMENT	Automatically generates a unique number for a column, typically used with primary keys.

-- A. Creating Constraints while creating tables
CREATE TABLE Employees (
    EmployeeID int AUTO_INCREMENT PRIMARY KEY,     -- Primary Key and Auto Increment
    FirstName varchar(255) NOT NULL,               -- NOT NULL Constraint
    LastName varchar(255) NOT NULL,
    Email varchar(255) UNIQUE,                     -- UNIQUE Constraint
    HireDate date NOT NULL,
    Salary decimal(10, 2) CHECK (Salary > 0),      -- CHECK Constraint (positive salary)
    DepartmentID int,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID),  -- FOREIGN KEY Constraint
    Status varchar(50) DEFAULT 'Active'            -- DEFAULT Constraint
);

-- composite Primary key
CREATE TABLE CourseEnrollments (
    StudentID int,
    CourseID int,
    PRIMARY KEY (StudentID, CourseID)  -- Composite primary key
);

-- B. Adding constraints after Table Creation (Using ALTER)
-- Add NOT NULL constraint
ALTER TABLE Employees
MODIFY LastName varchar(255) NOT NULL;
-- Add UNIQUE constraint
ALTER TABLE Employees
ADD CONSTRAINT unique_email UNIQUE (Email);
-- Add PRIMARY KEY constraint
ALTER TABLE Employees
ADD PRIMARY KEY (EmployeeID);
-- Add FOREIGN KEY constraint
ALTER TABLE Employees
ADD CONSTRAINT fk_department FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID);
-- Add CHECK constraint
ALTER TABLE Employees
ADD CONSTRAINT chk_salary CHECK (Salary > 0);

-- C. Drop constraints 
-- Drop the PRIMARY KEY
ALTER TABLE Employees
DROP PRIMARY KEY;
-- Drop the FOREIGN KEY
ALTER TABLE Employees
DROP FOREIGN KEY fk_department;
-- Drop the UNIQUE constraint
ALTER TABLE Employees
DROP INDEX unique_email;
-- drop unique constraints
ALTER TABLE Persons
DROP INDEX unique_email;








