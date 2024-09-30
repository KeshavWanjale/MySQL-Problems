-- *** SET operations are used to combine results from two or more SELECT queries into a single result set.
-- 1 UNION: Combines result sets and removes duplicates.
-- 2 UNION ALL: Combines result sets but includes duplicates.
-- 3 INTERSECT: Returns common rows from both result sets (simulated).
-- 4 MINUS: Returns rows from the first result set that are not in the second (simulated).

USE CompanyDB2;

CREATE TABLE Table1 (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255)
);

CREATE TABLE Table2 (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255)
);

INSERT INTO Table1 (Name) VALUES 
('Alice'), 
('Bob'), 
('David'), 
('Eve');

INSERT INTO Table2 (Name) VALUES 
('Bob'), 
('Charlie'), 
('Eve'), 
('Frank');

-- 1 UNION
SELECT Name FROM Table1
UNION
SELECT Name FROM Table2;

-- 2 UNION ALL
SELECT Name FROM Table1
UNION ALL
SELECT Name FROM Table2;

--  INTERSECT
SELECT T1.Name FROM Table1 T1
INNER JOIN Table2 T2 ON T1.Name = T2.Name;

-- MINUS
-- USING LEFT JOIN
SELECT Table1.Name FROM Table1
LEFT JOIN Table2 ON Table1.Name = Table2.Name
WHERE Table2.Name IS NULL;
-- USING NOT EXISTS
SELECT Name FROM Table1
WHERE NOT EXISTS (
    SELECT Name FROM Table2 WHERE Table1.Name = Table2.Name
);
