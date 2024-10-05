-- cursor in MySQL is a database object used to retrieve and manipulate data row-by-row from a result set.
-- While SQL queries usually operate on sets of rows, sometimes you may need to process each row individually, 
-- which is where cursors come into play.

-- Cursors allow you to iterate over a set of rows returned by a query, making it easier to perform row-by-row 
-- processing inside stored procedures, functions, or triggers.

-- Row-by-Row Processing: Cursors allow you to fetch and process rows one at a time, making them useful for procedural tasks where you need to handle each row separately.
-- Used in Stored Procedures: Cursors are often used in stored procedures to process each row of a query result.
-- Temporary: A cursor is only valid within the context of the procedure, function, or block of code where it's declared.

-- SYNTAX:-
-- DECLARE cursor_name CURSOR FOR SELECT_statement;
-- OPEN cursor_name;
-- FETCH cursor_name INTO variable1, variable2, ...;
-- CLOSE cursor_name;

-- Cursors are Used with Storoed Procedures

DELIMITER $$
CREATE PROCEDURE ListEmployees()
BEGIN
    -- Declare variables to hold employee data
    DECLARE v_first_name VARCHAR(100);
    DECLARE v_last_name VARCHAR(100);
    DECLARE v_salary DECIMAL(10, 2);
    DECLARE done INT DEFAULT 0;
    -- Declare a cursor for the SELECT statement
    DECLARE employee_cursor CURSOR FOR
    SELECT FirstName, LastName, Salary FROM Employees2;
    -- Declare a CONTINUE HANDLER to set the 'done' variable when no more rows are found
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    -- Open the cursor
    OPEN employee_cursor;
    -- Loop to fetch each row from the cursor
    FETCH_LOOP: LOOP
        -- Fetch the next row into variables
        FETCH employee_cursor INTO v_first_name, v_last_name, v_salary;
        -- Exit loop when no more rows are available
        IF done = 1 THEN
            LEAVE FETCH_LOOP;
        END IF;
        -- Output the employee data 
        SELECT CONCAT(v_first_name, ' ', v_last_name, ': ', v_salary) AS EmployeeDetails;
    END LOOP FETCH_LOOP;
    -- Close the cursor when done
    CLOSE employee_cursor;
END$$
DELIMITER ;


CALL ListEmployees();

Drop Procedure ListEmployees;

