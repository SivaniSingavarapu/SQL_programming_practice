CREATE DATABASE scales;
USE scales;
CREATE TABLE productlines(productLine varchar(50) primary key,
                      textDescription varchar(4000),
                      htmlDescription text,
                      image blob);
create Table Offices(
officeCode varchar(10) primary key,
city  varchar(50),
phone varchar(50),
addressLine1 varchar(50),
addressLine2 varchar(50),
state varchar(50),
country varchar(50),
postalCode varchar(20),
territory varchar(10));

Create table Employees(
employeeNumber  int primary key,
lastName varchar(50),
firstName varchar(50),
extension varchar(10),
email varchar(100),
officeCode varchar(10),
reportsTo int,
jobTitle varchar(50),
foreign key(officeCode) references offices(officecode),
foreign key(reportsTo) references Employees(employeeNumber));

create table Customers(
customerNumber int primary key,
customerName varchar(50),
contactLastName  varchar(50),
contactFirstName  varchar(50),
phone  varchar(50),
addressLine1  varchar(50),
addressLine2  varchar(50),
city varchar(50),
state  varchar(50),
postalCode  varchar(20),
country  varchar(50),
salesRepEmployeeNumber int,
creditLimit decimal(10,2),
foreign key(salesRepEmployeeNumber) references Employees(employeeNumber));

CREATE TABLE products(
    productCode VARCHAR(15) PRIMARY KEY,
    productName VARCHAR(70),
    productLine VARCHAR(50),
    productScale VARCHAR(10),
    productVendor VARCHAR(50),
    productDescription TEXT,
    quantityInStock INT,
    buyPrice DECIMAL(10,2),
    MSRP DECIMAL(10,2),

    FOREIGN KEY(productLine)
        REFERENCES productlines(productLine)
);

CREATE TABLE orders(
    orderNumber INT PRIMARY KEY,
    orderDate DATE,
    requiredDate DATE,
    shippedDate DATE,
    status VARCHAR(15),
    comments TEXT,
    customerNumber INT,

    FOREIGN KEY(customerNumber)
        REFERENCES customers(customerNumber)
);

CREATE TABLE orderdetails(
    orderNumber INT,
    productCode VARCHAR(15),
    quantityOrdered INT,
    priceEach DECIMAL(10,2),
    orderLineNumber INT,

    PRIMARY KEY(orderNumber, productCode),

    FOREIGN KEY(orderNumber)
        REFERENCES orders(orderNumber),

    FOREIGN KEY(productCode)
        REFERENCES products(productCode)
);

CREATE TABLE payments(
    customerNumber INT,
    checkNumber VARCHAR(50),
    paymentDate DATE,
    amount DECIMAL(10,2),

    PRIMARY KEY(customerNumber, checkNumber),

    FOREIGN KEY(customerNumber)
        REFERENCES customers(customerNumber)
);

