
CREATE DATABASE LibraryDB;

USE LibraryDB;


CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(255) NOT NULL,
    ISBN VARCHAR(20) UNIQUE NOT NULL,
    Category VARCHAR(100),
    Publisher VARCHAR(100),
    YearPublished YEAR,
    TotalCopies INT DEFAULT 0,
    AvailableCopies INT DEFAULT 0
);


CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL
);


CREATE TABLE BookAuthors (
    BookID INT,
    AuthorID INT,
    PRIMARY KEY (BookID, AuthorID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);




CREATE TABLE Members (
    MemberID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(255) NOT NULL,
    Address TEXT,
    Phone VARCHAR(20),
    Email VARCHAR(100),
    Join_Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE Staff (
    StaffID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(255) NOT NULL,
    Position VARCHAR(100),
    Email VARCHAR(100)
);


CREATE TABLE BorrowRecords (
    BorrowID INT PRIMARY KEY AUTO_INCREMENT,
    MemberID INT,
    BookID INT,
    StaffID INT,
    BorrowDate DATE NOT NULL,
    ReturnDate DATE,
    Fine DECIMAL(10,2) DEFAULT 0.00,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);


CREATE TABLE Reservations (
    ReservationID INT PRIMARY KEY AUTO_INCREMENT,
    MemberID INT,
    BookID INT,
    ReservationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

ALTER TABLE Books
MODIFY YearPublished SMALLINT;



INSERT INTO Books (Title, ISBN, Category, Publisher, YearPublished, TotalCopies, AvailableCopies) VALUES
('The Hobbit', '978-0547928227', 'Fantasy', 'Houghton Mifflin Harcourt', 1937, 5, 5),
('1984', '978-0451524935', 'Dystopian', 'Signet Classic', 1949, 8, 8),
('To Kill a Mockingbird', '978-0061120084', 'Fiction', 'Harper Perennial', 1960, 7, 7),
('The Great Gatsby', '978-0743273565', 'Classic', 'Scribner', 1965, 6, 6),
('Pride and Prejudice', '978-1503290563', 'Romance', 'CreateSpace Independent', 1813, 4, 4),
('The Catcher in the Rye', '978-0316769488', 'Fiction', 'Little, Brown and Company', 1951, 5, 5),
('The Alchemist', '978-0061122415', 'Philosophical', 'HarperOne', 1988, 6, 6),
('The Da Vinci Code', '978-0307474278', 'Thriller', 'Anchor', 2003, 9, 9),
('Moby Dick', '978-1503280786', 'Adventure', 'CreateSpace Independent', 1851, 3, 3),
('A Game of Thrones', '978-0553593716', 'Fantasy', 'Bantam', 1996, 10, 10),
('The Hunger Games', '978-0439023528', 'Dystopian', 'Scholastic Press', 2008, 12, 12),
('Jane Eyre', '978-0141441146', 'Romance', 'Penguin Classics', 1997, 4, 4),
('Wuthering Heights', '978-0141439556', 'Gothic', 'Penguin Classics', 1847, 4, 4),
('Brave New World', '978-0060850524', 'Science Fiction', 'Harper Perennial', 1932, 6, 6),
('The Fault in Our Stars', '978-0525478812', 'Young Adult', 'Dutton Books', 2012, 7, 7),
('Life of Pi', '978-0156027328', 'Adventure', 'Mariner Books', 2001, 5, 5),
('The Chronicles of Narnia', '978-0066238500', 'Fantasy', 'HarperCollins', 1956, 8, 8),
('Percy Jackson and the Olympians', '978-0786838653', 'Fantasy', 'Disney-Hyperion', 2005, 10, 10),
('Animal Farm', '978-0451526342', 'Satire', 'Signet Classics', 1945, 6, 6),
('Frankenstein', '978-0486282114', 'Gothic', 'Dover Publications', 1978, 4, 4);



INSERT INTO Members (FullName, Address, Phone, Email) VALUES
('Alice Johnson', '456 Oak Lane', '555-123-4567', 'alice.johnson@example.com'),
('Michael Smith', '789 Pine St', '555-234-5678', 'michael.smith@example.com'),
('Sophia Martinez', '321 Maple Ave', '555-345-6789', 'sophia.martinez@example.com'),
('David Lee', '101 Elm St', '555-456-7890', 'david.lee@example.com'),
('Emma Brown', '202 Cedar Rd', '555-567-8901', 'emma.brown@example.com'),
('James Wilson', '303 Birch Blvd', '555-678-9012', 'james.wilson@example.com'),
('Olivia Davis', '404 Ash Ct', '555-789-0123', 'olivia.davis@example.com'),
('Benjamin Taylor', '505 Spruce Way', '555-890-1234', 'benjamin.taylor@example.com'),
('Ava Clark', '606 Redwood Pl', '555-901-2345', 'ava.clark@example.com'),
('William Harris', '707 Sycamore Dr', '555-012-3456', 'william.harris@example.com');



ALTER TABLE Staff
ADD COLUMN Phone VARCHAR(20);


INSERT INTO Staff (FullName, Position, Phone, Email) VALUES
('Linda Scott', 'Librarian', '555-111-2222', 'linda.scott@example.com'),
('Robert King', 'Assistant Librarian', '555-222-3333', 'robert.king@example.com'),
('Karen White', 'Archivist', '555-333-4444', 'karen.white@example.com'),
('Thomas Green', 'Technician', '555-444-5555', 'thomas.green@example.com'),
('Nancy Adams', 'Library Manager', '555-555-6666', 'nancy.adams@example.com');


--Random queries
SELECT * FROM Books;
SELECT * FROM Members;
SELECT * FROM BorrowRecords;
SELECT * FROM Reservations;

