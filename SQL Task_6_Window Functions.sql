use  Ecommerce_db;
select*,
Rank()over(order by quantity desc) as rk
from orders;

select*,
dense_rank()over(order by quantity desc) as drk
from orders;

select*,
sum(quantity)over(partition by customer_id) as total_quantity
from orders;

select*,
 avg(quantity) over(partition by customer_id) as total_quantity
from orders;

select*,
 lag(quantity) over(order by order_date) as previous_quantity
from orders;

select*,
 count(*) over(partition by customer_id) as total_orders
from orders;

select*,
 lead(quantity) over(order by order_date) as next_quantity
from orders;

### Task - 2
 DELIMITER //

CREATE PROCEDURE GetAllProducts()
BEGIN
    SELECT * FROM products;
END //
DELIMITER ;
 CALL GetAllProducts();


 DELIMITER //
CREATE PROCEDURE GetProductsByCategory(IN p_category VARCHAR(50))
BEGIN
    SELECT *
    FROM products
    WHERE category = p_category;
END //

DELIMITER ;
CALL GetProductsByCategory('Electronics');

DELIMITER //
CREATE PROCEDURE GetProductsAbovePrice(IN p_price DECIMAL(10,2))
BEGIN
    SELECT *
    FROM products
    WHERE price > p_price;
END //

DELIMITER ;
CALL GetProductsAbovePrice(1000);