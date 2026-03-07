CREATE DATABASE SalesDB;

USE SalesDB;

CREATE TABLE stores (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    store_id INT,
    order_status INT
);

CREATE TABLE order_items (
    item_id INT PRIMARY KEY,
    order_id INT,
    quantity INT,
    list_price DECIMAL(10,2),
    discount DECIMAL(4,2)
);

INSERT INTO stores VALUES
(1,'Hyderabad Store'),
(2,'Delhi Store'),
(3,'Mumbai Store');

INSERT INTO orders VALUES
(101,1,4),
(102,2,4),
(103,3,2),
(104,1,4);

INSERT INTO order_items VALUES
(1,101,2,500,0.1),
(2,102,1,700,0.05),
(3,103,3,300,0.1),
(4,104,2,900,0.2);

SELECT 
s.store_name,
SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS total_sales
FROM stores s
INNER JOIN orders o
ON s.store_id = o.store_id
INNER JOIN order_items oi
ON o.order_id = oi.order_id
WHERE o.order_status = 4
GROUP BY s.store_name
ORDER BY total_sales DESC;