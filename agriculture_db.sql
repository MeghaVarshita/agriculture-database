create database Agriculture_db;
use Agriculture_db;
CREATE TABLE Farmer (
    FarmerID INT AUTO_INCREMENT PRIMARY KEY, 
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    Address VARCHAR(255) NOT NULL
) AUTO_INCREMENT = 1;

CREATE TABLE Farm (
    FarmID INT AUTO_INCREMENT PRIMARY KEY, 
    FarmName VARCHAR(100) NOT NULL,
    Location VARCHAR(100) NOT NULL,
    Size DECIMAL(10, 2) NOT NULL,
    FarmerID INT NOT NULL, 
    FOREIGN KEY (FarmerID) REFERENCES Farmer(FarmerID) ON DELETE CASCADE
) AUTO_INCREMENT = 111;

CREATE TABLE Crop (
    CropID INT AUTO_INCREMENT PRIMARY KEY, 
    CropName VARCHAR(100) NOT NULL,
    Type VARCHAR(50) NOT NULL,
    FarmID INT NOT NULL, 
    FOREIGN KEY (FarmID) REFERENCES Farm(FarmID) ON DELETE CASCADE
) AUTO_INCREMENT = 221;

CREATE TABLE Livestock (
    LivestockID INT AUTO_INCREMENT PRIMARY KEY, 
    AnimalType VARCHAR(50) NOT NULL,
    Count INT NOT NULL CHECK (Count >= 0), 
    FarmID INT NOT NULL, 
    FOREIGN KEY (FarmID) REFERENCES Farm(FarmID) ON DELETE CASCADE
) AUTO_INCREMENT = 331;

CREATE TABLE Equipment (
    EquipmentID INT AUTO_INCREMENT PRIMARY KEY, 
    EquipmentName VARCHAR(100) NOT NULL,
    PurchaseDate DATE NOT NULL,
    FarmID INT NOT NULL, 
    FOREIGN KEY (FarmID) REFERENCES Farm(FarmID) ON DELETE CASCADE
) AUTO_INCREMENT = 441;

CREATE TABLE Employee (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY, 
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL, 
    Gender ENUM('M', 'F') NOT NULL,
    Address VARCHAR(255) NOT NULL,
    Phone VARCHAR(15) NOT NULL UNIQUE, 
    FarmID INT NOT NULL, 
    FOREIGN KEY (FarmID) REFERENCES Farm(FarmID) ON DELETE CASCADE
) AUTO_INCREMENT = 551;

CREATE TABLE Supplier (
    SupplierID INT AUTO_INCREMENT PRIMARY KEY, 
    SupplierName VARCHAR(100) NOT NULL,
    ContactPerson VARCHAR(100) NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE 
) AUTO_INCREMENT = 661;

CREATE TABLE Product (
    ProductID INT AUTO_INCREMENT PRIMARY KEY, 
    ProductName VARCHAR(100) NOT NULL,
    SupplierID INT NOT NULL, 
    Price DECIMAL(10, 2) NOT NULL,
    QuantityInStock INT NOT NULL DEFAULT 0, 
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID) ON DELETE CASCADE
) AUTO_INCREMENT = 771;

CREATE TABLE Sale (
    SaleID INT AUTO_INCREMENT PRIMARY KEY, 
    SaleDate DATE NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    FarmerID INT NOT NULL, 
    FOREIGN KEY (FarmerID) REFERENCES Farmer(FarmerID) ON DELETE CASCADE
) AUTO_INCREMENT = 881;


ALTER TABLE Farmer ADD COLUMN Gender ENUM('M', 'F') NOT NULL;
INSERT INTO Farmer (FarmerID, FirstName, LastName, Gender, Phone, Address)
VALUES 
(1, 'Aarav', 'Sharma', 'M', '1234567890', '1, MG Road, Bangalore, Karnataka, 560001'),
(2, 'Isha', 'Patel', 'F', '2345678901', '2, Park Street, Kolkata, West Bengal, 700016'),
(3, 'Vihaan', 'Gupta', 'M', '3456789012', '3, Connaught Place, New Delhi, Delhi, 110001'),
(4, 'Ananya', 'Reddy', 'F', '4567890123', '4, Marine Drive, Mumbai, Maharashtra, 400002'),
(5, 'Krishna', 'Mehta', 'M', '5678901234', '5, MG Marg, Agra, Uttar Pradesh, 282001'),
(6, 'Sneha', 'Desai', 'F', '6789012345', '6, Brigade Road, Bangalore, Karnataka, 560025'),
(7, 'Rohan', 'Verma', 'M', '7890123456', '7, Janpath, New Delhi, Delhi, 110001'),
(8, 'Priya', 'Nair', 'F', '8901234567', '8, Banjara Hills, Hyderabad, Telangana, 500034'),
(9, 'Aditya', 'Singh', 'M', '9012345678', '9, Nungambakkam, Chennai, Tamil Nadu, 600034'),
(10, 'Nisha', 'Choudhary', 'F', '0123456789', '10, Ratan Tata Road, Mumbai, Maharashtra, 400020'),
(11, 'Karan', 'Joshi', 'M', '9876543210', '11, Park Avenue, Pune, Maharashtra, 411001'),
(12, 'Deepika', 'Bansal', 'F', '8765432109', '12, Ameerpet, Hyderabad, Telangana, 500016');

