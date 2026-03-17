CREATE DATABASE BookMartDB2;


USE BookMartDB2;

-- Books Table
CREATE TABLE Books (
    BookID INT IDENTITY(1,1) PRIMARY KEY,
    Title NVARCHAR(150) NOT NULL,
    Stock INT NOT NULL CHECK (Stock >= 0),
    Price DECIMAL(10,2) NOT NULL
);

-- Orders Table
CREATE TABLE Orders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    BookID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    OrderDate DATETIME2 DEFAULT SYSDATETIME(),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);
--Stored Procedure: Add Book

CREATE PROCEDURE sp_AddNewBook
    @Title NVARCHAR(150),
    @Stock INT,
    @Price DECIMAL(10,2)
AS
BEGIN
    BEGIN TRY
        IF @Stock < 0 OR @Price <= 0
            THROW 50001, 'Invalid stock or price.', 1;

        INSERT INTO Books (Title, Stock, Price)
        VALUES (@Title, @Stock, @Price);

        PRINT 'Book added successfully.';
    END TRY
    BEGIN CATCH
        PRINT 'Error: ' + ERROR_MESSAGE();
    END CATCH
END;

--Stored Procedure: Place Order

CREATE PROCEDURE sp_PlaceOrder
    @BookID INT,
    @Quantity INT
AS
BEGIN
    SET XACT_ABORT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        IF NOT EXISTS (
            SELECT 1 FROM Books
            WHERE BookID = @BookID AND Stock >= @Quantity
        )
        BEGIN
            RAISERROR('Not enough stock or book not found.', 16, 1);
        END

        UPDATE Books
        SET Stock = Stock - @Quantity
        WHERE BookID = @BookID;

        INSERT INTO Orders (BookID, Quantity)
        VALUES (@BookID, @Quantity);

        COMMIT TRANSACTION;

        PRINT 'Order placed successfully.';
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        PRINT 'Error ' + CAST(ERROR_NUMBER() AS VARCHAR)
              + ': ' + ERROR_MESSAGE();
    END CATCH
END;

-- Insert sample data
EXEC sp_AddNewBook 'Book A', 10, 500;
EXEC sp_AddNewBook 'Book B', 5, 300;
EXEC sp_AddNewBook 'Book C', 2, 150;

-- Successful order
EXEC sp_PlaceOrder 1, 2;

-- Insufficient stock
EXEC sp_PlaceOrder 3, 10;

-- Invalid BookID
EXEC sp_PlaceOrder 99, 1;

-- View results
SELECT * FROM Books;
SELECT * FROM Orders;