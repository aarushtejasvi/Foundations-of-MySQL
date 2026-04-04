CREATE DATABASE DBMSLab4;
USE DBMSLab4;
CREATE TABLE Employees (
EmployeeID INT PRIMARY KEY,
Name VARCHAR(50),
Age INT,
Salary DECIMAL(10, 2),
Department VARCHAR(50),
HireDate DATE,
Address VARCHAR(100)
);

CREATE TABLE Departments (
DepartmentID INT PRIMARY KEY,
DepartmentName VARCHAR(50),
EmployeeID INT,
FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);
DESC Employees;
DESC Departments;
INSERT INTO Employees (EmployeeID, Name, Age,
Salary, Department, HireDate, Address) VALUES
(1001, 'Ashish', 28, 60000, 'IT', '2024-05-01', '123 Main St, New York'),
(1002, 'Binay', 45, 80000, 'HR', '2020-07-15', '456 Elm St, Chicago'),
(1003, 'Charlie', 32, 55000, 'Finance', '2022-01-10', '789 Oak St, Los Angeles'),
(1004, 'Dhruv', 38, 75000, 'HR', '2021-10-30', '101 Pine St, New York');
SELECT * FROM Employees;
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'IT&'),
(2, 'HR'),
(3, 'Finance');
SELECT * FROM Departments;

SELECT 
    Name, 
    Salary AS MonthlySalary,
    -- A. Adding 10% Bonus
    Salary + (Salary * 0.10) AS SalaryWithBonus,
    -- B. Subtracting 15% Tax
    Salary - (Salary * 0.15) AS SalaryAfterTax,
    -- C. Calculating Yearly Salary
    Salary * 12 AS YearlySalary,
    -- Modulus: Remainder of Age divided by 5
    Age % 5 AS AgeModulus
FROM Employees;

-- LOGICAL OPERATORS
-- Logical AND operator
SELECT * FROM Employees 
WHERE Age > 30 AND Salary > 50000;

-- Logical OR operator
SELECT * FROM Employees 
WHERE Department = 'HR' OR Salary > 70000;

-- Logical NOT operator
SELECT * FROM Employees 
WHERE Address NOT LIKE '%New York%';

-- COMPARISON OPERATORS
-- Equality Comparison operator
SELECT * FROM Employees 
WHERE Salary = 60000;

-- Inequality Comparison operator
SELECT * FROM Employees 
WHERE Department != 'IT';

-- Less than or greater than Comparison operators
SELECT * FROM Employees 
WHERE Age < 25 AND Salary > 50000;

-- SPECIAL OPERATORS
-- Between
SELECT * FROM Employees 
WHERE Age BETWEEN 25 AND 35;

-- IN 
SELECT * FROM Employees 
WHERE Department IN ('HR', 'IT', 'Finance');

-- LIKE
SELECT * FROM Employees 
WHERE Name LIKE 'A%';

-- IS NULL
SELECT * FROM Employees 
WHERE Address IS NULL;

-- SET OPERATORS
-- Union 
SELECT Name FROM Employees WHERE Department = 'HR'
UNION
SELECT Name FROM Employees WHERE Department = 'Finance';

-- Intersect
SELECT Name FROM Employees WHERE Department = 'IT'
INTERSECT
SELECT Name FROM Employees WHERE Department = 'HR';

-- except
SELECT Name FROM Employees WHERE Department = 'HR'
EXCEPT
SELECT Name FROM Employees WHERE Department = 'IT';