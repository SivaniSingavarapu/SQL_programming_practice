create database Ecommerce_db;
use  Ecommerce_db;
create table customers(
customer_id int primary key,
customer_Name varchar(50),
email varchar(100),
city varchar(50));

create table products(
product_id int primary key,
product_name varchar(100),
category varchar(50),
price DECIMAL(10,2));

create table orders(order_id int primary key,
customer_id int,
product_id int,
order_date DATE,
quantity int,
foreign key (customer_id) references customers (customer_id),
foreign key (product_id) references products (product_id));

INSERT INTO customers (customer_id, customer_name, email, city)
VALUES
(1, 'Sivani', 'sivani@gmail.com', 'Hyderabad'),
(2, 'Rahul', 'rahul@gmail.com', 'Chennai'),
(3, 'Priya', 'priya@gmail.com', 'Bangalore'),
(4, 'Arjun', 'arjun@gmail.com', 'Mumbai'),
(5, 'Sneha', 'sneha@gmail.com', 'Delhi');

 INSERT INTO products (product_id, product_name, category, price)
VALUES
(101, 'Laptop', 'Electronics', 55000.00),
(102, 'Smartphone', 'Electronics', 25000.00),
(103, 'Headphones', 'Accessories', 2000.00),
(104, 'Backpack', 'Bags', 1500.00),
(105, 'Smart Watch', 'Electronics', 5000.00);

INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity)
VALUES
(1001, 1, 101, '2026-08-01', 1),
(1002, 2, 102, '2026-08-03', 2),
(1003, 3, 103, '2026-08-05', 1),
(1004, 4, 104, '2026-08-07', 3),
(1005, 5, 105, '2026-08-10', 1);

SELECT * FROM customers;

SELECT * FROM products;

SELECT * FROM orders;

SELECT 
    customers.customer_name,
    orders.order_id,
    orders.order_date,
    orders.quantity
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id;

SELECT 
    customers.customer_name,
    orders.order_id,
    orders.order_date
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id;

SELECT 
    customers.customer_name,
    orders.order_id,
    orders.order_date
FROM customers
RIGHT JOIN orders
ON customers.customer_id = orders.customer_id;

SELECT 
    customers.customer_name,
    orders.order_id
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id
UNION
SELECT 
    customers.customer_name,
    orders.order_id
FROM customers
RIGHT JOIN orders
ON customers.customer_id = orders.customer_id;

SELECT 
    customers.customer_name,
    products.product_name
FROM customers
CROSS JOIN products;

ALTER TABLE customers
ADD referrer_id INT;

UPDATE customers
SET referrer_id = 1
WHERE customer_id IN (2, 3);

UPDATE customers
SET referrer_id = 2
WHERE customer_id = 4;

UPDATE customers
SET referrer_id = 3
WHERE customer_id = 5;

SELECT 
    c1.customer_name AS Customer,
    c2.customer_name AS Referrer
FROM customers c1
LEFT JOIN customers c2
ON c1.referrer_id = c2.customer_id;