INSERT INTO Farm (FarmID,FarmName, Location, Size, FarmerID)
VALUES 
(111,'Green Valley Farms', 'Bangalore, Karnataka', 15.50, 1),
(112,'Sunrise Agriculture', 'Mumbai, Maharashtra', 22.00, 2),
(113,'Golden Harvest', 'Chennai, Tamil Nadu', 18.75, 3),
(114,'Blue Sky Plantation', 'Hyderabad, Telangana', 35.25, 4),
(115,'EcoLand Farms', 'Kolkata, West Bengal', 42.60, 5),
(116,'Fresh Fields', 'Pune, Maharashtra', 12.80, 6),
(117,'AgriNova', 'Delhi, Delhi', 25.30, 7),
(118,'Riverbend Farms', 'Lucknow, Uttar Pradesh', 55.20, 8),
(119,'Sunny Hill Farms', 'Ahmedabad, Gujarat', 33.40, 9),
(120,'Orchard Acres', 'Jaipur, Rajasthan', 20.10, 10),
(121,'Vibrant Fields', 'Indore, Madhya Pradesh', 45.50, 11),
(122,'Silver Creek Farms', 'Coimbatore, Tamil Nadu', 37.75, 12);

INSERT INTO Crop (CropName, Type, FarmID)
VALUES 
('Wheat', 'Cereal', 111),
('Rice', 'Cereal', 112),
('Corn', 'Cereal', 113),
('Tomato', 'Vegetable', 114),
('Potato', 'Vegetable', 115),
('Mango', 'Fruit', 116),
('Banana', 'Fruit', 117),
('Cabbage', 'Vegetable', 118),
('Cotton', 'Fiber', 119),
('Soybean', 'Legume', 120),
('Sugarcane', 'Cash Crop', 121),
('Peanut', 'Legume', 122);

INSERT INTO Livestock (AnimalType, Count, FarmID)
VALUES 
('Cattle', 20, 111),
('Sheep', 15, 112),
('Goats', 30, 113),
('Chickens', 100, 114),
('Pigs', 25, 115),
('Ducks', 50, 116),
('Buffaloes', 18, 117),
('Turkeys', 35, 118),
('Horses', 10, 119),
('Rabbits', 40, 120),
('Geese', 60, 121),
('Camels', 8, 122);

INSERT INTO Equipment (EquipmentName, PurchaseDate, FarmID)
VALUES 
('Tractor', '2020-05-20', 111),
('Plough', '2019-07-15', 112),
('Harvester', '2021-03-10', 113),
('Seeder', '2018-11-25', 114),
('Sprayer', '2022-02-18', 115),
('Water Pump', '2017-06-08', 116),
('Fertilizer Spreader', '2020-09-30', 117),
('Irrigation System', '2019-10-12', 118),
('Cultivator', '2021-01-19', 119),
('Greenhouse Equipment', '2018-04-25', 120),
('Baler', '2020-12-05', 121),
('Combine Harvester', '2022-07-21', 122);

