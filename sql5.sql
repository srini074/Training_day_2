Create Database new
Use new

CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    author_id INT NOT NULL,
    genre VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE authors (
    author_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(50) NOT NULL,
    birth_year INT NOT NULL
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    book_id INT NOT NULL,
    sale_date DATE NOT NULL,
    quantity INT NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

INSERT INTO authors (author_id, name, country, birth_year) VALUES
(1, 'George Orwell', 'UK', 1903),
(2, 'J.K. Rowling', 'UK', 1965),
(3, 'Mark Twain', 'USA', 1835),
(4, 'Jane Austen', 'UK', 1775),
(5, 'Ernest Hemingway', 'USA', 1899);

INSERT INTO books (book_id, title, author_id, genre, price) VALUES
(1, '1984', 1, 'Dystopian', 15.99),
(2, 'Harry Potter and the Philosophers Stone', 2, 'Fantasy', 20.00),
(3, 'Adventures of Huckleberry Finn', 3, 'Fiction', 10.00),
(4, 'Pride and Prejudice', 4, 'Romance', 12.00),
(5, 'The Old Man and the Sea', 5, 'Fiction', 8.99);

INSERT INTO sales (sale_id, book_id, sale_date, quantity, total_amount) VALUES
(1, 1, '2024-01-15', 3, 47.97),
(2, 2, '2024-02-10', 2, 40.00),
(3, 3, '2024-03-05', 5, 50.00),
(4, 4, '2024-04-20', 1, 12.00),
(5, 5, '2024-05-25', 4, 35.96);

--Task 1 : Write a query to display authors who have written books in multiple genres and group the results by author name.
SELECT a.author_id,a.name, COUNT(DISTINCT b.genre) AS genres
FROM authors a
JOIN books b ON a.author_id = b.author_id
GROUP BY a.author_id,a.name
HAVING COUNT(DISTINCT b.genre) > 1;

-- Task2 : Write a query to find the books that have the highest sale total for each genre and group the results by genre.
with gross as
(
select b.book_id , b.title ,b.genre,s.total_amount,
Rank() Over(partition by b.genre order by s.total_amount desc) as ranking
from books b join sales s on b.book_id = s.book_id
)
select*from gross
where ranking = 1;

-- Write a query to find the average price of books for each author and group the results by author name, only including authors whose average book price is higher than the overall average book price.

SELECT a.name, AVG(b.price) AS avg_book_price
FROM authors a
JOIN books b ON a.author_id = b.author_id
GROUP BY a.name
HAVING AVG(b.price) > (
    SELECT AVG(price) AS overall_avg_price
    FROM books
)
ORDER BY avg_book_price DESC;


-- ##
CREATE DATABASE eCommerce
Use eCommerce
-- Insert sample data into Products table
INSERT INTO Products (ProductID, ProductName, Category, Price, Stock)
VALUES 
(1, 'Laptop', 'Computers', 1200.00, 50),
(2, 'Smartphone', 'Mobile Devices', 800.00, 200),
(3, 'Tablet', 'Mobile Devices', 500.00, 100);
GO
 
-- Insert sample data into Orders table
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES 
(1, 1, '2024-06-01', 2000.00),
(2, 2, '2024-06-15', 800.00);
GO
 
-- Insert sample data into Customers table
INSERT INTO Customers (CustomerID, FirstName, LastName, Email)
VALUES 
(1, 'John', 'Doe', 'john.doe@example.com'),
(2, 'Jane', 'Smith', 'jane.smith@example.com');
GO
 
-- Insert sample data into Reviews table
INSERT INTO Reviews (ReviewID, ProductID, CustomerID, Rating, ReviewText)
VALUES 
(1, 1, 1, 5, 'Excellent laptop!'),
(2, 2, 2, 4, 'Great smartphone.');
GO
 
-- Insert sample data into Suppliers table
INSERT INTO Suppliers (SupplierID, SupplierName, ContactEmail)
VALUES 
(1, 'TechSupplies Inc.', 'contact@techsupplies.com'),
(2, 'MobileTech Co.', 'support@mobiletech.com');
GO
 
 
CREATE DATABASE eCommerceDB;
GO
 
-- Use the created database
USE eCommerceDB;
GO
 
 
-- Create Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100),
    Category NVARCHAR(50),
    Price DECIMAL(10, 2),
    Stock INT
);
GO
 
