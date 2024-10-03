CREATE TABLE Employees2 (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary INT,
    DepartmentID INT
);
drop table Employees2;

INSERT INTO Employees2 (EmployeeID, FirstName, LastName, Salary, DepartmentID)
VALUES (1, 'John', 'Doe', 50000, 1),
       (2, 'Jane', 'Smith', 60000, 1),
       (3, 'Mike', 'Johnson', 40000, 2),
       (4, 'Emily', 'Davis', 45000, 2);
       
-- 1 Subquery
-- simple subquery is an independent query inside a main query. It is executed once for the entire main query and returns a value or set 
-- of values that are used by the outer query. The inner query is independent of the outer query.
SELECT FirstName, LastName
FROM Employees2
WHERE Salary > (SELECT AVG(Salary) FROM Employees2);


-- 2 correlated subquery is a subquery that depends on the outer query. It is executed once for each row processed by the outer query. 
-- The inner query refers to columns in the outer query, making the execution of the inner query dependent on each row processed by the outer query.
SELECT FirstName, LastName
FROM Employees2 e1
WHERE Salary > (SELECT AVG(Salary)
                FROM Employees2 e2
                WHERE e1.DepartmentID = e2.DepartmentID);