INSERT INTO Employee (FirstName, LastName, DateOfBirth, Gender, Address, Phone, FarmID)
VALUES
('Amit', 'Sharma', '1985-06-12', 'M', '12, MG Road, Delhi', '9876543210', 111),
('Neha', 'Verma', '1990-08-19', 'F', '56, MG Road, Delhi', '9876543211', 112),
('Ravi', 'Kumar', '1987-03-21', 'M', '24, MG Road, Delhi', '9876543212', 113),
('Meena', 'Singh', '1992-11-30', 'F', '10, Sarita Vihar, Delhi', '9876543213', 111),
('Vikram', 'Patel', '1980-02-10', 'M', '45, CP, Delhi', '9876543214', 112),
('Sunita', 'Joshi', '1988-05-25', 'F', '78, Green Park, Delhi', '9876543215', 113),
('Suresh', 'Mehta', '1984-12-14', 'M', '13, Janakpuri, Delhi', '9876543216', 111),
('Priya', 'Desai', '1995-03-09', 'F', '34, Malviya Nagar, Delhi', '9876543217', 112),
('Rakesh', 'Chawla', '1983-04-20', 'M', '67, Lajpat Nagar, Delhi', '9876543218', 113),
('Swati', 'Kapoor', '1991-06-15', 'F', '99, Hauz Khas, Delhi', '9876543219', 111),
('Ajay', 'Malhotra', '1986-09-27', 'M', '52, Rohini, Delhi', '9876543220', 112),
('Pooja', 'Kumar', '1989-12-05', 'F', '101, Vasant Kunj, Delhi', '9876543221', 113);

INSERT INTO Supplier (SupplierName, ContactPerson, Phone, Email)
VALUES
('AgroSupplies', 'Rakesh Singh', '9876543111', 'rakesh@agrosupplies.com'),
('FarmingTools', 'Priya Jain', '9876543222', 'priya@farmingtools.com'),
('GrowEquip', 'Manoj Agarwal', '9876543333', 'manoj@growequip.com'),
('AgriStore', 'Vikash Nair', '9876543444', 'vikash@agristore.com'),
('HarvestHub', 'Rohan Sharma', '9876543555', 'rohan@harvesthub.com'),
('SeedMart', 'Anjali Deshmukh', '9876543666', 'anjali@seedmart.com'),
('FertileSoil', 'Rahul Gupta', '9876543777', 'rahul@fertilesoil.com'),
('GreenTools', 'Pallavi Rao', '9876543888', 'pallavi@greentools.com'),
('FarmersAlly', 'Sandeep Patel', '9876543999', 'sandeep@farmersally.com'),
('AgriConnect', 'Bhavna Reddy', '9876544000', 'bhavna@agriconnect.com'),
('TractorPoint', 'Mohan Joshi', '9876544111', 'mohan@tractorpoint.com'),
('CropGears', 'Meghna Bansal', '9876544222', 'meghna@cropgears.com');

INSERT INTO Product (ProductName, SupplierID, Price, QuantityInStock)
VALUES
('Tractor', 661, 500000.00, 5),
('Harvester', 662, 250000.00, 2),
('Irrigation Pump', 663, 30000.00, 10),
('Plough', 664, 15000.00, 20),
('Fertilizer', 665, 1000.00, 100),
('Pesticide', 666, 2000.00, 50),
('Shovel', 667, 500.00, 200),
('Tiller', 668, 80000.00, 8),
('Seed Drill', 669, 40000.00, 15),
('Combine Harvester', 670, 600000.00, 3),
('Water Tank', 671, 10000.00, 30),
('Sprayer', 672, 7000.00, 25);

INSERT INTO Sale (SaleDate, TotalAmount, FarmerID)
VALUES
('2024-01-01', 250000.00, 1),
('2024-01-05', 180000.00, 2),
('2024-02-12', 320000.00, 3),
('2024-02-20', 150000.00, 4),
('2024-03-02', 50000.00, 5),
('2024-03-10', 80000.00, 6),
('2024-03-15', 120000.00, 7),
('2024-03-22', 220000.00, 8),
('2024-04-05', 260000.00, 9),
('2024-04-11', 190000.00, 10),
('2024-04-20', 340000.00, 11),
('2024-05-02', 280000.00, 12);

INSERT INTO Customer (CustomerName, ContactNumber, Email, Address)
VALUES
('Rahul Mehta', '9876543000', 'rahul@example.com', '123, Andheri West, Mumbai'),
('Sneha Rao', '9876543001', 'sneha@example.com', '45, Koramangala, Bangalore'),
('Ankit Kapoor', '9876543002', 'ankit@example.com', '99, Gachibowli, Hyderabad'),
('Pooja Gupta', '9876543003', 'pooja@example.com', '78, MG Road, Pune'),
('Vishal Singh', '9876543004', 'vishal@example.com', '12, Salt Lake, Kolkata'),
('Meera Verma', '9876543005', 'meera@example.com', '34, Sector 18, Noida'),
('Rohan Agarwal', '9876543006', 'rohan@example.com', '56, Jayanagar, Bangalore'),
('Anjali Desai', '9876543007', 'anjali@example.com', '23, Whitefield, Bangalore'),
('Shivam Nair', '9876543008', 'shivam@example.com', '11, Powai, Mumbai'),
('Kavita Reddy', '9876543009', 'kavita@example.com', '67, Banjara Hills, Hyderabad'),
('Siddharth Patel', '9876543010', 'siddharth@example.com', '88, South Ex, Delhi'),
('Deepika Chawla', '9876543011', 'deepika@example.com', '19, Vile Parle, Mumbai');

