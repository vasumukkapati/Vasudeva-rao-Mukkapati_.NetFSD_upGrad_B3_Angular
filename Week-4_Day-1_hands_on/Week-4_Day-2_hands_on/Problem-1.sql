CREATE DATABASE AutoRetailDB;


USE AutoRetailDB;

--Create Products Table

CREATE TABLE Products
(
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    StockQty INT
);

--Create Orders Table

CREATE TABLE Orders
(
    OrderID INT PRIMARY KEY,
    OrderDate DATETIME DEFAULT GETDATE()
);

--Create Order_Items Table
CREATE TABLE Order_Items
(
    OrderItemID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,

    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

--Insert Sample Data
INSERT INTO Products VALUES
(1,'Tyre',50),
(2,'Brake Pad',40),
(3,'Engine Oil',30);



--Create Trigger to Reduce Stock

CREATE TRIGGER trg_UpdateStock
ON Order_Items
AFTER INSERT
AS
BEGIN

    IF EXISTS (
        SELECT 1
        FROM Products p
        JOIN inserted i ON p.ProductID = i.ProductID
        WHERE p.StockQty < i.Quantity
    )
    BEGIN
        RAISERROR('Insufficient Stock',16,1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    UPDATE p
    SET p.StockQty = p.StockQty - i.Quantity
    FROM Products p
    JOIN inserted i ON p.ProductID = i.ProductID;

END;


--Transaction to Place Order

BEGIN TRANSACTION;

INSERT INTO Orders VALUES (101,GETDATE());

INSERT INTO Order_Items VALUES
(1,101,1,5),
(2,101,2,3);

COMMIT;

--Test Insufficient Stock (Rollback Example)

BEGIN TRANSACTION;

INSERT INTO Orders VALUES (102,GETDATE());

INSERT INTO Order_Items VALUES
(3,102,1,500);   -- stock not available

COMMIT;

--Check Stock

SELECT * FROM Products;