-- Create Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATETIME,
    TotalAmount DECIMAL(10, 2)
);
GO
 
-- Create Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Email NVARCHAR(100)
);
GO
 
-- Create Reviews table
CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    Rating INT,
    ReviewText NVARCHAR(1000)
);
GO
 
-- Create Suppliers table
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName NVARCHAR(100),
    ContactEmail NVARCHAR(100)
);
GO
 
-- Create Audit table to log changes for all tables
CREATE TABLE AuditLog (
    AuditID INT IDENTITY(1,1) PRIMARY KEY,
    TableName NVARCHAR(50),
    Operation NVARCHAR(50),
    RecordID INT,
    OperationTime DATETIME
);
GO
 
 
-- Insert sample data into Products table
INSERT INTO Products (ProductID, ProductName, Category, Price, Stock)
VALUES 
(1, 'Laptop', 'Computers', 1200.00, 50),
(2, 'Smartphone', 'Mobile Devices', 800.00, 200),
(3, 'Tablet', 'Mobile Devices', 500.00, 100);
GO
 
-- Insert sample data into Orders table
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES 
(1, 1, '2024-06-01', 2000.00),
(2, 2, '2024-06-15', 800.00);
GO
 
-- Insert sample data into Customers table
INSERT INTO Customers (CustomerID, FirstName, LastName, Email)
VALUES 
(1, 'John', 'Doe', 'john.doe@example.com'),
(2, 'Jane', 'Smith', 'jane.smith@example.com');
GO
 
-- Insert sample data into Reviews table
INSERT INTO Reviews (ReviewID, ProductID, CustomerID, Rating, ReviewText)
VALUES 
(1, 1, 1, 5, 'Excellent laptop!'),
(2, 2, 2, 4, 'Great smartphone.');
GO
 
-- Insert sample data into Suppliers table
INSERT INTO Suppliers (SupplierID, SupplierName, ContactEmail)
VALUES 
(1, 'TechSupplies Inc.', 'contact@techsupplies.com'),
(2, 'MobileTech Co.', 'support@mobiletech.com');
GO
 
Select * from AuditLog

