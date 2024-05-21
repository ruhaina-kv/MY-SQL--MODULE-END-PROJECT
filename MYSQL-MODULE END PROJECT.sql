CREATE DATABASE LIBRARY;
USE LIBRARY;

CREATE TABLE BRANCH(
BRANCH_NO INT PRIMARY KEY,
MANAGER_ID INT,
BRANCH_ADDRESS VARCHAR(100),
CONTACT_NO VARCHAR(20));
INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no) VALUES
(1, 101, '123 Main Street', '123-456-7890'),
(2, 102, '456 Elm Street', '456-789-0123'),
(3, 103, '789 Oak Street', '789-012-3456'),
(4, 104, '321 Pine Street', '321-654-9870'),
(5, 105, '654 Cedar Street', '654-987-0123'),
(6, 106, '789 Maple Street', '789-456-1230'),
(7, 107, '321 Elm Street', '321-987-6540'),
(8, 108, '654 Oak Street', '654-321-0987'),
(9, 109, '123 Pine Street', '123-789-4560'),
(10, 110, '456 Cedar Street', '456-321-6540');

CREATE TABLE EMPLOYEE(
EMP_ID INT PRIMARY KEY,
EMP_NAME VARCHAR(50),
POSITION VARCHAR(30),
SALARY INT,
BRANCH_NO INT,
FOREIGN KEY (BRANCH_NO) REFERENCES BRANCH(BRANCH_NO));
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) VALUES
(201, 'John Doe', 'Manager', 50000.00, 1),
(202, 'Jane Smith', 'Assistant Manager', 40000.00, 2),
(203, 'Michael Johnson', 'Clerk', 30000.00, 3),
(204, 'Emily Brown', 'Clerk', 30000.00, 4),
(205, 'David Wilson', 'Security', 35000.00, 5),
(206, 'Sarah Lee', 'Manager', 50000.00, 6),
(207, 'Kevin Davis', 'Assistant Manager', 40000.00, 7),
(208, 'Jennifer Taylor', 'Clerk', 30000.00, 8),
(209, 'Robert Clark', 'Clerk', 30000.00, 9),
(210, 'Michelle Martinez', 'Security', 35000.00, 10);

CREATE TABLE CUSTOMER(
CUSTOMER_ID INT PRIMARY KEY,
CUSTOMER_NAME VARCHAR(50),
CUSTOMER_ADDRESS VARCHAR(100),
REG_DATE DATE);
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) VALUES
(301, 'Alice Johnson', '123 Maple Avenue', '2024-01-01'),
(302, 'Bob Smith', '456 Oak Avenue', '2024-01-02'),
(303, 'Charlie Brown', '789 Pine Avenue', '2024-01-03'),
(304, 'Diana Wilson', '321 Cedar Avenue', '2024-01-04'),
(305, 'Eve Davis', '654 Elm Avenue', '2024-01-05'),
(306, 'Frank White', '789 Maple Avenue', '2024-01-06'),
(307, 'Grace Taylor', '321 Elm Avenue', '2024-01-07'),
(308, 'Henry Harris', '654 Oak Avenue', '2024-01-08'),
(309, 'Ivy Martin', '123 Pine Avenue', '2024-01-09'),
(310, 'Jack Jones', '456 Cedar Avenue', '2024-01-10');

CREATE TABLE BOOKS(
ISBN VARCHAR(40) PRIMARY KEY,
BOOK_TITLE VARCHAR(100),
CATEGORY VARCHAR(30),
RENTAL_PRICE INT,
ISBN_BOOK INT,
STATUS ENUM('YES','NO'),
AUTHOR VARCHAR(50),
PUBLISHER VARCHAR(40));
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES
('ISBN1', 'Book Title 1', 'Fiction', 10.99, 'yes', 'Author 1', 'Publisher A'),
('ISBN2', 'Book Title 2', 'Non-Fiction', 12.99, 'yes', 'Author 2', 'Publisher B'),
('ISBN3', 'Book Title 3', 'Science', 15.99, 'yes', 'Author 3', 'Publisher C'),
('ISBN4', 'Book Title 4', 'History', 9.99, 'no', 'Author 4', 'Publisher D'),
('ISBN5', 'Book Title 5', 'Biography', 11.99, 'yes', 'Author 5', 'Publisher E'),
('ISBN6', 'Book Title 6', 'Fantasy', 13.99, 'yes', 'Author 6', 'Publisher F'),
('ISBN7', 'Book Title 7', 'Mystery', 14.99, 'no', 'Author 7', 'Publisher G'),
('ISBN8', 'Book Title 8', 'Thriller', 16.99, 'yes', 'Author 8', 'Publisher H'),
('ISBN9', 'Book Title 9', 'Self-Help', 17.99, 'yes', 'Author 9', 'Publisher I'),
('ISBN10', 'Book Title 10', 'Romance', 18.99, 'yes', 'Author 10', 'Publisher J');

