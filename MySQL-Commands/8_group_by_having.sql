USE COMPANYDB;

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    category VARCHAR(255),
    quantity INT,
    price DECIMAL(10, 2),
    sale_date DATE
);

INSERT INTO sales
VALUES 
(1, 'Laptop', 'Electronics', 2, 1000.00, '2023-09-01'),
(2, 'Smartphone', 'Electronics', 5, 500.00, '2023-09-02'),
(3, 'T-shirt', 'Clothing', 10, 20.00, '2023-09-03'),
(4, 'Shoes', 'Clothing', 4, 50.00, '2023-09-03'),
(5, 'Tablet', 'Electronics', 3, 600.00, '2023-09-05'),
(6,	'Jacket', 'Clothing',	2, 100, '2023-09-06'),
(7,	'Laptop', 'Electronics', 1,	1000, '2023-09-07'),
(8,	'Shoes', 'Clothing', 3, 50,	'2023-09-08'),
(9,	'Laptop', 'Electronics', 2,	1000, '2023-09-09');
 
SELECT * FROM sales;
-- The GROUP BY clause in SQL is used to group rows from a table based on one or more columns.
-- 1: Count the Number of Sales Per Product
SELECT product_name, COUNT(*) AS sale_count
FROM sales
GROUP BY product_name;

-- 2: Count number of priducts sold by Categories 
SELECT category, SUM(quantity) AS total_quantity_sold
FROM sales
GROUP BY category;

-- 3: Average Price of Products Sold in Each Category
SELECT category, AVG(price) AS avg_price
FROM sales
GROUP BY category;

-- 4: Total Quantity Sold Per Product, Grouped by Category
SELECT category, product_name, SUM(quantity) AS total_quantity_sold
FROM sales
GROUP BY category, product_name;

-- 5: Total Quantity Sold Per Product with a Condition
SELECT product_name, SUM(quantity) AS total_quantity_sold
FROM sales
GROUP BY product_name HAVING SUM(quantity) > 4;




