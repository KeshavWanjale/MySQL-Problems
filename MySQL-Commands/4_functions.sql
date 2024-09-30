CREATE DATABASE CompanyDB;

USE CompanyDB;

CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary DECIMAL(10, 2),
    JoinDate DATE
);

INSERT INTO Employees (FirstName, LastName, Salary, JoinDate)
VALUES
('John', 'Doe', 50000.00, '2022-03-15'),
('Jane', 'Smith', 60000.00, '2021-07-10'),
('Michael', 'Johnson', 70000.00, '2020-01-25'),
('Sarah', 'Brown', 80000.00, '2019-09-05'),
('David', 'Wilson', 75000.00, '2022-12-01');

-- *** String Functions ***
-- 1 Concat - Concatenate the two string
SELECT CONCAT(FirstName, ' ', LastName) AS FullName
FROM Employees;
-- 2 Uppercase converts the string to Uppercase
SELECT UPPER(LastName) AS LastNameUpper
FROM Employees;
-- 3 LOWER() converts the string to lower case
SELECT LOWER(FirstName) AS FirstNameLower
FROM Employees;
-- 4 SUBSTRING() - returns the substring
SELECT SUBSTRING(LastName, 1, 3) AS LastNameSubstring
FROM Employees;
-- 5  Length - Returns the length of a string
SELECT LENGTH(FirstName) AS FirstNameLength
FROM Employees;
-- 6 Reverse - reverse the string
SELECT REVERSE(FirstName) as ReverseName 
From Employees;
-- 7 Replace - Replaces all occurrences of a substring within a string, with a new substring
SELECT REPLACE("SQL WORLD", "SQL", "HELLO");
-- 8 LOCATE() function returns the position of the first occurrence of a substring in a string.
SELECT LOCATE("e", "Keshave") ;
-- 9 LTRIM() function removes leading spaces from a string.
SELECT LTRIM("     Hello World");
-- 10 RTRIM() function removes trailing spaces from a string.
SELECT LTRIM("Hello World		");
-- 11 TRIM - Remove leading and trailing spaces from a string:
SELECT LTRIM("		Hello World		");


-- *** MATH ***
-- AGGREGATE FUNCTIONS
-- 1. COUNT() – Counts the number of rows.
-- 2. SUM() – Calculates the sum of a column.
-- 3. AVG() – Calculates the average of a column.
-- 4. MIN() – Finds the minimum value in a column.
-- 5. MAX() – Finds the maximum value in a column.
SELECT COUNT(*) AS TotalEmployees,
AVG(Salary) AS AverageSalary,
MIN(Salary) AS MinimumSalary,
MAX(Salary) AS MaximumSalary,
SUM(Salary) AS TotalSalary
FROM Employees;

-- FLOOR() rounds down to the nearest integer.
SELECT FLOOR(25.20);
-- CEIL() rounds up to the nearest integer.
SELECT CEIL(25.20);
-- POWER() - Raise a Number to a Power
SELECT POWER(10,2);
-- SQRT() function returns the square root of a number.
SELECT SQRT(13);
-- ROUND() function rounds a number to a specified number of decimal places.
SELECT ROUND(4.55555,3);


-- *** DATE TIME ***
-- 1 Get the current date and time
SELECT NOW();
-- 2 DATE_FORMAT Format the JoinDate as DD/MM/YYYY
SELECT FirstName, LastName, DATE_FORMAT(JoinDate, '%d/%m/%Y')
FROM Employees;
-- 3 YEAR - getting year from date
SELECT JoinDate, YEAR(JoinDate)
FROM Employees;
-- 4 MONTH
SELECT JoinDate, MONTH(JoinDate)
FROM Employees;
-- 5 DAY
SELECT JoinDate, DAY(JoinDate) 
FROM Employees;
-- 6 CURDATE returns Currrent date
SELECT CURDATE();
-- 7 CURRENT_TIMESTAMP function returns the current date and time.
SELECT CURRENT_TIMESTAMP();
-- 8 DATEDIFF() function returns the number of days between two date values.
SELECT DATEDIFF("2024-06-25", "2023-06-15");
-- 9 ADDDATE() function adds a date interval to a date and then returns the date.
SELECT ADDDATE("2024-09-28", INTERVAL 10 DAY);
-- 10 SUBDATE() function subtracts a date interval from a date and then returns the date.
SELECT SUBDATE("2024-09-28", INTERVAL 10 DAY);
