CREATE DATABASE StockDB;


USE StockDB;

CREATE TABLE Products
(
ProductID INT PRIMARY KEY,
ProductName VARCHAR(50)
);

CREATE TABLE Stocks
(
ProductID INT PRIMARY KEY,
Quantity INT,
FOREIGN KEY(ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Order_Items
(
OrderItemID INT PRIMARY KEY,
ProductID INT,
Quantity INT,
FOREIGN KEY(ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Products VALUES
(1,'Laptop'),
(2,'Mobile'),
(3,'Tablet');

INSERT INTO Stocks VALUES
(1,50),
(2,100),
(3,30);

--Create AFTER INSERT Trigger

CREATE TRIGGER trg_UpdateStock
ON Order_Items
AFTER INSERT
AS
BEGIN

BEGIN TRY

UPDATE s
SET s.Quantity = s.Quantity - i.Quantity
FROM Stocks s
JOIN inserted i
ON s.ProductID = i.ProductID;

IF EXISTS (SELECT * FROM Stocks WHERE Quantity < 0)
BEGIN
THROW 50001, 'Stock is insufficient for this order', 1;
END

END TRY

BEGIN CATCH
PRINT 'Error occurred while updating stock';
END CATCH

END;

--Valid insert
INSERT INTO Order_Items VALUES (2,1,5);

--Insufficient stock
INSERT INTO Order_Items VALUES (3,3,50);

DROP TRIGGER trg_UpdateStock;

CREATE TRIGGER trg_UpdateStock
ON Order_Items
AFTER INSERT
AS
BEGIN

BEGIN TRY

UPDATE s
SET s.Quantity = s.Quantity - i.Quantity
FROM Stocks s
JOIN inserted i
ON s.ProductID = i.ProductID;

IF EXISTS (SELECT * FROM Stocks WHERE Quantity < 0)
BEGIN
THROW 50001, 'Stock is insufficient for this order', 1;
END

END TRY

BEGIN CATCH
PRINT 'Error occurred while updating stock';
END CATCH

END;

INSERT INTO Order_Items VALUES (2,1,5);
INSERT INTO Order_Items VALUES (3,3,50);