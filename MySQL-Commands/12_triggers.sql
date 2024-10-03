-- A trigger in MySQL is a set of SQL statements that automatically execute (or "fire") in response to certain events on a particular table, 
-- such as an INSERT, UPDATE, or DELETE operation. Triggers are commonly used for maintaining data integrity, logging changes, 
-- enforcing business rules, and performing automatic tasks.

-- SYNTAX
-- CREATE TRIGGER trigger_name    
--     (AFTER | BEFORE) (INSERT | UPDATE | DELETE)  
--          ON table_name FOR EACH ROW    
--          BEGIN    
--         --variable declarations    
--         --trigger code    
--         END;     

use companydb2;

-- 1 Before Insert
DELIMITER //
CREATE TRIGGER before_employee_insert
BEFORE INSERT ON Employees
FOR EACH ROW
BEGIN
    SET NEW.LastName = UPPER(NEW.LastName);
END //
DELIMITER ;

-- 2 Before Delete
DELIMITER //
CREATE TRIGGER before_employee_delete
BEFORE DELETE ON Employees
FOR EACH ROW
BEGIN
    IF OLD.DepartmentID = 1 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete employees from HR department';
    END IF;
END //
DELIMITER ;

-- 3 Before Update
DELIMITER //
CREATE TRIGGER before_update
BEFORE UPDATE ON Employees
FOR EACH ROW
BEGIN
    IF OLD.managerID != NEW.managerID THEN
        
    END IF;
END //
DELIMITER ;

INSERT INTO Employees (FirstName, LastName, DepartmentID, ManagerID)
VALUES ('Tony', 'stark', 3,2);
select * from employees;


delete from employees where employeeID = 1;