CREATE TABLE Purchase (
    PurchaseID INT AUTO_INCREMENT PRIMARY KEY,    
    PurchaseDate DATE NOT NULL,                   
    ProductID INT NOT NULL,                       
    Quantity INT NOT NULL CHECK (Quantity > 0),   
    TotalCost DECIMAL(10, 2) NOT NULL,            
    FarmerID INT NOT NULL,                        
    SupplierID INT NOT NULL,                      
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID) ON DELETE CASCADE,
    FOREIGN KEY (FarmerID) REFERENCES Farmer(FarmerID) ON DELETE CASCADE,
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID) ON DELETE CASCADE
) AUTO_INCREMENT = 991;

INSERT INTO Purchase (PurchaseDate, ProductID, Quantity, TotalCost, FarmerID, SupplierID)
VALUES 
('2024-01-05', 771, 20, 5000.00, 1, 661),
('2024-01-15', 772, 15, 3500.00, 2, 662),
('2024-02-10', 773, 10, 2000.00, 3, 663),
('2024-02-20', 774, 25, 6250.00, 4, 664),
('2024-03-05', 775, 30, 9000.00, 5, 665),
('2024-03-15', 776, 12, 3000.00, 6, 666),
('2024-04-01', 777, 22, 5500.00, 7, 667),
('2024-04-10', 778, 18, 4500.00, 8, 668),
('2024-04-20', 779, 20, 5000.00, 9, 669),
('2024-05-01', 780, 10, 2500.00, 10, 670),
('2024-05-10', 781, 28, 7000.00, 11, 671),
('2024-05-20', 782, 16, 4000.00, 12, 672);




SELECT * FROM information_schema.tables;
use information_schema;
SELECT 
    TABLE_NAME, 
    COLUMN_NAME, 
    CONSTRAINT_NAME 
FROM 
    information_schema.KEY_COLUMN_USAGE 
WHERE 
    TABLE_SCHEMA = 'Agriculture_db' AND 
    CONSTRAINT_NAME = 'PRIMARY';
    
use Agriculture_db;
SELECT FarmID, AVG(Count) AS AverageLivestockCount
FROM Livestock
GROUP BY FarmID;

select * from Farm;
SELECT SUM(TotalAmount) AS TotalSales FROM Sale;

UPDATE Product
SET QuantityInStock = QuantityInStock + 5
WHERE ProductID = 771;
select * from Product;
SELECT AVG(Size) AS AverageFarmSize FROM Farm;
ALTER TABLE Employee
ADD Salary DECIMAL(10, 2) NULL;
SET SQL_SAFE_UPDATES = 0;


UPDATE Employee
SET Salary = 30000;

ALTER TABLE Employee
MODIFY Salary DECIMAL(10, 2) NOT NULL;

select * from Employee;
SET SQL_SAFE_UPDATES = 1;

SELECT SUM(Price * QuantityInStock) AS TotalInventoryValue 
FROM Product;

SELECT * 
FROM Farmer 
WHERE Phone LIKE '123%';

SELECT * 
FROM Product 
WHERE ProductName NOT LIKE 'Fertilizer%';

SELECT FarmID, COUNT(*) AS EmployeeCount 
FROM Employee 
GROUP BY FarmID 
HAVING COUNT(*) > 3;

SELECT AnimalType, 
       CASE 
           WHEN Count > 100 THEN 'Large'
           WHEN Count BETWEEN 50 AND 100 THEN 'Medium'
           ELSE 'Small'
       END AS SizeCategory
FROM Livestock;

SELECT * 
FROM Sale 
WHERE SaleDate BETWEEN '2024-03-01' AND '2024-05-31';

SELECT *
FROM Farmer f
WHERE EXISTS (
    SELECT 1
    FROM Sale s
    WHERE s.FarmerID = f.FarmerID
);

UPDATE Employee
SET Salary = ROUND(30000 + (RAND() * 20000))
WHERE EmployeeID BETWEEN 551 AND 562; 
select * from Employee;




SELECT FarmerID, AVG(TotalCost) AS AveragePurchaseCost 
FROM Purchase 
GROUP BY FarmerID;

