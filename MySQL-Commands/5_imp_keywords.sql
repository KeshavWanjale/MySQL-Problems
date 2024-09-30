USE companydb;
SELECT * FROM employees;

-- Where - To define some conditions
SELECT * FROM employees WHERE FirstName = "John";


-- *** Operators ***
-- 1 Comparison Operators: = , !=, >, <, >=, <=
-- 2 Logical Operators: AND, OR, NOT
-- 3 Arithmetic Operators: + - % * /
-- 4 BETWEEN: True if the value is within the range	//WHERE Salary BETWEEN 50000 AND 70000
-- 5 Like (%, _) [Wild card]
-- 6 Null Operators: IS NULL, IS NOT NULL
-- 7 IN: Matches any value in a specified list , NOT IN
-- 8 EXISTS: Returns true if a subquery returns any rows.

SELECT * FROM Employees
WHERE EmployeeID IN (1, 3, 5)
AND Salary > 60000
AND FirstName LIKE "_o%";