Insert Into AuditLog
Select 'Products',  'Insert',ProductId,GetDate()
from inserted -- All rows which inserted (Logical table - Only available in 

Create Trigger trg_ProductInsert
On Products --SQL listen -- Table
After Insert -- Before / After ( Insert,Delete,Update ) -- action
As
Begin
	-- Reaction
	Insert Into AuditLog
	Select 'Products',  'Insert',ProductId,GetDate()
	from inserted 
End
Go

INSERT INTO PRODUCTS
VALUES
(5,'Smart Watch','Mobile Devices',1000.00,25);

Select * from Products;
Select * from AuditLog;
-- After insert 1 or many

Create Database new
Use new

CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    author_id INT NOT NULL,
    genre VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE authors (
    author_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(50) NOT NULL,
    birth_year INT NOT NULL
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    book_id INT NOT NULL,
    sale_date DATE NOT NULL,
    quantity INT NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

INSERT INTO authors (author_id, name, country, birth_year) VALUES
(1, 'George Orwell', 'UK', 1903),
(2, 'J.K. Rowling', 'UK', 1965),
(3, 'Mark Twain', 'USA', 1835),
(4, 'Jane Austen', 'UK', 1775),
(5, 'Ernest Hemingway', 'USA', 1899);

INSERT INTO books (book_id, title, author_id, genre, price) VALUES
(1, '1984', 1, 'Dystopian', 15.99),
(2, 'Harry Potter and the Philosophers Stone', 2, 'Fantasy', 20.00),
(3, 'Adventures of Huckleberry Finn', 3, 'Fiction', 10.00),
(4, 'Pride and Prejudice', 4, 'Romance', 12.00),
(5, 'The Old Man and the Sea', 5, 'Fiction', 8.99);

INSERT INTO sales (sale_id, book_id, sale_date, quantity, total_amount) VALUES
(1, 1, '2024-01-15', 3, 47.97),
(2, 2, '2024-02-10', 2, 40.00),
(3, 3, '2024-03-05', 5, 50.00),
(4, 4, '2024-04-20', 1, 12.00),
(5, 5, '2024-05-25', 4, 35.96);

--Task 1 : Write a query to display authors who have written books in multiple genres and group the results by author name.
SELECT a.author_id,a.name, COUNT(DISTINCT b.genre) AS genres
FROM authors a
JOIN books b ON a.author_id = b.author_id
GROUP BY a.author_id,a.name
HAVING COUNT(DISTINCT b.genre) > 1;

-- Task2 : Write a query to find the books that have the highest sale total for each genre and group the results by genre.
with gross as
(
select b.book_id , b.title ,b.genre,s.total_amount,
Rank() Over(partition by b.genre order by s.total_amount desc) as ranking
from books b join sales s on b.book_id = s.book_id
)
select*from gross
where ranking = 1;

-- Write a query to find the average price of books for each author and group the results by author name, only including authors whose average book price is higher than the overall average book price.

SELECT a.name, AVG(b.price) AS avg_book_price
FROM authors a
JOIN books b ON a.author_id = b.author_id
GROUP BY a.name
HAVING AVG(b.price) > (
    SELECT AVG(price) AS overall_avg_price
    FROM books
)
ORDER BY avg_book_price DESC;


-- ##
CREATE DATABASE eCommerce
Use eCommerce
-- Insert sample data into Products table
INSERT INTO Products (ProductID, ProductName, Category, Price, Stock)
VALUES 
(1, 'Laptop', 'Computers', 1200.00, 50),
(2, 'Smartphone', 'Mobile Devices', 800.00, 200),
(3, 'Tablet', 'Mobile Devices', 500.00, 100);
GO
 
-- Insert sample data into Orders table
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES 
(1, 1, '2024-06-01', 2000.00),
(2, 2, '2024-06-15', 800.00);
GO
 
-- Insert sample data into Customers table
INSERT INTO Customers (CustomerID, FirstName, LastName, Email)
VALUES 
(1, 'John', 'Doe', 'john.doe@example.com'),
(2, 'Jane', 'Smith', 'jane.smith@example.com');
GO
 
-- Insert sample data into Reviews table
INSERT INTO Reviews (ReviewID, ProductID, CustomerID, Rating, ReviewText)
VALUES 
(1, 1, 1, 5, 'Excellent laptop!'),
(2, 2, 2, 4, 'Great smartphone.');
GO
 
-- Insert sample data into Suppliers table
INSERT INTO Suppliers (SupplierID, SupplierName, ContactEmail)
VALUES 
(1, 'TechSupplies Inc.', 'contact@techsupplies.com'),
(2, 'MobileTech Co.', 'support@mobiletech.com');
GO
 
 
CREATE DATABASE eCommerceDB;
GO
 
-- Use the created database
USE eCommerceDB;
GO
 
 
-- Create Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100),
    Category NVARCHAR(50),
    Price DECIMAL(10, 2),
    Stock INT
);
GO
 
-- Create Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATETIME,
    TotalAmount DECIMAL(10, 2)
);
GO
 
-- Create Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Email NVARCHAR(100)
);
GO
 
-- Create Reviews table
CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    Rating INT,
    ReviewText NVARCHAR(1000)
);
GO
 
