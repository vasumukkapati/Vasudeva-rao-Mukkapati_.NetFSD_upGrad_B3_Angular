CREATE DATABASE StoreValidationDB;

USE StoreValidationDB;

CREATE TABLE stores
(
    store_id INT PRIMARY KEY,
    store_name VARCHAR(50)
);

CREATE TABLE products
(
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50)
);

CREATE TABLE orders
(
    order_id INT PRIMARY KEY,
    store_id INT,
    FOREIGN KEY (store_id) REFERENCES stores(store_id)
);

CREATE TABLE order_items
(
    order_id INT,
    product_id INT,
    quantity INT,
    list_price DECIMAL(10,2),
    discount DECIMAL(10,2)
);

CREATE TABLE stocks
(
    store_id INT,
    product_id INT,
    quantity INT
);

INSERT INTO stores VALUES (1,'City Store');
INSERT INTO stores VALUES (2,'Downtown Store');

INSERT INTO products VALUES (101,'Mountain Bike');
INSERT INTO products VALUES (102,'Road Bike');
INSERT INTO products VALUES (103,'Helmet');

INSERT INTO orders VALUES (1,1);
INSERT INTO orders VALUES (2,1);
INSERT INTO orders VALUES (3,2);

INSERT INTO order_items VALUES (1,101,2,1000,50);
INSERT INTO order_items VALUES (1,103,3,200,10);
INSERT INTO order_items VALUES (2,101,1,1000,50);
INSERT INTO order_items VALUES (3,102,4,1200,60);

INSERT INTO stocks VALUES (1,101,0);
INSERT INTO stocks VALUES (1,103,5);
INSERT INTO stocks VALUES (2,102,0);

SELECT store_id, product_id
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id;

SELECT store_id, product_id
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id

INTERSECT

SELECT store_id, product_id
FROM stocks
WHERE quantity > 0;

SELECT store_id, product_id
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id

EXCEPT

SELECT store_id, product_id
FROM stocks
WHERE quantity > 0;

SELECT 
s.store_name,
p.product_name,
SUM(oi.quantity) AS Total_Quantity_Sold,
SUM(oi.quantity * oi.list_price - oi.discount) AS Total_Revenue
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
JOIN stores s
ON o.store_id = s.store_id
JOIN products p
ON oi.product_id = p.product_id
GROUP BY s.store_name, p.product_name
ORDER BY s.store_name, p.product_name;

UPDATE stocks
SET quantity = 0
WHERE product_id IN
(
SELECT product_id
FROM order_items
);

