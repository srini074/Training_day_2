CREATE TABLE salesman (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(255),
    city VARCHAR(255),
    commission DECIMAL(4, 2)
);



Select * from salesman


INSERT INTO salesman (salesman_id, name, city, commission) VALUES
(5001, 'James Hoog', 'New York', 0.15), -- Print
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11), -- Print
(5006, 'Mc Lyon', 'Paris', 0.14), -- Print
(5003, 'Lauson Hen', NULL, 0.12),
(5007, 'Paul Adam', 'Rome', 0.13); -- Print



SELECT AVG(commission) as av from salesman where city='Paris'

SELECT * FROM SALESMAN

SELECT city from salesman group by city having count(city)=1;

CREATE TABLE orders (
    ord_no INT PRIMARY KEY,
    purch_amt DECIMAL(10, 2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT
);


INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES
(70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002),
(70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760, '2012-09-10', 3002, 5001),
(70010, 1983.43, '2012-10-10', 3004, 5006),
(70003, 2480.4, '2012-10-10', 3009, 5003),
(70012, 250.45, '2012-06-27', 3008, 5002),
(70011, 75.29, '2012-08-17', 3003, 5007),
(70013, 3045.6, '2012-04-25', 3002, 5001);


Select * from orders;

Select * from salesman

SELECT ord_no from orders
where salesman_id = (select salesman_id from salesman where name='Paul Adam');

SELECT ord_no from orders where ord_date='2012-10-10' and purch_amt > (select avg(purch_amt) from orders)

CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(255),
    city VARCHAR(255),
    grade INT NULL,
    salesman_id INT
);
INSERT INTO customer (customer_id, cust_name, city, grade, salesman_id) VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3001, 'Brad Guzan', 'London', NULL, 5005),
(3004, 'Fabian Johns', 'Paris', 300, 5006),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3009, 'Geoff Camero', 'Berlin', 100, 5003),
(3008, 'Julian Green', 'London', 300, 5002),
(3003, 'Jozy Altidor', 'Moscow', 200, 5007);

select * from customer
select * from salesman
select * from orders

select orders.ord_no from salesman, orders where city = 'Paris' and salesman.salesman_id=orders.salesman_id;

select distinct s.name, c.salesman_id from salesman s Inner join customer c
On s.salesman_id = c.salesman_id
group by c.salesman_id,s.name
having count(c.salesman_id) > 1;

select city,count(city)
from salesman
where city is not null
group by city
having count(city)=1;

CREATE DATABASE shop;
Use shop;

Select Len('Rajendra') as NameLength

-- 2.left

Select Left('Rajendra',2) as NameLength
-- 3.Right

Select Right('Rajendra',2) as NameLength
-- 3.Substring

Select Substring('Rajendra',2,7) as NameLength
-- 3.Upper

Select Upper('Rajendra') as NameLength
-- 3.Lower

Select Lower('Rajendra') as NameLength
-- 3.Left
-- 3.Left

-- 6. Ltrim

Select Ltrim('      Rajendra') as NameLength

-- 6. RTrim


Select RTrim('Rajendra    ') as NameLength
-- 6. CharIndex

Select CharIndex('cool','This is cool') -- 9

Select CharIndex('awesome','This is cool') -- 0

-- 6. Replace

Select Replace('This is a fun day. Lets Enjoy the day','day','night') 

-- 6. Concat

Select Concat('Rajendra',' Super') as NameLength

-- 6. Replicate -  Repeat
Select Replicate('FunFriday ',5) as NameLength

-- 13. Reverse

Select Reverse('FunFriday')

-- Mathematical Functions

-- 1. Abs +ve
Select Abs (-5)
-- 2. Power 
Select Power(2,4)
-- 3. Round
Select Round(58,345,2)
-- 4.Ceiling
Select CEILING(58.345)
-- 5. Floor
Select Floor(58.345)

-- Date Functions

-- 1. GetDate
select GETDATE() as Today
-- 2. DateAdd
select DateAdd(day,10,GETDATE()) 
-- 3. DateDiff
select DateDiff(YEAR,getdate(),'2023-06-23')
-- 4. Format
select FORMAT(GETDATE(),'MM/dd/yyyy');
-- 5. DatePart (Extract the part from the date)

Select DATEPART(month,GETDATE())
Select DATEPART(DAY, GETDATE())

CREATE DATABASE Excersice

Use Excersice

CREATE TABLE EmployeesTable(
EmployeeID INT PRIMARY KEY,
FirstName VARCHAR(255),
LastName VARCHAR(255),
);

INSERT INTO EmployeesTable VALUES
(1,'John',' Doe'),
(2,'Jane',' Smith'),
(3,'Alice',' Johnson');
DROP TABLE EmployeesTable
CREATE TABLE ProductsTable(
ProductID INT PRIMARY KEY,
ProductName VARCHAR(255),
ProductDescription VARCHAR(255),
);

