
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


SELECT e.first_name, e.last_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.manager_id IS NOT NULL
  AND e.department_id = (
    SELECT department_id
    FROM employees
    WHERE employee_id = e.manager_id
  ); 

























