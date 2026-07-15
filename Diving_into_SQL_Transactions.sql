-- GOAL: Familiarisation with SQL Transactions: rollbacks, commits, savepoints
CREATE DATABASE DBMSLab7b;
USE DBMSLab7b;

-- Part B
-- Demonstration of COMMIT Transaction
CREATE TABLE products (
product_id INT PRIMARY KEY AUTO_INCREMENT,
product_name VARCHAR(50),
price DECIMAL(10,2)
);

START TRANSACTION;

INSERT INTO products (product_name, price) VALUES 
   ('Laptop', 1000.00), 
   ('Smartphone', 800.00),
   ('Tablet', 500.00);

COMMIT;

SELECT * FROM products;

-- Demonstration of ROLLBACK Transaction

START TRANSACTION;

INSERT INTO products (product_name, price)
VALUES ('Keyboard', 100.00);

-- Creating SAVEPOINT

SAVEPOINT savepoint1;

INSERT INTO products (product_name, price)
VALUES ('Monitor', 300.00);

SELECT * FROM products;

ROLLBACK TO savepoint1;

SELECT * FROM products;

COMMIT;
