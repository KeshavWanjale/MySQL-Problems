-- 1 INNER JOIN - selects records that have matching values in both tables.
-- 2 LEFT JOIN (or LEFT OUTER JOIN) - returns all rows from the left table, and the matched rows from the right table.
-- 3 RIGHT JOIN (or RIGHT OUTER JOIN) - returns all rows from the right table, and the matched rows from the left table.
-- 4 FULL OUTER JOIN (simulated in mysql) - returns all records when there is a match in either left or right table.
-- 5 CROSS JOIN - returns the Cartesian product of both tables, meaning it returns all possible combinations of rows from both tables.
-- 6 SELF JOIN - is a join where a table is joined with itself.


CREATE DATABASE CompanyDB2;
USE CompanyDB2;

CREATE TABLE Departments (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(255)
);

CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    DepartmentID INT ,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID),
    ManagerID INT
);

INSERT INTO Departments (DepartmentName) VALUES ('HR');
INSERT INTO Departments (DepartmentName) VALUES ('IT');
INSERT INTO Departments (DepartmentName) VALUES ('Finance');
INSERT INTO Departments (DepartmentName) VALUES ('Operations');

INSERT INTO Employees (FirstName, LastName, DepartmentID, ManagerID) 
VALUES 
('John', 'Doe', 1, NULL),  
('Jane', 'Smith', 2, 1),   
('Michael', 'Brown', 2, 1),
('Sarah', 'Davis', 1, 2),
('Peter', 'Parker', NULL, 2); 

SELECT * FROM employees;
SELECT * FROM departments;

-- 1 INNER JOIN
SELECT Employees.FirstName, Departments.DepartmentName
FROM Employees
INNER JOIN Departments
ON Employees.DepartmentID = Departments.DepartmentID;

-- 2 LEFT JOIN
SELECT Employees.FirstName, Departments.DepartmentName
FROM Employees
LEFT JOIN Departments
ON Employees.DepartmentID = Departments.DepartmentID;

-- 3 RIGHT JOIN 
SELECT Employees.FirstName, Departments.DepartmentName
FROM Employees
RIGHT JOIN Departments
ON Employees.DepartmentID = Departments.DepartmentID;

-- 4 FULL OUTER JOIN
SELECT Employees.FirstName, Departments.DepartmentName
FROM Employees
LEFT JOIN Departments
ON Employees.DepartmentID = Departments.DepartmentID
UNION
SELECT Employees.FirstName, Departments.DepartmentName
FROM Employees
RIGHT JOIN Departments
ON Employees.DepartmentID = Departments.DepartmentID;

-- 5 CROSS JOIN
SELECT Employees.FirstName, Departments.DepartmentName
FROM Employees
CROSS JOIN Departments;

-- 6 SELF JOIN
SELECT e.FirstName AS Employee, m.FirstName AS Manager
FROM Employees e
LEFT JOIN Employees m
ON e.ManagerID = m.EmployeeID;