DROP TABLE EmployeesTable
DROP TABLE ProductsTable
INSERT INTO ProductsTable VALUES
(101,'Widget A','A standard widget'),
(102,'Gadget B','A fancy new gadget'),
(103,'Thingamajig','A very useful tool');

CREATE TABLE SalesOrder(
SalesOrderID INT PRIMARY KEY,
OrderDate DATETIME,
TotalAmount FLOAT,
);

INSERT INTO SalesOrder VALUES
(1001,'2023-01-15 14:33:00',150.00),
(1002,'2023-03-22 10:45:00',200.00),
(1003,'2024-05-17 09:20:00',350.00)


CREATE TABLE Customers(
CustomerID INT PRIMARY KEY,
CustomerName VARCHAR(255),
Address VARCHAR(255),
);

INSERT INTO Customers VALUES
(201,'Acme Corp','123 Main St'),
(202,'Globex Inc','456 Elm St'),
(203,'Initech','789 Oak St')


SELECT * FROM EmployeesTable

SELECT * FROM ProductsTable


SELECT * FROM SalesOrder

SELECT * FROM Customers

-- EX-1
SELECT EmployeeID,upper(concat(FirstName,LastName)) AS FullName from EmployeesTable
-- EX-2
SELECT ProductID,ProductName,len(ProductDescription) AS DescriptionLength from ProductsTable
-- EX-3
SELECT SalesOrderID,FORMAT(OrderDate,'yyyy-mm-dd') AS FormattedOrderDate from SalesOrder
-- EX-4
SELECT CustomerID,CustomerName,rTrim(Ltrim(Address)) AS CleanedAddress from Customers
-- EX-5
SELECT datepart(year,OrderDate) as Year,sum(TotalAmount) as TotalSales from SalesOrder group by datepart(year,OrderDate)

CREATE TABLE Employees (
EmployeeID INT PRIMARY KEY,
FirstName VARCHAR(255),
LastName VARCHAR(255),
DepartmentID INT)



insert into Employees VALUES

(1,'John','Doe',101),
(2,'Jane','Smith',102),
(3,'Alice','Johnson',103);


CREATE TABLE DepartmentsTable(
DepartmentID INT PRIMARY KEY,
DepartmentName VARCHAR(255),
)

INSERT INTO DepartmentsTable VALUES
(101,'Sales'),
(102,'Engineering'),
(103,'Marketing');





CREATE TABLE DepartmentTable (
  DepartmentID INT PRIMARY KEY,
  DepartmentName VARCHAR(50)
);

INSERT INTO DepartmentTable VALUES
  (101, 'Sales'),
  (102, 'Engineering'),
  (103, 'Marketing');
SELECT * from DepartmentTable


-- 1--------------------
ALTER TABLE EmployeesTable
ADD DepartmentID INT;

ALTER TABLE EmployeesTable
ADD CONSTRAINT FK_EmployeesTable_DepartmentTable
FOREIGN KEY (DepartmentID)
REFERENCES DepartmentTable(DepartmentID);

UPDATE EmployeesTable
SET DepartmentID = 101
WHERE EmployeeID IN (1);

UPDATE EmployeesTable
SET DepartmentID = 102
WHERE EmployeeID IN (2);

UPDATE EmployeesTable
SET DepartmentID = 103
WHERE EmployeeID IN (3);

SELECT EmployeeID,upper(concat(FirstName,LastName)) AS FullName,DepartmentTable.DepartmentID  from EmployeesTable




3rd----------------------------------------------


-- Add CustomerID column to SalesOrders table
ALTER TABLE SalesOrder
ADD CustomerID INT;

-- Update CustomerID values based on SalesOrderID
UPDATE SalesOrder
SET CustomerID = (
  SELECT CustomerID
  FROM Customers
  WHERE Customers.CustomerID = SalesOrder.CustomerID
);
truncate table SalesOrder;
-- Insert sample data into SalesOrders table
INSERT INTO SalesOrder (SalesOrderID, CustomerID, OrderDate, TotalAmount)
VALUES
  (1001, 201, '2023-01-15 14:33:00', 150.00),
  (1002, 202, '2023-03-22 10:45:00', 200.00),
  (1003, 201, '2024-05-17 09:20:00', 350.00);

  select s.CustomerID,c.CustomerName,datepart(year,s.OrderDate) as Year,s.TotalAmount as TotalSales from SalesOrder s,Customers c 
  where s.CustomerID = c.CustomerID ;

  5th-------------------------------------------------
    select s.SalesOrderID,c.CustomerName,FORMAT(s.OrderDate, 'yyyy-MM-dd') as FormattedOrderDate,s.TotalAmount from SalesOrder s,Customers c 
  where s.CustomerID = c.CustomerID ;

  4th-------------------------------
