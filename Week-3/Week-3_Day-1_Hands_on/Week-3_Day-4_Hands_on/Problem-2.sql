CREATE DATABASE CustomerDB;

USE CustomerDB;

CREATE TABLE customers
(
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

CREATE TABLE orders
(
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_value DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers VALUES (1,'John','Smith');
INSERT INTO customers VALUES (2,'David','Lee');
INSERT INTO customers VALUES (3,'Rahul','Kumar');
INSERT INTO customers VALUES (4,'Anil','Reddy');
INSERT INTO customers VALUES (5,'Priya','Sharma');

INSERT INTO orders VALUES (101,1,6000);
INSERT INTO orders VALUES (102,1,5000);
INSERT INTO orders VALUES (103,2,7000);
INSERT INTO orders VALUES (104,3,3000);

SELECT 
c.customer_id,
c.first_name + ' ' + c.last_name AS FullName,

ISNULL(
(SELECT SUM(o.order_value)
 FROM orders o
 WHERE o.customer_id = c.customer_id),0
) AS Total_Order_Value,

CASE
WHEN ISNULL((SELECT SUM(o.order_value) FROM orders o WHERE o.customer_id = c.customer_id),0) > 10000
THEN 'Premium'
WHEN ISNULL((SELECT SUM(o.order_value) FROM orders o WHERE o.customer_id = c.customer_id),0)
BETWEEN 5000 AND 10000
THEN 'Regular'
ELSE 'Basic'
END AS Customer_Type

FROM customers c
WHERE c.customer_id IN
(SELECT customer_id FROM orders)

UNION

SELECT 
c.customer_id,
c.first_name + ' ' + c.last_name AS FullName,
0 AS Total_Order_Value,
'No Orders' AS Customer_Type

FROM customers c
WHERE c.customer_id NOT IN
(SELECT customer_id FROM orders);