insert into productlines values ('Classic Cars', 'Vintage and classic model cars', NULL, NULL),
  ('Motorcycles', 'Racing and sports bikes', NULL, NULL),
  ('Planes', 'Commercial and military aircraft models', NULL, NULL),
  ('Ships', 'Sailing ships and ocean liner replicas', NULL, NULL),
  ('Trains', 'Locomotive and railway models', NULL, NULL),
  ('Trucks and Buses', 'Heavy vehicle and public transport models', NULL, NULL),
  ('Vintage Cars', 'Pre-1960 antique automobile models', NULL, NULL),
  ('Scooters', 'Classic and modern scooter models', NULL, NULL),
  ('Race Cars', 'Formula and rally racing car models', NULL, NULL),
  ('Boats', 'Speed boats and fishing vessel models', NULL, NULL);
  
 insert into  Offices values   ('1', 'Chennai', '+91-44-12345678', 'T Nagar', NULL, 'Tamil Nadu', 'India', '600017', 'APAC'),
  ('2', 'Bangalore', '+91-80-87654321', 'MG Road', NULL, 'Karnataka', 'India', '560001', 'APAC'),
  ('3', 'Mumbai', '+91-22-23456789', 'Andheri East', 'Marol', 'Maharashtra', 'India', '400059', 'APAC'),
  ('4', 'Delhi', '+91-11-34567890', 'Connaught Place', NULL, 'Delhi', 'India', '110001', 'APAC'),
  ('5', 'Hyderabad', '+91-40-45678901', 'Banjara Hills', 'Road No 12', 'Telangana', 'India', '500034', 'APAC'),
  ('6', 'Pune', '+91-20-56789012', 'Koregaon Park', NULL, 'Maharashtra', 'India', '411001', 'APAC'),
  ('7', 'Kolkata', '+91-33-67890123', 'Salt Lake Sector V', NULL, 'West Bengal', 'India', '700091', 'APAC'),
  ('8', 'Ahmedabad', '+91-79-78901234', 'SG Highway', 'Bodakdev', 'Gujarat', 'India', '380054', 'APAC'),
  ('9', 'Jaipur', '+91-141-8901234', 'MI Road', NULL, 'Rajasthan', 'India', '302001', 'APAC'),
  ('10', 'Kochi', '+91-484-9012345', 'Marine Drive', NULL, 'Kerala', 'India', '682031', 'APAC');

   
 insert into  Employees values  (1002, 'Kumar', 'Arun', 'x101', 'arun.kumar@classic.com', '1', NULL, 'Sales Manager'),
  (1056, 'Ravi', 'Suresh', 'x102', 'suresh.ravi@classic.com', '1', 1002, 'Sales Rep'),
  (1076, 'Sharma', 'Neha', 'x103', 'neha.sharma@classic.com', '2', 1002, 'Sales Rep'),
  (1088, 'Iyer', 'Priya', 'x104', 'priya.iyer@classic.com', '3', 1002, 'Sales Rep'),
  (1102, 'Mehta', 'Rohan', 'x105', 'rohan.mehta@classic.com', '4', 1002, 'Sales Rep'),
  (1143, 'Reddy', 'Kavya', 'x106', 'kavya.reddy@classic.com', '5', 1002, 'Sales Rep'),
  (1165, 'Deshpande', 'Aditya', 'x107', 'aditya.deshpande@classic.com', '6', 1002, 'Sales Rep'),
  (1188, 'Banerjee', 'Riya', 'x108', 'riya.banerjee@classic.com', '7', 1002, 'Sales Rep'),
  (1216, 'Shah', 'Karan', 'x109', 'karan.shah@classic.com', '8', 1002, 'Sales Rep'),
  (1230, 'Singh', 'Pooja', 'x110', 'pooja.singh@classic.com', '9', 1002, 'Sales Rep'),
  (1245, 'Nair', 'Vishnu', 'x111', 'vishnu.nair@classic.com', '10', 1002, 'Sales Rep'),
  (1260, 'Gupta', 'Ananya', 'x112', 'ananya.gupta@classic.com', '4', 1002, 'Sales Rep');


 insert into Customers  values   (2001, 'ABC Traders', 'Rao', 'Vikram', '+91-9876543210', 'Anna Nagar', NULL, 'Chennai', 'Tamil Nadu', '600040', 'India', 1056, 150000),
  (2002, 'XYZ Electronics', 'Patel', 'Amit', '+91-9123456789', 'Indiranagar', NULL, 'Bangalore', 'Karnataka', '560038', 'India', 1076, 200000),
  (2003, 'Sunrise Collectibles', 'Joshi', 'Meera', '+91-9988776655', 'Bandra West', 'Hill Road', 'Mumbai', 'Maharashtra', '400050', 'India', 1088, 180000),
  (2004, 'Heritage Models', 'Verma', 'Rajesh', '+91-9876012345', 'Karol Bagh', NULL, 'Delhi', 'Delhi', '110005', 'India', 1102, 250000),
  (2005, 'Deccan Hobby House', 'Rao', 'Sandeep', '+91-9011223344', 'Jubilee Hills', NULL, 'Hyderabad', 'Telangana', '500033', 'India', 1143, 175000),
  (2006, 'Pune Model World', 'Kulkarni', 'Sneha', '+91-9822334455', 'FC Road', 'Shivajinagar', 'Pune', 'Maharashtra', '411005', 'India', 1165, 120000),
  (2007, 'Eastern Diecast Hub', 'Chatterjee', 'Arjun', '+91-9933445566', 'Park Street', NULL, 'Kolkata', 'West Bengal', '700016', 'India', 1188, 160000),
  (2008, 'Gujarat Miniatures', 'Desai', 'Hetal', '+91-9898123456', 'CG Road', 'Navrangpura', 'Ahmedabad', 'Gujarat', '380009', 'India', 1216, 140000),
  (2009, 'Royal Replicas', 'Rathore', 'Devendra', '+91-9414012345', 'C Scheme', NULL, 'Jaipur', 'Rajasthan', '302005', 'India', 1230, 130000),
  (2010, 'Coastal Collectors', 'Menon', 'Lakshmi', '+91-9847012345', 'MG Road', 'Ernakulam', 'Kochi', 'Kerala', '682035', 'India', 1245, 110000),
  (2011, 'Metro Scale Models', 'Khanna', 'Sahil', '+91-9810123456', 'Lajpat Nagar', NULL, 'Delhi', 'Delhi', '110024', 'India', 1260, 220000),
  (2012, 'Silicon Toys & Models', 'Hegde', 'Divya', '+91-9886123456', 'Koramangala', '5th Block', 'Bangalore', 'Karnataka', '560095', 'India', 1076, 190000);

     
     insert into products  values
  ('S10_1678', '1969 Harley Davidson', 'Motorcycles', '1:10', 'Min Lin Diecast', 'Classic Harley Davidson bike model', 100, 4800, 6500),
  ('S12_1099', '1968 Ford Mustang', 'Classic Cars', '1:12', 'Autoart Studio', 'Classic Ford Mustang model', 50, 9500, 12000),
  ('S12_3380', '1957 Chevy Bel Air', 'Classic Cars', '1:12', 'Carousel DieCast', 'Detailed Chevy Bel Air with opening doors', 75, 7800, 10500),
  ('S18_2248', '1947 Royal Enfield', 'Motorcycles', '1:18', 'Min Lin Diecast', 'Vintage Royal Enfield motorcycle model', 120, 3200, 4500),
  ('S18_3140', 'Boeing 747 Jumbo Jet', 'Planes', '1:180', 'SkyScale Models', 'Boeing 747 with detailed livery', 60, 5600, 7800),
  ('S24_2000', 'HMS Victory', 'Ships', '1:240', 'Oceanic Replicas', 'Wooden sailing warship replica', 40, 8900, 11500),
  ('S24_3151', 'Indian Railways WP Steam Engine', 'Trains', '1:24', 'RailWorks Studio', 'Classic Indian steam locomotive model', 55, 6700, 9000),
  ('S32_1268', 'Tata 1613 Truck', 'Trucks and Buses', '1:32', 'HeavyHaul Models', 'Indian cargo truck replica', 90, 2800, 4000),
  ('S32_4485', '1936 Mercedes Benz 500K', 'Vintage Cars', '1:32', 'Autoart Studio', 'Luxury vintage roadster model', 35, 10200, 13500),
  ('S50_1392', 'Vespa 150 Classic', 'Scooters', '1:10', 'Min Lin Diecast', 'Retro Vespa scooter model', 150, 2100, 3200),
  ('S50_4713', 'Ferrari F1 2024', 'Race Cars', '1:18', 'SpeedLine Replicas', 'Formula 1 racing car model', 80, 7200, 9800),
  ('S72_3212', 'Kerala Fishing Boat', 'Boats', '1:72', 'Oceanic Replicas', 'Traditional fishing vessel model', 65, 1800, 2800);


