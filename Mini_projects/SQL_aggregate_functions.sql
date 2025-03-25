
-- Creating a database
CREATE DATABASE employees_db;
USE employees_db;

-- Creating the employees table
CREATE TABLE employees (
    id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    hire_date DATE NOT NULL,
    city VARCHAR(50) NOT NULL
);


-- Inserting data into the employees table
INSERT INTO employees (id, first_name, last_name, department, salary, hire_date, city) VALUES
(1, 'John', 'Doe', 'IT', 55000, '2018-06-15', 'New York'),
(2, 'Jane', 'Smith', 'HR', 48000, '2019-07-20', 'Chicago'),
(3, 'Mike', 'Johnson', 'Finance', 60000, '2017-09-30', 'Los Angeles'),
(4, 'Sarah', 'Brown', 'IT', 53000, '2021-03-25', 'New York'),
(5, 'David', 'White', 'Marketing', 52000, '2016-04-10', 'San Francisco'),
(6, 'Emily', 'Davis', 'IT', 62000, '2015-02-14', 'Chicago'),
(7, 'Robert', 'Wilson', 'Finance', 59000, '2019-10-01', 'Houston'),
(8, 'Jessica', 'Moore', 'HR', 51000, '2018-05-22', 'Los Angeles'),
(9, 'Daniel', 'Clark', 'Marketing', 53000, '2022-06-01', 'Chicago'),
(10, 'Laura', 'Hall', 'IT', 50000, '2020-08-10', 'San Francisco');


SELECT * FROM employees;

-- Aggregate Functions & Grouping
-- Write a SQL query to find the total number of employees in the company
SELECT COUNT(id) AS total_employees
FROM employees;


-- Write a SQL query to find the total salary paid to all employees in the IT department.
SELECT department, 
	SUM(salary) AS total_salary
FROM employees
WHERE department = 'IT'
GROUP BY 1;


-- Write a SQL query to calculate the average salary of employees in the HR department.
SELECT AVG(salary) AS average_salary
FROM employees
WHERE department = 'HR';


-- Write a SQL query to find the highest and lowest salary in the company.
SELECT MAX(salary) AS highest_salary,
	MIN(salary) AS lowest_salary
FROM employees;

-- Write a SQL query to group employees by department and display the total salary paid in each department.
SELECT department,
	SUM(salary) AS total_salary
FROM employees
GROUP BY department;

-- Write a SQL query to count how many employees work in each city.
SELECT city,
COUNT(*) AS total_employees
FROM employees
GROUP BY city;


-- Write a SQL query to group employees by department, calculate the average salary in each department, and order the results in descending order of average salary.
SELECT department,
	AVG(salary) AS average_salary
FROM employees
GROUP BY department
ORDER BY average_salary DESC;


-- Write a SQL query to find departments where the total salary paid exceeds 100,000. (Use GROUP BY and HAVING)
SELECT department,
	SUM(salary) AS total_salary
FROM employees
GROUP BY department
HAVING total_salary > 100000;


-- List cities where more than one employee works, ordered by the number of employees in descending order.
SELECT city,
COUNT(*) AS employee_count
FROM employees
GROUP BY city
HAVING COUNT(*) > 1
ORDER BY employee_count DESC;


-- Find the department with the highest average salary
SELECT department,
AVG(salary) AS average_salary
FROM employees
GROUP BY department
ORDER BY average_salary DESC
LIMIT 1;
