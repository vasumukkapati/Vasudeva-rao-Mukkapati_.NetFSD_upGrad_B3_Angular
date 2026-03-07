CREATE DATABASE BikeStores;

USE BikeStores;

CREATE TABLE brands (
    brand_id INT PRIMARY KEY,
    brand_name VARCHAR(50)
);

CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    brand_id INT,
    category_id INT,
    model_year INT,
    list_price DECIMAL(10,2)
);

INSERT INTO brands VALUES
(1,'Trek'),
(2,'Giant'),
(3,'Specialized');

INSERT INTO categories VALUES
(1,'Mountain Bikes'),
(2,'Road Bikes'),
(3,'Electric Bikes');

INSERT INTO products VALUES
(1,'Trek Marlin 7',1,1,2022,650),
(2,'Giant Talon 3',2,1,2021,480),
(3,'Specialized Turbo',3,3,2023,1200),
(4,'Trek Domane',1,2,2022,900);

SELECT 
p.product_name,
b.brand_name,
c.category_name,
p.model_year,
p.list_price
FROM products p
INNER JOIN brands b
ON p.brand_id = b.brand_id
INNER JOIN categories c
ON p.category_id = c.category_id
WHERE p.list_price > 500
ORDER BY p.list_price ASC;