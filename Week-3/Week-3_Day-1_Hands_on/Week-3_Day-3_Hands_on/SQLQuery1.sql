CREATE DATABASE StoreDB;

USE StoreDB;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_status INT
);

SELECT 
    c.first_name,
    c.last_name,
    o.order_id,
    o.order_date,
    o.order_status
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_status IN (1,4)
ORDER BY o.order_date DESC;

INSERT INTO customers (customer_id, first_name, last_name)
VALUES
(1, 'Rahul', 'Sharma'),
(2, 'Anita', 'Reddy'),
(3, 'Vikram', 'Singh'),
(4, 'Sneha', 'Patel');

SELECT * FROM customers;