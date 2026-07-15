-- GOAL: Familiarisation with SQL Constraints
-- CONSTRAINTS IN SQL:
-- 1. NOT NULL
-- 2. UNIQUE
-- 3. PRIMARY KEY
-- 4. FOREIGN KEY
-- 5. CHECK
-- 6. DEFAULT

CREATE DATABASE DBMSLab8;
USE DBMSLab8;

-- Task 1: Creating a table with NOT NULL and UNIQUE Constraints
CREATE TABLE DEPARTMENTS (
   DeptID INT NOT NULL,
   DeptName VARCHAR(50) UNIQUE NOT NULL,
   Location VARCHAR(50) NOT NULL,
   PRIMARY KEY (DeptID)
   );
   DESC DEPARTMENTS;

-- Task 2: Implementing PRIMARY KEY and FOREIGN KEY Constraints by creating table EMPLOYEES with foreign keys from table DEPARTMENTS
CREATE TABLE EMPLOYEES (
   EmpID INT AUTO_INCREMENT,
   EmpName VARCHAR(50) NOT NULL,
   DeptID INT NOT NULL,
   PRIMARY KEY (EmpID),
   FOREIGN KEY (DeptID) REFERENCES DEPARTMENTS(DeptID)
   );
   DESC EMPLOYEES;
   
-- Task 3: Implementing CHECK Constraint
ALTER TABLE EMPLOYEES ADD CONSTRAINT EmpAge CHECK (Age >= 18);
DESC EMPLOYEES;

-- Task 4: Implementing DEFAULT Constraint
ALTER TABLE EMPLOYEES ADD JoinDate DATE DEFAULT (CURRENT_DATE);
DESC EMPLOYEES;

-- Task 5: Testing the Constraints
-- Inserting Valid Data
INSERT INTO Departments (DeptID, DeptName, Location)
VALUES (1, 'HR', 'New York');

INSERT INTO Employees (EmpName, DeptID, Age)
VALUES ('John Doe', 1, 25);

SELECT * FROM DEPARTMENTS;
SELECT * FROM EMPLOYEES;

-- Attempting to insert invalid data 
-- Voilating NOT NULL Constraint
INSERT INTO Departments (DeptID, Location)
VALUES (2, 'London');

-- Violating CHECK constraint
INSERT INTO Employees (EmpName, DeptID, Age)
VALUES ('Jane Smith', 1, 16); 