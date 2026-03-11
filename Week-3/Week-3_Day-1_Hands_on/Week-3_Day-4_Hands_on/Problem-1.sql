CREATE DATABASE AutoDb;

USE AutoDb;

CREATE TABLE products
(
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    model_year INT,
    list_price DECIMAL(10,2),
    category_id INT
);

INSERT INTO products VALUES (1,'Mountain Bike',2019,1200,1);
INSERT INTO products VALUES (2,'Road Bike',2020,1500,1);
INSERT INTO products VALUES (3,'Hybrid Bike',2018,800,1);
INSERT INTO products VALUES (4,'Helmet',2021,200,2);
INSERT INTO products VALUES (5,'Gloves',2020,150,2);
INSERT INTO products VALUES (6,'Cycling Shoes',2019,300,2);

SELECT 
product_name + ' (' + CAST(model_year AS VARCHAR) + ')' AS ProductName,
model_year,
list_price,
list_price -
(
SELECT AVG(list_price)
FROM products p2
WHERE p2.category_id = p1.category_id
) AS Price_Difference
FROM products p1
WHERE list_price >
(
SELECT AVG(list_price)
FROM products p2
WHERE p2.category_id = p1.category_id
);