CREATE DATABASE EcommDb;


USE EcommDb;

CREATE TABLE Categories
(
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50)
);

CREATE TABLE Brands
(
    BrandID INT PRIMARY KEY,
    BrandName VARCHAR(50)
);

CREATE TABLE Products
(
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    BrandID INT,
    CategoryID INT,
    Price DECIMAL(10,2),

    FOREIGN KEY (BrandID) REFERENCES Brands(BrandID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

CREATE TABLE Customers
(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    City VARCHAR(50)
);

CREATE TABLE Stores
(
    StoreID INT PRIMARY KEY,
    StoreName VARCHAR(50),
    City VARCHAR(50)
);

INSERT INTO Categories VALUES (1,'Cars');
INSERT INTO Categories VALUES (2,'Bikes');
INSERT INTO Categories VALUES (3,'Trucks');
INSERT INTO Categories VALUES (4,'SUV');
INSERT INTO Categories VALUES (5,'Electric Vehicles');

INSERT INTO Brands VALUES (1,'Toyota');
INSERT INTO Brands VALUES (2,'Honda');
INSERT INTO Brands VALUES (3,'Ford');
INSERT INTO Brands VALUES (4,'Hyundai');
INSERT INTO Brands VALUES (5,'Tesla');

INSERT INTO Products VALUES (101,'Toyota Corolla',1,1,20000);
INSERT INTO Products VALUES (102,'Honda Shine',2,2,90000);
INSERT INTO Products VALUES (103,'Ford F150',3,3,30000);
INSERT INTO Products VALUES (104,'Hyundai Creta',4,4,18000);
INSERT INTO Products VALUES (105,'Tesla Model 3',5,5,35000);

INSERT INTO Customers VALUES (1,'Ravi','Hyderabad');
INSERT INTO Customers VALUES (2,'Suresh','Chennai');
INSERT INTO Customers VALUES (3,'Anil','Hyderabad');
INSERT INTO Customers VALUES (4,'Rahul','Bangalore');
INSERT INTO Customers VALUES (5,'Kiran','Hyderabad');

INSERT INTO Stores VALUES (1,'AutoHub','Hyderabad');
INSERT INTO Stores VALUES (2,'CarZone','Chennai');
INSERT INTO Stores VALUES (3,'DriveMart','Bangalore');
INSERT INTO Stores VALUES (4,'VehicleWorld','Delhi');
INSERT INTO Stores VALUES (5,'SpeedMotors','Mumbai');

--Display all Products with Brand and Category

SELECT 
P.ProductName,
B.BrandName,
C.CategoryName
FROM Products P
JOIN Brands B
ON P.BrandID = B.BrandID
JOIN Categories C
ON P.CategoryID = C.CategoryID;

---Retrieve Customers from a Specific City

SELECT *
FROM Customers
WHERE City = 'Hyderabad';

--Total Products in Each Category

SELECT 
C.CategoryName,
COUNT(P.ProductID) AS TotalProducts
FROM Categories C
JOIN Products P
ON C.CategoryID = P.CategoryID
GROUP BY C.CategoryName;