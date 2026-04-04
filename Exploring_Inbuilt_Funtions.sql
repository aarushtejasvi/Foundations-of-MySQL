CREATE DATABASE IF NOT EXISTS DBMSLab3;
USE DBMSLab3;

CREATE TABLE Employees (
EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Salary DECIMAL(10, 2),
BirthDate DATE,
HireDate DATE
);

INSERT INTO Employees (FirstName, LastName, Salary, BirthDate, HireDate) VALUES
('John', 'Doe', 55000.30, '1985-06-15', '2010-01-20'),
('Jane', 'Smith', 65000.50, '1990-08-22', '2012-07-10'),
('Alice', 'Johnson', 72000.10, '1982-11-30', '2015-05-25'),
('Bob', 'Brown', 48000.90, '1978-03-12', '2018-09-15');

SELECT * from Employees;
DROP 
CREATE TABLE orders (
   OrderID INT PRIMARY KEY AUTO_INCREMENT,
   OrderDate DATE,
   TotalAmount DECIMAL(10, 2),
   EmployeeID INT,
   FOREIGN KEY (EmployeeID) REFERENCES Employees(emp_id)
);

INSERT INTO Orders (OrderDate, TotalAmount, EmployeeID) VALUES
('2024-07-15', 250.00, 1),
('2024-08-10', 175.50, 2),
('2024-09-01', 300.00, 3),
('2024-09-10', 450.75, 1),
('2024-08-25', 123.40, 4);

SELECT * from Orders;

SELECT FirstName, LastName, ROUND(Salary) AS RoundedSalary FROM Employees;

SELECT FirstName, LastName, ABS(Salary) AS AbsoluteSalary FROM Employees;

SELECT OrderID, CEIL(TotalAmount) AS CeilingAmount FROM Orders;

SELECT COUNT(*) AS TotalEmployees FROM Employees;

SELECT SUM(Salary) AS TotalSalaryExpense FROM Employees;

SELECT AVG(TotalAmount) AS AverageOrderAmount FROM Orders;

SELECT MAX(Salary) AS HighestSalary, MIN(Salary) AS LowestSalary FROM Employees;

SELECT UPPER(FirstName) AS UpperFirst, LOWER(LastName) AS LowerLast FROM Employees;

SELECT CONCAT(FirstName, ' ', LastName) AS FullName FROM Employees;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100),
    Category VARCHAR(50)
);

INSERT INTO Products (ProductName, Category) VALUES
('Wireless Mouse', 'Electronics'),
('Mechanical Keyboard', 'Electronics'),
('Ergonomic Chair', 'Furniture'),
('Desktop Monitor', 'Electronics');

SELECT * FROM Products;

SELECT ProductName, SUBSTRING(ProductName, 1, 3) AS SUBSTRING FROM Products;

SELECT CAST('2026-12-25' AS DATE) AS ConvertedDate;

SELECT NOW() AS CurrentDateTime;

SELECT OrderID, YEAR(OrderDate) AS OrderYear FROM Orders;

SELECT OrderID, DATE_ADD(OrderDate, INTERVAL 3 MONTH) AS DeliveryDeadline FROM Orders;

SELECT OrderID, DATEDIFF(NOW(), OrderDate) AS DaysSinceOrder FROM Orders;