-- Create Suppliers table
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName NVARCHAR(100),
    ContactEmail NVARCHAR(100)
);
GO
 
-- Create Audit table to log changes for all tables
CREATE TABLE AuditLog (
    AuditID INT IDENTITY(1,1) PRIMARY KEY,
    TableName NVARCHAR(50),
    Operation NVARCHAR(50),
    RecordID INT,
    OperationTime DATETIME
);
GO
 
 
-- Insert sample data into Products table
INSERT INTO Products (ProductID, ProductName, Category, Price, Stock)
VALUES 
(1, 'Laptop', 'Computers', 1200.00, 50),
(2, 'Smartphone', 'Mobile Devices', 800.00, 200),
(3, 'Tablet', 'Mobile Devices', 500.00, 100);
GO
 
-- Insert sample data into Orders table
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES 
(1, 1, '2024-06-01', 2000.00),
(2, 2, '2024-06-15', 800.00);
GO
 
-- Insert sample data into Customers table
INSERT INTO Customers (CustomerID, FirstName, LastName, Email)
VALUES 
(1, 'John', 'Doe', 'john.doe@example.com'),
(2, 'Jane', 'Smith', 'jane.smith@example.com');
GO
 
-- Insert sample data into Reviews table
INSERT INTO Reviews (ReviewID, ProductID, CustomerID, Rating, ReviewText)
VALUES 
(1, 1, 1, 5, 'Excellent laptop!'),
(2, 2, 2, 4, 'Great smartphone.');
GO
 
-- Insert sample data into Suppliers table
INSERT INTO Suppliers (SupplierID, SupplierName, ContactEmail)
VALUES 
(1, 'TechSupplies Inc.', 'contact@techsupplies.com'),
(2, 'MobileTech Co.', 'support@mobiletech.com');
GO
 
Select * from AuditLog

Insert Into AuditLog
Select 'Products',  'Insert',ProductId,GetDate()
from inserted -- All rows which inserted (Logical table - Only available in 

Create Trigger trg_ProductInsert
On Products --SQL listen -- Table
After Insert -- Before / After ( Insert,Delete,Update ) -- action
As
Begin
	-- Reaction
	Insert Into AuditLog
	Select 'Products',  'Insert',ProductId,GetDate()
	from inserted 
End
Go

INSERT INTO PRODUCTS
VALUES
(5,'Smart Watch','Mobile Devices',1000.00,25);

Select * from Products;
Select * from AuditLog;
-- After insert 1 or many

-- Insert on Reviews --> Insert on Auditlog
 
-- Create trigger for updating stock levels in products table

-- Updating stock --> Insert in Auditlog | Operation: 'Update-Stock'

-- Note: Dont worry on the number of stocks
 
-- Create Trigger for Price changes

-- When the price is reduced or increased it needs to be logged in PriceHistory table

-- PriceHistory columns - ID (PK),  ProductID, Oldprice, NewPrice, ChangeDate


CREATE DATABASE eCommerceDB;
GO
 
-- Use the created database
USE eCommerceDB;
GO
 
 
-- Create Products table
CREATE TABLE Products
(
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100),
    Category NVARCHAR(50),
    Price DECIMAL(10, 2),
    Stock INT
);
GO
 
-- Create Orders table
CREATE TABLE Orders
(
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATETIME,
    TotalAmount DECIMAL(10, 2)
);
GO
 
-- Create Customers table
CREATE TABLE Customers
(
    CustomerID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Email NVARCHAR(100)
);
GO
 
-- Create Reviews table
CREATE TABLE Reviews
(
    ReviewID INT PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    Rating INT,
    ReviewText NVARCHAR(1000)
);
GO
 
-- Create Suppliers table
CREATE TABLE Suppliers
(
    SupplierID INT PRIMARY KEY,
    SupplierName NVARCHAR(100),
    ContactEmail NVARCHAR(100)
);
GO
 
