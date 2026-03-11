CREATE DATABASE OrderMaintenanceDB;

USE OrderMaintenanceDB;

CREATE TABLE orders
(
order_id INT PRIMARY KEY,
customer_id INT,
order_date DATE,
required_date DATE,
shipped_date DATE,
order_status INT
);

CREATE TABLE archived_orders
(
order_id INT,
customer_id INT,
order_date DATE,
required_date DATE,
shipped_date DATE,
order_status INT
);

INSERT INTO orders VALUES (1,101,'2023-01-10','2023-01-15','2023-01-14',4);
INSERT INTO orders VALUES (2,102,'2022-02-12','2022-02-18','2022-02-20',3);
INSERT INTO orders VALUES (3,103,'2022-03-15','2022-03-20','2022-03-19',4);
INSERT INTO orders VALUES (4,104,'2021-01-01','2021-01-05','2021-01-06',3);

INSERT INTO archived_orders
SELECT *
FROM orders
WHERE order_status = 3
AND order_date < DATEADD(YEAR,-1,GETDATE());

DELETE FROM orders
WHERE order_id IN
(
SELECT order_id
FROM orders
WHERE order_status = 3
AND order_date < DATEADD(YEAR,-1,GETDATE())
);

SELECT customer_id
FROM orders
WHERE customer_id NOT IN
(
SELECT customer_id
FROM orders
WHERE order_status <> 4
);

SELECT 
order_id,
order_date,
shipped_date,
DATEDIFF(DAY,order_date,shipped_date) AS Processing_Delay
FROM orders;

SELECT 
order_id,
order_date,
required_date,
shipped_date,

CASE
WHEN shipped_date > required_date THEN 'Delayed'
ELSE 'On Time'
END AS Delivery_Status

FROM orders;

