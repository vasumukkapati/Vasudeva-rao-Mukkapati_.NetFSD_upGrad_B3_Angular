CREATE DATABASE OrderManagementDB;

USE OrderManagementDB;


CREATE TABLE orders
(
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    order_status INT,
    shipped_date DATE
);

INSERT INTO orders VALUES
(1,'Ravi',1,NULL),
(2,'Priya',2,NULL),
(3,'Arun',3,'2024-01-10');


CREATE TRIGGER trg_validate_order_status
ON orders
AFTER UPDATE
AS
BEGIN
    BEGIN TRY

        IF EXISTS
        (
            SELECT *
            FROM inserted
            WHERE order_status = 4
            AND shipped_date IS NULL
        )
        BEGIN
            RAISERROR('Shipped date cannot be NULL when order status is Completed',16,1);
            ROLLBACK TRANSACTION;
        END

    END TRY
    BEGIN CATCH
        PRINT 'Error occurred in trigger';
        ROLLBACK TRANSACTION;
    END CATCH
END

--Test the Trigger
UPDATE orders
SET order_status = 4
WHERE order_id = 1;

UPDATE orders
SET order_status = 4,
shipped_date = '2024-02-20'
WHERE order_id = 1;

