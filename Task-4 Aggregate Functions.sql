 USE scales;
 SELECT count(*) AS total_customers
 from customers;
 
 select avg(buyprice) AS average_product_price 
 from products;
 
 select max(buyprice) AS highest_product_price
 from products;
 
 ### WHERE
 select COUNT(*) as Bangolore_customers
 from customers
 WHERE state = " Bangalore";
 
 SELECT AVG(buyPrice) AS average_price
FROM products
WHERE buyPrice > 50;

SELECT MAX(amount) AS highest_payment
FROM payments
WHERE amount > 0;

SELECT country, COUNT(*) AS total_customers
FROM customers
GROUP BY country;

SELECT productLine, AVG(buyPrice) AS average_price
FROM products
GROUP BY productLine;

SELECT customerNumber, SUM(amount) AS total_payment
FROM payments
GROUP BY customerNumber;

SELECT productName, buyPrice
FROM products
WHERE buyPrice > (
    SELECT AVG(buyPrice)
    FROM products
);
 
 
 