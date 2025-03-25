-- Creating the database
CREATE DATABASE CompanyDB;
USE CompanyDB;

-- Creating the Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    City VARCHAR(50),
    Age INT
);

-- Inserting data into Employees table
INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary, City, Age) VALUES
(1, 'John', 'Doe', 'IT', 70000, 'New York', 35),
(2, 'Alice', 'Smith', 'HR', 60000, 'Los Angeles', 40),
(3, 'Bob', 'Johnson', 'Finance', 75000, 'Toronto', 45),
(4, 'David', 'Brown', 'IT', 72000, 'London', 30),
(5, 'Emma', 'Wilson', 'Sales', 65000, 'Sydney', 28),
(6, 'Michael', 'Clark', 'Finance', 80000, 'New York', 50);

-- Creating the Projects table
CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    EmployeeID INT,
    ProjectName VARCHAR(100),
    Budget DECIMAL(10,2),
    StartDate DATE,
    Status VARCHAR(20),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID) ON DELETE CASCADE
);

-- Inserting data into Projects table
INSERT INTO Projects (ProjectID, EmployeeID, ProjectName, Budget, StartDate, Status) VALUES
(101, 1, 'AI Development', 100000, '2024-01-10', 'Completed'),
(102, 2, 'Employee Training', 50000, '2024-02-15', 'Ongoing'),
(103, 1, 'Cybersecurity Audit', 75000, '2024-03-05', 'Pending'),
(104, 3, 'Financial Analysis', 90000, '2024-04-12', 'Ongoing'),
(105, 5, 'Market Expansion', 65000, '2024-05-20', 'Completed'),
(106, 6, 'Risk Management', 80000, '2024-06-10', 'Pending');

-- 1. Retrieve all employees and their assigned projects using an INNER JOIN. 
-- Return: EmployeeID, FirstName, LastName, Department, Salary, ProjectID, ProjectName, Budget, Status.

SELECT 
    A.EmployeeID, 
    A.FirstName, 
    A.LastName, 
    A.Department, 
    A.Salary, 
    B.ProjectID, 
    B.ProjectName, 
    B.Budget, 
    B.Status
FROM Employees AS A
INNER JOIN Projects AS B 
ON A.EmployeeID = B.EmployeeID;



-- 2. Retrieve all employees and their assigned projects, including employees who have no projects using a LEFT JOIN.
-- Return: EmployeeID, FirstName, LastName, Department, Salary, ProjectID, ProjectName, Budget, Status.

SELECT 
    A.EmployeeID, 
    A.FirstName, 
    A.LastName, 
    A.Department, 
    A.Salary, 
    B.ProjectID, 
    B.ProjectName, 
    B.Budget, 
    B.Status
FROM Employees AS A
LEFT JOIN Projects AS B 
ON A.EmployeeID = B.EmployeeID;




-- 3. Retrieve all projects and their assigned employees, including projects that have no employees using a RIGHT JOIN.
-- Return: ProjectID, ProjectName, Budget, Status, EmployeeID, FirstName, LastName, Department, Salary.

SELECT 
    B.ProjectID, 
    B.ProjectName, 
    B.Budget, 
    B.Status, 
    A.EmployeeID, 
    A.FirstName, 
    A.LastName, 
    A.Department, 
    A.Salary
FROM Employees AS A
RIGHT JOIN Projects AS B 
ON A.EmployeeID = B.EmployeeID;


-- Retrieve all employees and projects, including those without a match in either table using a FULL OUTER JOIN.
-- Return: EmployeeID, FirstName, LastName, Department, Salary, ProjectID, ProjectName, Budget, Status.
SELECT 
    A.EmployeeID, 
    A.FirstName, 
    A.LastName, 
    A.Department, 
    A.Salary, 
    B.ProjectID, 
    B.ProjectName, 
    B.Budget, 
    B.Status
FROM Employees AS A
FULL OUTER JOIN Projects AS B 
ON A.EmployeeID = B.EmployeeID;

-- 5. Retrieve a list of all unique cities where employees are located and project statuses.
-- Return: Location (Rename the column to Location using an alias).
SELECT City AS Location FROM Employees
UNION
SELECT Status AS Location FROM Projects; 


-- 6. Retrieve a list of all cities where employees are located and project statuses, allowing duplicates.
-- Return: Location (Rename the column to Location using an alias).
SELECT City AS Location FROM Employees
UNION ALL
SELECT Status AS Location FROM Projects;

SELECT ProjectID,
	ProjectName,
	Budget,
    Status
FROM Projects
WHERE NOT Status = 'completed';




