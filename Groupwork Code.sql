CREATE TABLE School (
    SchoolID INT PRIMARY KEY,
    Name VARCHAR(100),
    Location VARCHAR(100),
    ContactInfo VARCHAR(50),
    PrincipalName VARCHAR(50);

INSERT INTO School (SchoolID, Name, Location, ContactInfo, PrincipalName) VALUES
(1, 'Greenfield Academy', 'Nairobi', '+254700123456', 'Jane Kimani'),
(2, 'Lakeside High', 'Kisumu', '+254700789012', 'John Wafula'),
(3, 'Sunrise Primary', 'Mombasa', '+254711223344', 'Grace Mwangi'),
(4, 'Hilltop School', 'Eldoret', '+254733445566', 'Peter Otieno'),
(5, 'Starlight Academy', 'Nakuru', '+254755667788', 'Lucy Kimani');

SELECT * FROM School;

CREATE TABLE MealPlan (
    MealPlanID INT PRIMARY KEY,
    Description TEXT
);


INSERT INTO MealPlan (MealPlanID, Description) VALUES
(1, 'Balanced diet with rice, beans'),
(2, 'High-protein vegetarian meals'),
(3, 'Fruit and vegetable snacks'),
(4, 'Packed lunch with sandwiches'),
(5, 'Traditional Kenyan dishes');

SELECT * FROM MealPlan;


CREATE TABLE Distribution (
    DistributionID INT PRIMARY KEY,
    Date DATE,
    Quantity INT,
    SchoolID INT,
    MealPlanID INT,
    FOREIGN KEY (SchoolID) REFERENCES School(SchoolID),
    FOREIGN KEY (MealPlanID) REFERENCES MealPlan(MealPlanID)
);

-- Insert data into Distribution table
INSERT INTO Distribution (DistributionID, Date, Quantity, SchoolID, MealPlanID) VALUES
(1, '2024-11-01', 100, 1, 1),
(2, '2024-11-03', 80, 2, 2),
(3, '2024-11-04', 120, 3, 3),
(4, '2024-11-05', 75, 4, 4),
(5, '2024-11-06', 90, 5, 5);

SELECT * FROM Distribution;


SELECT 
    School.Name AS SchoolName, 
    MealPlan.Description AS MealPlan 
FROM 
    Distribution 
LEFT JOIN School ON Distribution.SchoolID = School.SchoolID 
LEFT JOIN MealPlan ON Distribution.MealPlanID = MealPlan.MealPlanID
UNION
SELECT 
    School.Name AS SchoolName, 
    MealPlan.Description AS MealPlan 
FROM 
    Distribution 
RIGHT JOIN School ON Distribution.SchoolID = School.SchoolID 
RIGHT JOIN MealPlan ON Distribution.MealPlanID = MealPlan.MealPlanID;


CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Gender CHAR(1),
    DateOfBirth DATE,
    Class VARCHAR(20)
);


INSERT INTO Student (StudentID, Name, Gender, DateOfBirth, Class) VALUES
(1, 'Alice Wanjiku', 'F', '2012-05-20', '6A'),
(2, 'Brian Otieno', 'M', '2011-09-12', '7B'),
(3, 'Cynthia Mwangi', 'F', '2013-01-15', '5C'),
(4, 'David Njoroge', 'M', '2010-03-28', '8A'),
(5, 'Esther Kamau', 'F', '2014-08-05', '4D');

SELECT * FROM Student;


ALTER TABLE Student
ADD Email VARCHAR(100);


SELECT Name, Class 
FROM Student 
WHERE Class IN ('6A', '7B');

SELECT Name, DateOfBirth 
FROM Student 
WHERE DateOfBirth BETWEEN '2011-01-01' AND '2013-12-31';

DELETE FROM Student
WHERE Class = '8A';

SELECT Name, 'Male' AS Gender FROM Student WHERE Gender = 'M'
UNION
SELECT Name, 'Female' AS Gender FROM Student WHERE Gender = 'F';

UPDATE Student
SET Class = '6B'
WHERE Name = 'Alice Wanjiku';

SELECT 
    Name, 
    Class, 
    Gender 
FROM 
    Student 
ORDER BY 
    Class, Name;

SELECT 
    A.Name AS Student1, 
    B.Name AS Student2, 
    A.Class 
FROM 
    Student A 
JOIN 
    Student B ON A.Class = B.Class 
WHERE 
    A.StudentID < B.StudentID;


CREATE TABLE FoodItem (
    FoodItemID INT PRIMARY KEY,
    FoodName VARCHAR(100),
    NutritionalValue TEXT,
    Category VARCHAR(50)
);


INSERT INTO FoodItem (FoodItemID, FoodName, NutritionalValue, Category) VALUES
(1, 'Rice', 'High in carbohydrates', 'Grains'),
(2, 'Beans', 'High in protein', 'Legumes'),
(3, 'Banana', 'High in potassium', 'Fruits'),
(4, 'Spinach', 'Rich in iron', 'Vegetables'),
(5, 'Chapati', 'Energy-rich food', 'Breads & Pastries');

SELECT * FROM FoodItem;


CREATE TABLE Consumption (
    ConsumptionID INT PRIMARY KEY,
    StudentID INT,
    FoodItemID INT,
    QuantityConsumed INT,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (FoodItemID) REFERENCES FoodItem(FoodItemID)
);


INSERT INTO Consumption (ConsumptionID, StudentID, FoodItemID, QuantityConsumed) VALUES
(1, 1, 1, 2),
(2, 2, 2, 1),
(3, 3, 3, 3),
(4, 4, 4, 2),
(5, 5, 5, 1);

SELECT * FROM Consumption;


SELECT 
    S.Name AS StudentName, 
    F.FoodName AS ConsumedFood, 
    F.Category AS FoodCategory 
FROM 
    Consumption C 
INNER JOIN Student S ON C.StudentID = S.StudentID
INNER JOIN FoodItem F ON C.FoodItemID = F.FoodItemID;


CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY,
    Date DATE,
    Status VARCHAR(10),
    StudentID INT,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);

INSERT INTO Attendance (AttendanceID, Date, Status, StudentID) VALUES
(1, '2024-11-01', 'Present', 1),
(2, '2024-11-02', 'Absent', 2),
(3, '2024-11-03', 'Present', 3),
(4, '2024-11-04', 'Present', 4),
(5, '2024-11-05', 'Absent', 5);

SELECT * FROM Attendance;

DROP TABLE IF EXISTS Attendance;




