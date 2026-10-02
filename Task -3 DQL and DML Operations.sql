 USE scales;
 select * from products;
 
 SELECT productCode,productName,buyPrice 
 from products where buyprice>100;
 
 SELECT customerNumber,customerName,city,state  
 From Customers Where state  = "Tamil Nadu";
 
SELECT employeeNumber, firstName, lastName, jobTitle 
FROM employees WHERE jobTitle = 'Sales Rep';

SELECT productName, buyPrice
FROM products ORDER BY buyPrice ;

INSERT INTO customers(customerNumber, customerName, contactLastName, contactFirstName, phone, addressLine1, city, country)
VALUES
(5001, 'ABC Traders', 'Kumar', 'Ravi', '9876543210',
 '10 Main Road', 'Nellore', 'India');
 select *from Customers;
 
 UPDATE customers
SET phone = '9999999999'
WHERE customerNumber = 5001;

UPDATE products
SET buyPrice = buyPrice * 1.10
WHERE productCode = 'S18_1749';
select *from products;

DELETE FROM customers
WHERE customerNumber = 5001;
select *from Customers;

SELECT customerNumber, customerName, city, country
FROM customers
WHERE city = "Bangalore";
 
 
 
 
 
 