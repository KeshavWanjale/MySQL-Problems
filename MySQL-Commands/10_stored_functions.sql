-- Stored Function is a user-defined function that returns a single value and can be used in SQL statements.
-- Unlike stored procedures, stored functions can be called directly within queries like SELECT, WHERE, or even in expressions.
-- 
-- function_name: The name of the function.
-- parameter: Optional. You can pass parameters to the function.
-- datatype: The type of value the function returns (e.g., INT, VARCHAR, DATE).
-- BEGIN...END: Contains the logic of the function.
-- RETURN: Returns a value of the specified data type.

use companydb2

-- 1 function to find square of a number
DELIMITER $$
CREATE FUNCTION SquareNumber(num INT)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN num * num;
END $$
DELIMITER ;


-- 2 concat two str
DELIMITER //
CREATE FUNCTION FullName(first_name VARCHAR(100), last_name VARCHAR(100))
RETURNS VARCHAR(200)
DETERMINISTIC
BEGIN
    RETURN CONCAT(first_name, ' ', last_name);
END //
DELIMITER ;

-- 3 Find the count of employees in department
DELIMITER //
CREATE FUNCTION CountEmployees(dept_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE emp_count INT;
    SELECT COUNT(*) INTO emp_count
    FROM Employees
    WHERE DepartmentID = dept_id;
    RETURN emp_count;
END //
DELIMITER ;

DROP FUNCTION IF EXISTS CountEmployees;

select SquareNumber(5) as Square_Of_Number;

select Fullname('Keshav', 'Wanjale') full_name;

select CountEmployees(1) as No_of_emp_in_dept_1;