--------------- PROJECT A -------------------------

-- Creating and using the database
CREATE DATABASE HallamCollege

USE HallamCollege;

-- Creating tables Students, Class, Subjects, Teachers

CREATE TABLE Students (
	Student_ID varchar(10) PRIMARY KEY NOT NULL,
	FirstName varchar(50),
	LastName varchar(100),
	Class varchar(10),
	Age int NOT NULL,
	Guardian_Email varchar(150) NOT NULL

);


CREATE TABLE Subjects (
	Subject_ID varchar(50) PRIMARY KEY NOT NULL,
	Subject_Name varchar(100),
	Subject_Class varchar(10),
	Subject_Teacher varchar(50)
)

CREATE TABLE Class (
	Class_ID varchar(50) PRIMARY KEY NOT NULL,
	Class_Name varchar(10),
	Class_Teacher varchar(50)
)

CREATE TABLE Teachers (
	FirstName varchar(50),
	LastName varchar(100),
	Teacher_Class varchar(10),
	Teacher_Email varchar(150) NOT NULL
)

-- Inserting values into tables 

INSERT INTO Students VALUES
	('A01', 'John', 'Turner', 'A', 3, 'P.turner@gmail.com'),
	('A02', 'Robert', 'Harrison', 'B', 5, 'ZHarrison@gmail.com'),
	('A03', 'Paula', 'Ben', 'A', 3, 'A.Ben@gmail.com'),
	('A04', 'William', 'Carson', 'B', 6, 'B.Carson@gmail.com'),
	('A05', 'Geordie', 'Xiavier', 'B', 7, 'TXiavier@gmail.com'),
	('A06', 'Harry', 'Fisher', 'C', 7, 'C.Fisher@gmail.com'),
	('A07', 'Peter', 'Kenneth', 'D', 9, 'C.Kenneth@gmail.com'),
	('A08', 'Adrian', 'Smith', 'A', 4, 'A.Smith@gmail.com'),
	('A09', 'Lois', 'Xiavier', 'C', 8, 'TXiavier@gmail.com'),
	('A10', 'Carl', 'Evans', 'B', 3, 'B.Evans@gmail.com'),
	('A11', 'Donald', 'Brown', 'D', 10, 'C.Brown@gmail.com'),
	('A12', 'Carman', 'Robbin', 'B', 5, 'B.Robbin@gmail.com'),
	('A13', 'Paige', 'Tom', 'C', 9, 'Jtom@Hallamcollege.com'),
	('A14', 'Clinton', 'Bailey', 'E', 12, 'D.Bailey@gmail.com');


INSERT INTO Subjects VALUES
	('MAT01', 'Maths', 'A', 'Jill'),
	('ENG01', 'English', 'A', 'Amin'),
	('HIST01', 'History', 'B', 'Cooper'),
	('MUS01', 'Music', 'A', 'Thomas'),
	('SCI01', 'Science', 'C', 'Sarah'),
	('MAT02', 'Maths', 'B', 'Jill'),
	('ENG02', 'English', 'B', 'Amin'),
	('HIST02', 'History', 'C', 'Taylor'),
	('MUS02', 'Music', 'B', 'Thomas'),
	('SCI02', 'Science', 'D', 'Sarah'),
	('MAT03', 'Maths', 'C', 'White'),
	('ENG03', 'English', 'C', 'Amin'),
	('MAT04', 'Maths', 'D', 'White'),
	('ENG04', 'English', 'D', 'Amin'),
	('HIST03', 'History', 'D', 'Taylor');

INSERT INTO Class VALUES
	('C001', 'A', 'Jill'),
	('C002', 'B', 'Amin'),
	('C003', 'C', 'Sarah'),
	('C004', 'D', 'Taylor');

INSERT INTO Teachers VALUES
	('Jill', 'Tom', 'A', 'Jtom@Hallamcollege.com'),
	('Amin', 'Kabir', 'B', 'AKabir@Hallamcollege.com'),
	('Cooper', 'Hill', 'E', 'Chill@Hallamcollege.com'),
	('Thomas', 'Allen',NULL, 'Tallen@Hallamcollege.com'),
	('Sarah', 'Young', 'C', 'Syoung@Hallamcollege.com'),
	('Taylor', 'Lewis', 'D', 'Tlewis@Hallamcollege.com'),
	('White', 'Cook', NULL, 'Wcook@Hallamcollege.com');


-- Retrieve a list of teachers names and subject_id from the subjects table
USE HallamCollege

SELECT Subject_ID, Subject_Teacher
FROM Subjects


-- Find a list of teachers who teach maths -- Jill and White
SELECT DISTINCT(Subject_Teacher)
FROM Subjects
WHERE Subject_Name = 'Maths'


-- Which students are older than 5?
SELECT * FROM Students
WHERE Age > 5


-- Which students are older than 6 and are in class B
SELECT * FROM Students
WHERE Age > 6 AND Class = 'B'

-- Who teaches English or History?
SELECT DISTINCT(Subject_Teacher)
FROM Subjects
WHERE Subject_Name = 'English' OR Subject_Name = 'History'

-- Who doesn’t teach any classes?
SELECT CONCAT(FirstName, ' ', LastName) AS FullName
FROM Teachers
WHERE Teacher_Class is NULL

-- Retrieve a list of students alphabetically by surname
SELECT CONCAT(FirstName, ' ', LastName) AS FullName
FROM Students 
ORDER BY LastName


--------------- PROJECT B ---------------------

