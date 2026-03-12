CREATE DATABASE StoreRevenueDB;

USE StoreRevenueDB;

CREATE TABLE orders
(
    order_id INT PRIMARY KEY,
    store_id INT,
    order_status INT
);

CREATE TABLE order_items
(
    item_id INT PRIMARY KEY,
    order_id INT,
    quantity INT,
    price DECIMAL(10,2),
    discount DECIMAL(10,2)
);

INSERT INTO orders VALUES
(1,101,4),
(2,101,4),
(3,102,4),
(4,103,2);

INSERT INTO order_items VALUES
(1,1,2,500,50),
(2,1,1,300,30),
(3,2,3,200,20),
(4,3,1,1000,100);

CREATE TABLE #Revenue
(
    store_id INT,
    order_id INT,
    revenue DECIMAL(10,2)
);
--Cursor Revenue Calculation

DECLARE @order_id INT
DECLARE @store_id INT
DECLARE @revenue DECIMAL(10,2)

BEGIN TRY

BEGIN TRANSACTION

DECLARE order_cursor CURSOR
FOR
SELECT order_id, store_id
FROM orders
WHERE order_status = 4

OPEN order_cursor

FETCH NEXT FROM order_cursor INTO @order_id,@store_id

WHILE @@FETCH_STATUS = 0
BEGIN

SELECT @revenue =
SUM((price * quantity) - discount)
FROM order_items
WHERE order_id = @order_id

INSERT INTO #Revenue
VALUES(@store_id,@order_id,@revenue)

FETCH NEXT FROM order_cursor INTO @order_id,@store_id

END

CLOSE order_cursor
DEALLOCATE order_cursor

COMMIT TRANSACTION

END TRY

BEGIN CATCH
PRINT 'Error occurred'
ROLLBACK TRANSACTION
END CATCH

--Display Store-Wise Revenue

SELECT store_id,
SUM(revenue) AS Total_Revenue
FROM #Revenue
GROUP BY store_id;