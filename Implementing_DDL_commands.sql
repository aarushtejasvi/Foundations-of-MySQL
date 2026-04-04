-- GOAL: Familiariation with Data Definition Language (DDL) commands

CREATE DATABASE IF NOT EXISTS DBLab001;
USE DBLab001;

-- CREATE command is used to create a table along with the columns
CREATE TABLE Students (
    StudentID INT NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    DateOfBirth DATE,
    PRIMARY KEY (StudentID)
);
DESC STUDENTS;

CREATE TABLE Enrollments (
    EnrollmentID INT NOT NULL,
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    EnrollmentDate DATE NOT NULL,
    PRIMARY KEY (EnrollmentID),
    
    
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);
DESC ENROLLMENTS;

-- ALTER command is used to modify the column name, add or delete a column
ALTER TABLE Students
ADD PhoneNumber VARCHAR(15);
DESC Students;

ALTER TABLE Courses 
MODIFY COLUMN Credits DECIMAL(3, 1);
DESC Courses;
SHOW TABLES;

-- Truncate command deletes the table contents, reatining the table
TRUNCATE TABLE Enrollements;
TRUNCATE TABLE Courses;

-- DROP command deletes the table as well as the data stored
DROP TABLE Enrollments;
DROP TABLE Courses;


SHOW TABLES;

