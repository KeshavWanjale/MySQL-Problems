-- Stored Procedure in MySQL is a set of SQL statements that can be stored in the database and reused multiple times. 
-- Stored procedures are designed to perform operations like inserting data, updating data, or performing calculations. 
-- procedure_name: The name of the stored procedure.
-- parameter: Optional. You can pass parameters (IN, OUT, or INOUT).
-- BEGIN...END: Encapsulates the SQL statements inside the stored procedure.

-- Types of parameters
-- IN: The default parameter type. It passes a value into the procedure.
-- OUT: Used to return a value from the procedure to the caller.
-- INOUT: Allows passing a value into the procedure, and the procedure can modify and return the new value

-- 1: A Simple Stored Procedure
DELIMITER //
CREATE PROCEDURE HelloWorld()
BEGIN
    SELECT 'Hello, World!';
END //
DELIMITER ;

-- 2: Stored Procedure with Input Parameter
DELIMITER //
CREATE PROCEDURE GetEmployeeInfo(emp_id INT)
BEGIN
    SELECT EmployeeID, FirstName, LastName, DepartmentID
    FROM Employees
    WHERE EmployeeID = emp_id;
END //
DELIMITER ;

-- 3: Stored Procedure with Output Parameter
DELIMITER //
CREATE PROCEDURE SumNumbers(IN num1 INT, IN num2 INT, OUT sum_result INT)
BEGIN
    SET sum_result = num1 + num2;
END //
DELIMITER ;

-- 4: Stored Procedure with INOUT Parameter
DELIMITER //
CREATE PROCEDURE MultiplyByTen(INOUT num INT)
BEGIN
    SET num = num * 10;
END //
DELIMITER ;

-- 5: Conditional statements
DELIMITER //
CREATE PROCEDURE DeptName(IN emp_id INT, OUT result VARCHAR(100))
BEGIN
    DECLARE dept_id int;
    -- Retrieve the salary of the employee
    SELECT DepartmentID INTO dept_id FROM Employees WHERE EmployeeID = emp_id;
    -- Check the salary condition
    IF dept_id  = 2 THEN
        SET result = 'Works In IT';
	ELSE 
		SET result = 'Works In Unknown';
    END IF;
END //
DELIMITER ;


DROP PROCEDURE IF EXISTS GetEmployeeInfo;

CALL Helloworld();

CALL GetEmployeeinfo(1);

CALL SumNumbers(10, 20, @total);
SELECT @total;

SET @number = 5;
CALL MultiplyByTen(@number);
SELECT @number;

call CountToN(5);

CALL DeptName(2, @name);
SELECT @name as dept_name;



