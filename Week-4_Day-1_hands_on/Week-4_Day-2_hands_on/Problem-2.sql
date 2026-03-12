CREATE DATABASE AutoRetailDB2;


USE AutoRetailDB2;

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
    OrderDate DATETIME,
    Order_Status INT
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

--Insert Order

INSERT INTO Orders VALUES
(101,GETDATE(),1);

--Insert Order Items

INSERT INTO Order_Items VALUES
(1,101,1,5),
(2,101,2,3);

--Atomic Order Cancellation using SAVEPOINT

BEGIN TRY

BEGIN TRANSACTION;

-- Savepoint before restoring stock
SAVE TRANSACTION CancelPoint;

-- Restore stock
UPDATE p
SET p.StockQty = p.StockQty + oi.Quantity
FROM Products p
JOIN Order_Items oi
ON p.ProductID = oi.ProductID
WHERE oi.OrderID = 101;

-- Update order status to Rejected
UPDATE Orders
SET Order_Status = 3
WHERE OrderID = 101;

COMMIT TRANSACTION;

PRINT 'Order cancelled successfully';

END TRY

BEGIN CATCH

PRINT 'Error occurred';

ROLLBACK TRANSACTION CancelPoint;

ROLLBACK TRANSACTION;

END CATCH;

--Check Results

SELECT * FROM Products;

SELECT * FROM Orders;

SELECT * FROM Order_Items;
