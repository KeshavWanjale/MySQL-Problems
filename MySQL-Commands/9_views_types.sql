-- In MySQL, Views are virtual tables based on the result of an SQL query. They don’t store the actual data but display it dynamically by retrieving
--  data from the underlying base tables when accessed. Views provide a way to simplify complex queries, improve security by hiding specific data, 
--  and help in better data management. 
-- If we update the data in view it will reflect in table

use companydb2;
select * from employees;
-- 1 simple view is based on a single table without using aggregate functions, joins, or subqueries.
CREATE VIEW SimpleView AS
SELECT EmployeeID, FirstName, LastName
FROM Employees;

select * from SimpleView;

-- 2 Complex view is created using multiple tables, joins, aggregate functions (SUM(), AVG(), etc.), or subqueries.
CREATE VIEW ComplexView AS
SELECT e.EmployeeID, e.FirstName, e.LastName, d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
GROUP BY e.DepartmentID;

-- 3 WITH CHECK OPTION ensures that INSERT and UPDATE operations on a view conform to the conditions defined by the view.
CREATE VIEW CheckedView AS
SELECT EmployeeID, FirstName, LastName, DepartmentID
FROM Employees
WHERE DepartmentID = '2'
WITH CHECK OPTION;



