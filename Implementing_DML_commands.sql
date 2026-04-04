-- GOAL: Familiariation with Data Manipulation Language(DML) commands

CREATE DATABASE DBMSLab2;
USE DBMSLab2;

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    published_year YEAR,
    available_copies INT DEFAULT 0,
    total_copies INT DEFAULT 0,
    genre VARCHAR(100),
    ISBN VARCHAR(20) UNIQUE
);
CREATE TABLE Members (
    member_id INT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    membership_date DATE,
    membership_type VARCHAR(50), 
    email VARCHAR(255) UNIQUE,
    phone_number VARCHAR(20),
    address TEXT
);
DESC Books;
DESC Members;
ALTER TABLE Books
ADD CONSTRAINT chk_copies_consistency 
CHECK (available_copies <= total_copies);
DESC Books;

-- INSERT command is used to input the rows of data into the table
INSERT INTO Books (
    book_id, 
    title, 
    author, 
    published_year, 
    available_copies, 
    total_copies, 
    genre, 
    ISBN
) VALUES (
    101, 
    '1984_The Black Swan', 
    'George Orwell', 
    1949, 
    4, 
    4, 
    'Dystopian Fiction', 
    '978-0451524935'
);
DESC Books;

INSERT INTO Members (
    member_id, 
    first_name, 
    last_name, 
    membership_date, 
    membership_type, 
    email, 
    phone_number, 
    address
) VALUES 
(
    1, 
    'David', 
    'Lee', 
    '2024-04-15', 
    'Platinum', 
    'david.lee@email.com', 
    '555-0102', 
    '123 Maple St, Springfield'
),
(
    2, 
    'Emma', 
    'Wilson', 
    '2024-05-22', 
    'Silver', 
    'emma.wilson@email.com', 
    '555-0103', 
    '456 Oak Avenue, Riverdale'
);

-- SELECT is used to access/view the data in the database
SELECT member_id, first_name, last_name, membership_type FROM Members;

UPDATE Books
SET 
    total_copies = total_copies + 2,
    available_copies = available_copies + 92
    WHERE book_id = 101;
SELECT title, available_copies, total_copies FROM Books WHERE book_id = 101;
DESC Books;

-- UPDATE command is used to change the data in the table rows
UPDATE Members
SET membership_type = 'Gold'
WHERE member_id = 2;
SELECT first_name, last_name, membership_type 
FROM Members 
WHERE member_id = 2;

-- DELETE command is used to change the data in the table rows
DELETE FROM Books
WHERE book_id = 101;
SELECT * FROM Books WHERE book_id = 101;
DELETE FROM Members
WHERE member_id = 1;
SELECT * FROM Members 
WHERE member_id = 1;

CREATE TABLE Borrowing (
    loan_id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT,
    member_id INT,
    loan_date DATE NOT NULL,
    return_date DATE,
   
    CONSTRAINT fk_book FOREIGN KEY (book_id) 
        REFERENCES Books(book_id) ON DELETE CASCADE,
    CONSTRAINT fk_member FOREIGN KEY (member_id) 
        REFERENCES Members(member_id) ON DELETE CASCADE
);
DESC Borrowing;