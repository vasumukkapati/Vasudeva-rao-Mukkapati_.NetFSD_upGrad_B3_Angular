CREATE DATABASE StoreManagement;


USE StoreManagement;

CREATE TABLE brands(
    brand_id INT PRIMARY KEY,
    brand_name VARCHAR(50)
);

CREATE TABLE categories(
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

CREATE TABLE products(
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    brand_id INT,
    category_id INT,
    model_year INT,
    list_price DECIMAL(10,2),
    FOREIGN KEY (brand_id) REFERENCES brands(brand_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE customers(
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

CREATE TABLE stores(
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100)
);

CREATE TABLE staffs(
    staff_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    store_id INT,
    FOREIGN KEY (store_id) REFERENCES stores(store_id)
);

CREATE TABLE orders(
    order_id INT PRIMARY KEY,
    customer_id INT,
    store_id INT,
    staff_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (store_id) REFERENCES stores(store_id),
    FOREIGN KEY (staff_id) REFERENCES staffs(staff_id)
);

INSERT INTO brands VALUES
(1,'Trek'),
(2,'Giant'),
(3,'Specialized');

INSERT INTO categories VALUES
(1,'Mountain Bike'),
(2,'Road Bike'),
(3,'Electric Bike');

INSERT INTO products VALUES
(1,'Trek Marlin',1,1,2022,55000),
(2,'Giant Escape',2,2,2023,48000),
(3,'Specialized Turbo',3,3,2024,95000);

INSERT INTO customers VALUES
(1,'Ravi','Kumar'),
(2,'Anil','Sharma'),
(3,'Sita','Devi');

INSERT INTO stores VALUES
(1,'Hyderabad Store'),
(2,'Delhi Store');

INSERT INTO staffs VALUES
(1,'Raj','Patel',1),
(2,'Amit','Verma',2);

INSERT INTO orders VALUES
(1,1,1,1,'2024-01-10'),
(2,2,2,2,'2024-02-15'),
(3,3,1,1,'2024-03-20');

CREATE VIEW vw_ProductDetails
AS
SELECT 
    p.product_name,
    b.brand_name,
    c.category_name,
    p.model_year,
    p.list_price
FROM products p
JOIN brands b ON p.brand_id = b.brand_id
JOIN categories c ON p.category_id = c.category_id;

SELECT * FROM vw_ProductDetails;

CREATE VIEW vw_OrderDetails
AS
SELECT 
    o.order_id,
    c.first_name + ' ' + c.last_name AS customer_name,
    s.store_name,
    st.first_name + ' ' + st.last_name AS staff_name,
    o.order_date
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN stores s ON o.store_id = s.store_id
JOIN staffs st ON o.staff_id = st.staff_id;

SET STATISTICS TIME ON;
SET STATISTICS IO ON;