SELECT ProductID, PurchaseDate, SUM(Quantity) AS TotalQuantity 
FROM Purchase 
GROUP BY ProductID, PurchaseDate;

SELECT Farmer.FirstName, Farmer.LastName, SUM(Sale.TotalAmount) AS TotalSales 
FROM Farmer
JOIN Sale ON Farmer.FarmerID = Sale.FarmerID
GROUP BY Farmer.FarmerID;

SELECT Farmer.FirstName, Farmer.LastName, Equipment.EquipmentName 
FROM Farmer
JOIN Farm ON Farmer.FarmerID = Farm.FarmerID
JOIN Equipment ON Farm.FarmID = Equipment.FarmID;

SELECT Farmer.FirstName, Farmer.LastName, Farm.FarmName
FROM Farmer
INNER JOIN Farm ON Farmer.FarmerID = Farm.FarmerID;

SELECT Farmer.FirstName, Farmer.LastName, Farm.FarmName
FROM Farmer
CROSS JOIN Farm;

SELECT Farmer.FirstName, Farmer.LastName, SUM(Sale.TotalAmount) AS TotalSales
FROM Farmer
JOIN Sale ON Farmer.FarmerID = Sale.FarmerID
GROUP BY Farmer.FarmerID;

desc Farmer;
desc Farm;
desc Crop;
desc Livestock;
desc Equipment;
desc Employee;
desc Supplier;
desc Product;
desc Sale;
desc Purchase;

select * from Farmer;
select * from Farm;
select * from Crop;
select * from Livestock;
select * from Equipment;
select * from Employee;
select * from Supplier;
select * from Product;
select * from Sale;
select * from Purchase;

SELECT FarmID, AVG(Count) AS AverageLivestockCount
FROM Livestock
GROUP BY FarmID;

select * from Farm;

SELECT SUM(TotalAmount) AS TotalSales FROM Sale;




ALTER TABLE Employee
ADD Salary DECIMAL(10, 2) NULL;

SET SQL_SAFE_UPDATES = 0;

UPDATE Employee
SET Salary = 30000;

ALTER TABLE Employee
MODIFY Salary DECIMAL(10, 2) NOT NULL;

select * from Employee;
SET SQL_SAFE_UPDATES = 1;




UPDATE Product
SET QuantityInStock = QuantityInStock + 5
WHERE ProductID = 771;
select * from Product;

SELECT AVG(Size) AS AverageFarmSize FROM Farm;

SELECT SUM(Price * QuantityInStock) AS TotalInventoryValue 
FROM Product;

SELECT * 
FROM Farmer 
WHERE Phone LIKE '123%';


SELECT FarmID, COUNT(*) AS EmployeeCount 
FROM Employee 
GROUP BY FarmID 
HAVING COUNT(*) > 3;


SELECT AnimalType, 
       CASE 
           WHEN Count > 100 THEN 'Large'
           WHEN Count BETWEEN 50 AND 100 THEN 'Medium'
           ELSE 'Small'
       END AS SizeCategory
FROM Livestock;

SELECT * 
FROM Sale 
WHERE SaleDate BETWEEN '2024-03-01' AND '2024-05-31';


UPDATE Employee
SET Salary = ROUND(30000 + (RAND() * 20000))
WHERE EmployeeID BETWEEN 551 AND 562; 
select * from Employee;

SELECT FarmerID, AVG(TotalCost) AS AveragePurchaseCost 
FROM Purchase 
GROUP BY FarmerID;

SELECT Farmer.FirstName, Farmer.LastName, SUM(Sale.TotalAmount) AS TotalSales 
FROM Farmer
JOIN Sale ON Farmer.FarmerID = Sale.FarmerID
GROUP BY Farmer.FarmerID;

SELECT Farmer.FirstName, Farmer.LastName, Equipment.EquipmentName 
FROM Farmer
JOIN Farm ON Farmer.FarmerID = Farm.FarmerID
JOIN Equipment ON Farm.FarmID = Equipment.FarmID;

SELECT Farmer.FirstName, Farmer.LastName, Farm.FarmName
FROM Farmer
INNER JOIN Farm ON Farmer.FarmerID = Farm.FarmerID;

 
SELECT Farmer.FirstName, Farmer.LastName, Farm.FarmName
FROM Farmer
CROSS JOIN Farm;


SELECT FirstName, LastName, DateOfBirth
FROM Employee
WHERE YEAR(CURDATE()) - YEAR(DateOfBirth) < 30;

show tables;













