-- Load in the excel file

CREATE DATABASE DaternShop

USE DaternShop

-- Which cities are our customers based in?
SELECT DISTINCT(City)
FROM [dbo].[Customers$]

-- How many countries have we shipped to?
SELECT COUNT(DISTINCT(Country)) as countries
FROM Customers$

-- Which customers are based in Europe?
SELECT * FROM Customers$
WHERE Country NOT IN ('USA', 'Canada', 'Argentina', 'Brazil', 'Mexico', 'Venezuela')


-- Who is our most recent customer? (Assume customers are assigned IDs sequentially)
SELECT TOP 1 CustomerName FROM Customers$
ORDER BY CustomerID DESC

-- Which customers are based outside of London?
SELECT * FROM Customers$
WHERE NOT City = 'London'

-- Retrieve a list of customer names, sorted by the country they are based in and then their name.
SELECT CustomerName FROM Customers$
ORDER BY Country, CustomerName

-- Which customers are missing postcodes?
SELECT * FROM Customers$
WHERE PostalCode IS NULL

-- Explore the other tables in the database using the keywords learnt so far




----------- PROJECT C ------------

USE HallamCollege

-- Who are the oldest and youngest students?
SELECT TOP 1 * FROM Students ORDER BY Age ASC --youngest

SELECT TOP 1 * FROM Students ORDER BY Age DESC -- oldest

-- How many students are in each class?
SELECT Class, COUNT(DISTINCT(Student_ID)) as StudentCount
FROM Students
GROUP BY Class

-- What is the average age of students?
SELECT AVG(Age) as AgeAvg
FROM Students

-- Who has the highest total score across all subjects?
-- There was no score data

-- Are all the students in a class within their age range. If not,
	-- a. provide a list of students in a class within the right age range,
	-- b. provide a list of students in a different class group.

SELECT Student_ID, Age, Class,
CASE 
	WHEN Age >= 3 AND Age <= 4 THEN 'A'
	WHEN Age >= 5 AND Age <= 6 THEN 'B'
	WHEN Age >= 7 AND Age <= 8 THEN 'C'
	WHEN Age >= 9 AND Age <= 10 THEN 'D'
	ELSE 'E'
	END AS NewClass
	FROM Students

-- Create a view for students that have been moved up a year.
CREATE VIEW [UpgradedStudents] AS 
SELECT * FROM Students


-- How many students have been moved up a year?


-- The school intend to create new ID cards with their first names and class ID. Retrieve the
-- student's name and class ID in the same column (Ex. John Turner – A)

SELECT CONCAT(FirstName, ' ', LastName, ' ', '-', ' ', Student_ID)
FROM Students

-- Create a view for the ID cards
CREATE VIEW [Student_IDS] AS 
SELECT CONCAT(FirstName, ' ', LastName, ' ', '-', ' ', Student_ID) AS student_id
FROM Students

SELECT * FROM Student_IDS -- checking the view

-- Remove both of your views.


--------- PROJECT D -----------------

-- What are the most expensive and least expensive products?

USE DaternShop

SELECT TOP 1 * FROM Products$ ORDER BY Price ASC --cheapest

SELECT TOP 1 * FROM Products$ ORDER BY Price DESC -- most expensive


-- How many different products do we sell? 77
SELECT COUNT(DISTINCT(ProductName)) AS ProductCount
FROM Products$


-- What is the average price of our products?
SELECT AVG(Price) AS AvgPrice
FROM Products$

-- How many products have we sold in total?
SELECT SUM(Quantity) AS SumOfProductsSold
FROM [dbo].[Order_Details$]


-- Create a view that classifies orders into ‘Small’, ‘Medium’, and ‘Large’ based on their quantity
-- and the following rules (small: <10, medium: 10-20, large: >20)  

CREATE VIEW [OrderClassification] AS 
SELECT OrderID, ProductID, Quantity,
CASE 
	WHEN Quantity <= 10 THEN 'small'
	WHEN Quantity >= 11 AND Quantity <= 20 THEN 'medium'
	ELSE 'large'
	END AS OrderType
	FROM [dbo].[Order_Details$]

SELECT * FROM [OrderClassification]

-- What is the average size of a small order? What about medium and large?
SELECT AVG(Quantity) AS AvgQuantity, OrderType 
FROM OrderClassification
GROUP BY OrderType

-- How many employees are older than 65?
SELECT * FROM [dbo].[Employees$]
WHERE DATEDIFF(year, BirthDate, CURRENT_TIMESTAMP) > 65

-- Which supplier supplies the most expensive product?
SELECT TOP 1 [dbo].[Products$]. ProductName, [dbo].[Products$]. Price, [dbo].[Suppliers$].SupplierName
FROM Products$
INNER JOIN Suppliers$ ON [dbo].[Products$].SupplierID = [dbo].[Suppliers$].SupplierID
ORDER BY Price DESC

-- Which supplier supplies the most products? -- Pavlova Ltd.
SELECT TOP 1 COUNT([dbo].[Suppliers$].SupplierName) AS SupplierCount, [dbo].[Suppliers$].SupplierName
FROM Products$
INNER JOIN Suppliers$ ON [dbo].[Products$].SupplierID = [dbo].[Suppliers$].SupplierID
GROUP BY [dbo].[Suppliers$].SupplierName
ORDER BY SupplierCount DESC

-- How many products cost over £10 but less than £50? 56
SELECT COUNT(*) FROM [dbo].[Products$]
WHERE Price > 10 AND Price < 50