insert into orders  values  (30001, '2026-01-10', '2026-01-15', '2026-01-13', 'Shipped', 'Delivered on time', 2001),
  (30002, '2026-01-12', '2026-01-18', NULL, 'In Process', NULL, 2002),
  (30003, '2026-01-20', '2026-01-27', '2026-01-25', 'Shipped', 'Customer requested gift wrap', 2003),
  (30004, '2026-02-02', '2026-02-09', '2026-02-06', 'Shipped', NULL, 2004),
  (30005, '2026-02-10', '2026-02-17', '2026-02-15', 'Shipped', 'Fragile items, handled with care', 2005),
  (30006, '2026-02-18', '2026-02-25', NULL, 'Cancelled', 'Customer cancelled due to delay', 2006),
  (30007, '2026-03-01', '2026-03-08', '2026-03-05', 'Shipped', NULL, 2007),
  (30008, '2026-03-10', '2026-03-17', '2026-03-14', 'Shipped', 'Express delivery requested', 2008),
  (30009, '2026-03-22', '2026-03-29', NULL, 'On Hold', 'Awaiting payment confirmation', 2009),
  (30010, '2026-04-05', '2026-04-12', '2026-04-10', 'Shipped', NULL, 2010),
  (30011, '2026-04-15', '2026-04-22', NULL, 'In Process', NULL, 2011),
  (30012, '2026-04-25', '2026-05-02', '2026-04-30', 'Shipped', 'Repeat customer discount applied', 2012);


insert into  OrderDetails values(30001, 'S10_1678', 2, 6500, 1),
  (30002, 'S12_1099', 1, 12000, 1),
  (30003, 'S12_3380', 1, 10500, 1),
  (30003, 'S18_2248', 2, 4500, 2),
  (30004, 'S18_3140', 1, 7800, 1),
  (30005, 'S24_2000', 1, 11500, 1),
  (30006, 'S24_3151', 1, 9000, 1),
  (30007, 'S32_1268', 3, 4000, 1),
  (30008, 'S32_4485', 1, 13500, 1),
  (30009, 'S50_1392', 2, 3200, 1),
  (30010, 'S72_3212', 2, 2800, 1),
  (30011, 'S50_4713', 1, 9800, 1),
  (30012, 'S12_1099', 1, 12000, 1);
  
  insert into  Payments values(2001, 'CHK1001', '2026-01-16', 13000),
  (2002, 'CHK1002', '2026-01-17', 12000),
  (2003, 'CHK1003', '2026-01-26', 19500),
  (2004, 'CHK1004', '2026-02-07', 7800),
  (2005, 'CHK1005', '2026-02-16', 11500),
  (2007, 'CHK1006', '2026-03-06', 12000),
  (2008, 'CHK1007', '2026-03-15', 13500),
  (2010, 'CHK1008', '2026-04-11', 5600),
  (2012, 'CHK1009', '2026-05-01', 12000),
  (2001, 'CHK1010', '2026-05-10', 6500),
  (2011, 'CHK1011', '2026-05-15', 9800),
  (2006, 'CHK1012', '2026-05-20', 4000);
 

select *from productlines;
select *from offices ;
select *from  Employees;
select *from Customers;
select *from products ;
select *from orders ;
select *from OrderDetails;
select *from Payments;