CREATE TABLE IssueStatus(
ISSUE_ID INT PRIMARY KEY,
ISSUED_CUST INT,
ISSUED_BOOK_NAME VARCHAR(100),
ISSUED_DATE DATE,
ISBN_BOOK VARCHAR(40),
FOREIGN KEY (ISSUED_CUST) REFERENCES CUSTOMER(CUSTOMER_ID),
FOREIGN KEY (ISBN_BOOK) REFERENCES BOOKS(ISBN));
INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, IssueD_date, Isbn_book) VALUES
(401, 301, 'Book1', '2024-01-01', 'ISBN1'),
(402, 302, 'Book2', '2024-01-02', 'ISBN2'),
(403, 303, 'Book3', '2024-01-03', 'ISBN3'),
(404, 304, 'Book4', '2024-01-04', 'ISBN4'),
(405, 305, 'Book5', '2024-01-05', 'ISBN5'),
(406, 306, 'Book6', '2024-01-06', 'ISBN6'),
(407, 307, 'Book7', '2024-01-07', 'ISBN7'),
(408, 308, 'Book8', '2024-01-08', 'ISBN8'),
(409, 309, 'Book9', '2024-01-09', 'ISBN9'),
(410, 310, 'Book10', '2024-01-10', 'ISBN10');

CREATE TABLE ReturnStatus(
RETURN_ID INT PRIMARY KEY,
RETURN_CUST INT,
RETURN_BOOK_NAME VARCHAR(100),
RETURN_DATE DATE,
ISBN_BOOK2 VARCHAR(40),
FOREIGN KEY (RETURN_CUST) REFERENCES CUSTOMER(CUSTOMER_ID),
FOREIGN KEY (ISBN_BOOK2) REFERENCES BOOKS(ISBN));
INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2) VALUES
(501, 301, 'Book1', '2024-01-08', 'ISBN1'),
(502, 302, 'Book2', '2024-01-09', 'ISBN2'),
(503, 303, 'Book3', '2024-01-10', 'ISBN3'),
(504, 304, 'Book4', '2024-01-11', 'ISBN4'),
(505, 305, 'Book5', '2024-01-12', 'ISBN5'),
(506, 306, 'Book6', '2024-01-13', 'ISBN6'),
(507, 307, 'Book7', '2024-01-14', 'ISBN7'),
(508, 308, 'Book8', '2024-01-15', 'ISBN8'),
(509, 309, 'Book9', '2024-01-16', 'ISBN9'),
(510, 310, 'Book10', '2024-01-17', 'ISBN10');


# 1. Retrieve the book title, category, and rental price of all available books.
SELECT BOOK_TITLE,CATEGORY,RENTAL_PRICE FROM BOOKS WHERE STATUS='YES';

# 2. List the employee names and their respective salaries in descending order of salary.
SELECT EMP_NAME,SALARY FROM EMPLOYEE ORDER BY SALARY DESC;

# 3. Retrieve the book titles and the corresponding customers who have issued those books.
SELECT B.BOOK_TITLE,C.CUSTOMER_NAME FROM ISSUESTATUS I 
JOIN BOOKS B ON I.ISBN_BOOK=B.ISBN
JOIN CUSTOMER C ON I.ISSUED_CUST=C.CUSTOMER_ID;

# 4. Display the total count of books in each category.
SELECT CATEGORY,COUNT(*) AS TOTAL_COUNT FROM BOOKS GROUP BY CATEGORY;

# 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
SELECT EMP_NAME,POSITION FROM EMPLOYEE WHERE SALARY>=50000;

# 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
SELECT CUSTOMER_NAME FROM CUSTOMER WHERE REG_DATE<'2022-01-01'
AND CUSTOMER_ID NOT IN(SELECT ISSUED_CUST FROM ISSUESTATUS);

# 7. Display the branch numbers and the total count of employees in each branch.
SELECT BRANCH_NO,COUNT(*) AS TOTAL_EMPLOYEES FROM EMPLOYEE GROUP BY BRANCH_NO;

# 8. Display the names of customers who have issued books in the month of June 2023.
SELECT C.CUSTOMER_NAME FROM ISSUESTATUS I
JOIN CUSTOMER C ON I.ISSUED_CUST = C.CUSTOMER_ID
WHERE MONTH(I.ISSUED_DATE)=6 AND YEAR(I.ISSUED_DATE)=2023;

# 9. Retrieve book_title from book table containing history.
SELECT BOOK_TITLE FROM BOOKS WHERE CATEGORY ='HISTORY';

# 10. Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
SELECT BRANCH_NO,COUNT(*) AS TOTAL_EMPLOYEES FROM EMPLOYEE GROUP BY BRANCH_NO HAVING TOTAL_EMPLOYEES> 5; 