-- Create Audit table to log changes for all tables
CREATE TABLE AuditLog
(
    AuditID INT IDENTITY(1,1) PRIMARY KEY,
    TableName NVARCHAR(50),
    Operation NVARCHAR(50),
    RecordID INT,
    OperationTime DATETIME
);
GO
 
 
-- Insert sample data into Products table
INSERT INTO Products
    (ProductID, ProductName, Category, Price, Stock)
VALUES
    (1, 'Laptop', 'Computers', 1200.00, 50),
    (2, 'Smartphone', 'Mobile Devices', 800.00, 200),
    (3, 'Tablet', 'Mobile Devices', 500.00, 100);
GO
 
-- Insert sample data into Orders table
INSERT INTO Orders
    (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
    (1, 1, '2024-06-01', 2000.00),
    (2, 2, '2024-06-15', 800.00);
GO
 
-- Insert sample data into Customers table
INSERT INTO Customers
    (CustomerID, FirstName, LastName, Email)
VALUES
    (1, 'John', 'Doe', 'john.doe@example.com'),
    (2, 'Jane', 'Smith', 'jane.smith@example.com');
GO
 
-- Insert sample data into Reviews table
INSERT INTO Reviews
    (ReviewID, ProductID, CustomerID, Rating, ReviewText)
VALUES
    (1, 1, 1, 5, 'Excellent laptop!'),
    (2, 2, 2, 4, 'Great smartphone.');
GO
 
-- Insert sample data into Suppliers table
INSERT INTO Suppliers
    (SupplierID, SupplierName, ContactEmail)
VALUES
    (1, 'TechSupplies Inc.', 'contact@techsupplies.com'),
    (2, 'MobileTech Co.', 'support@mobiletech.com');
GO
 
select *
from Products
select *
from AuditLog
 
insert into AuditLog
select 'Products', 'Insert', ProductId, GETDATE()
from inserted
-- Recently inserted rows (Logical Table - available only in t)
 
GO
CREATE TRIGGER trg_ProductInsert
ON Products -- sql listen to this table
after INSERT -- Before / After (Insert ,Delete,Update)
AS
BEGIN
    insert into AuditLog
    select 'Products', 'Insert', ProductId, GETDATE()
    from inserted
END
GO
 
INSERT INTO Products
    (ProductID, ProductName, Category, Price, Stock)
VALUES
    (5, 'Smart Watch', 'Mobile Device', 1000.00, 25)
 
SELECT *
FROM Products
 
SELECT *
FROM AuditLog
 
-- Create trigger for updating stock levels in products table
-- Updating stock --> Insert in Auditlog | Operation: 'Update-Stock'
-- Note: Dont worry on the number of stocks
 
GO
CREATE TRIGGER trg_StockUpdate
ON Products -- sql listen to this table
after UPDATE -- Before / After (Insert ,Delete,Update)
AS
BEGIN
    insert into AuditLog
    select 'Products', 'Update', ProductId, GETDATE()
    from inserted
END
GO
 
UPDATE Products
set Stock = 75
where ProductID = 5
 
 
-- Create Trigger for Price changes
-- When the price is reduced or increased it needs to be logged in PriceHistory table
-- PriceHistory columns - ID (PK),  ProductID, Oldprice, NewPrice, ChangeDate
 
CREATE TABLE PriceHistory
(
    ID int PRIMARY KEY IDENTITY(1,1),
    Oldprice INT,
    NewPrice INT,
    ChangeDate DATE
)
 
-- DROP TABLE PriceHistory
 
GO
CREATE TRIGGER trg_PriceChange
ON Products -- sql listen to this table
after Update -- Before / After (Insert ,Delete,Update)
AS
BEGIN
    insert into PriceHistory
    select d.Price, i.Price, GETDATE()
    from inserted i,deleted d
END
GO
 
UPDATE Products
set Price = 1001
where ProductID = 5
 
SELECT * FROM Products
SELECT * FROM PriceHistory 