SELECT 
  p.ProductID,
  p.ProductName,
  REPLACE(p.ProductDescription, 'useful', 'beneficial') AS ModifiedDescription
FROM 
  ProductsTable p
WHERE 
  p.ProductDescription LIKE '%useful%'

-- 2---------------------------------------
  SELECT * from ProductsTable
  
  select ProductID, ProductName, LEN(ProductDescription) AS DescriptionLength, REVERSE(ProductDescription) AS ReversedDescription
  from ProductsTable

  create database ftrain;

create table training(sno int, day varchar(45), topic varchar(40));

insert into training values (01,'day 01','sql basics');

select * from training

insert into training values (02,'day 02','sql queries');

insert into training values (03,'day 03','data base types');
insert into training values (04,'day 04','ddl & dml commands');
select * from training


CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    department_id INT,
    manager_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (manager_id) REFERENCES employees(employee_id)
);


INSERT INTO departments (department_id, department_name) VALUES
(1, 'Sales'),
(2, 'HR'),
(3, 'IT'),
(4, 'Finance');

INSERT INTO employees (employee_id, first_name, last_name, salary, department_id, manager_id) VALUES
(1, 'John', 'Doe', 60000, 1, NULL),
(2, 'Jane', 'Smith', 75000, 1, 1),
(3, 'Emily', 'Jones', 50000, 2, NULL),
(4, 'Michael', 'Brown', 55000, 2, 3),
(5, 'Chris', 'Wilson', 95000, 3, NULL),
(6, 'Sarah', 'Taylor', 40000, 3, 5),
(7, 'David', 'Lee', 105000, 3, 5),
(8, 'Paul', 'Walker', 120000, 4, NULL),
(9, 'Laura', 'Hall', 110000, 4, 8);


select * from departments
SELECT * FROM employees

-- Task Find all the employees who earn more than employees in the Sales department.
--step 1
Select max(salary) 
from employees
where department_id=1
-- final solution
Select * from employees
		where salary > ( Select max(salary) 
							from employees
							where department_id=1)


Select * from employees
		where salary > All(Select salary
							from employees
							where department_id=1)

Select * from employees
		where salary > All( Select salary
							from employees
							where department_id = (Select department_id from departments
															where department_name='Sales'))

-- Task : Find all employees who earn more than any employee in the HR department

Select * from employees
		where salary > ( Select min(salary)
							from employees
							where department_id = 2)

Select * from employees
where salary > Any (Select salary
						from employees
						where department_id = (Select department_id from departments
														where department_name = 'HR'))
-- Task: List all departments that have at least one employee with a salary greater than $50,000.
Select * from employees
Select * from departments

Select distinct department_name from employees join departments
on departments.department_id=employees.department_id
where salary > 50000

select * from departments as o 
where department_id Exists (select distinct department_id from employees i
				where salary > 50000 and o.department_id = i.department_id)
-- Task: Find employees whose salary is higher than the average salary of all employees in their department.

select * from employees
select * from departments

select * from employees
			where salary  > All(Select avg(salary)
								from employees as a
								where a.department_id = employees.department_id
						-- group by department_id
								)
-- Task: List all employees who have a manager in the same department.

select * from employees
select * from departments

DROP TABLE departments
DROP TABLE employees

-- Task: List all employees who have a manager in the same department. 
--sol1
SELECT e.first_name, e.last_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.manager_id IS NOT NULL
  AND e.department_id = (
    SELECT department_id
    FROM employees
    WHERE employee_id = e.manager_id
  ); 
--sol2
Select * from employees e1
Inner Join employees e2
On e1.employee_id = e2.manager_id
where e1.department_id = e2.department_id
--sol3
-- managers
Select * from employees
    where manager_id is NULL
-- employees
Select * from employees
    where manager_id is not NULL

Select * from
      (Select * from employees
        where manager_id is Null) as Manager
        Inner Join
        (Select * from Employees
        where manager_id is not Null) as Emp
        ON Manager.employee_id = Emp.manager_id
        where Manager.department_id = Emp.department_id

Select * from employees as emps 
      where Exists ( Select * 
                        from employees as managers
                          where emps.manager_id = managers.employee_id
                                              and emps.department_id = managers.department_id)

-- Task
-- Write a query to display only those customers whose grade are, in fact, higher than every customer in New York.

select * from salesman
select * from customer

select * from customer
where grade > All(Select grade from customer
					where city = 'New York') 
-- Write a query to find all orders with an amount (purch_amt) smaller than any amount for a customer in London
select * from orders
where customer_id In (3001,3008) -- 270, 250

select customer_id from customer
			where city = 'London' -- 3001,3008
Select * from orders
		where purch_amt < Any (Select purch_amt from orders
										Where customer_id In (select customer_id from customer
																	where city = 'London'))

