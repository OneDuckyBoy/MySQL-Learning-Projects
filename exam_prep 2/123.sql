create database online_store;
use online_store;

CREATE TABLE `customers`(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `first_name` VARCHAR(20) NOT NULL,
    `last_name` VARCHAR(20) NOT NULL,
    `phone` VARCHAR(30) NOT NULL UNIQUE,
    `address` VARCHAR(60) NOT NULL,
    `discount_card` BIT NOT NULL DEFAULT 0
);

CREATE TABLE `orders`(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `order_datetime` DATETIME NOT NULL,
    `customer_id` INT NOT NULL,
    CONSTRAINT `fk_orders_customer` FOREIGN KEY (`customer_id`)
    REFERENCES `customers` (`id`)
);

CREATE TABLE `reviews`(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `content` TEXT,
    `rating` DECIMAL(10, 2) NOT NULL,
    `picture_url` VARCHAR(80)    NOT NULL,
    `published_at` DATETIME NOT NULL
);

CREATE TABLE `brands`(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE `categories`(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE `products`(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(40)    NOT NULL,
    `price` DECIMAL(19, 2) NOT NULL,
    `quantity_in_stock` INT,
    `description` TEXT,
    `brand_id` INT NOT NULL,
    `category_id` INT NOT NULL,
    `review_id` INT,
    CONSTRAINT `fk_products_brands` FOREIGN KEY (`brand_id`)
        REFERENCES `brands` (`id`),
    CONSTRAINT `fk_products_reviews` FOREIGN KEY (`review_id`)
        REFERENCES `reviews` (`id`),
    CONSTRAINT `fk_products_categories` FOREIGN KEY (`category_id`)
        references `categories` (`id`)
);

CREATE TABLE `orders_products`(
     `order_id` INT,
     `product_id` INT,
     KEY `pk_orders_products`(`order_id`,`product_id`),
     CONSTRAINT `fk_orders_product_orders` FOREIGN KEY(`order_id`)
         REFERENCES `orders`(`id`),
     CONSTRAINT `fk_orders_products_products` FOREIGN KEY(`product_id`)
         REFERENCES `products`(`id`)
);



-- 2

insert into reviews(content,picture_url,published_at,rating)
select left(p.description,15),reverse(p.name) , "2010-10-10" , p.price/8 from products as p
where id>=5;

-- 3
update products
set quantity_in_stock = quantity_in_stock-5
where quantity_in_stock between 60 and 70;

-- 4
delete from customers 
where customers.id not in (select distinct customer_id from orders);
select distinct customer_id from orders;

-- 5
select id, name from categories
order by name desc;

-- 6
select id,brand_id,name,quantity_in_stock from products
where price >1000 and quantity_in_stock <30
order by quantity_in_stock,id;

-- 7
select id, r.content, rating,picture_url, published_at from reviews as r 
where left(r.content ,2)= "My" and length(r.content)>61
order by rating desc;

-- 8
select concat(first_name ," " ,last_name) as full_name, address, min(o.order_datetime) as order_date from customers as c
join orders as o on c.id = o.customer_id 
group by o.customer_id
having year(order_date) <=2018
order by full_name desc;

-- 9
select count(*) as items_count,categories.name,sum(quantity_in_stock) as total_quantity   from products
join categories on category_id = categories.id
group by category_id
order by items_count desc,total_quantity;

-- 10
DELIMITER $$
create function udf_customer_products_count(name123 VARCHAR(30)) returns int
deterministic
begin
return(select count(product_id) from online_store.customers as c
join online_store.orders as o on c.id = o.customer_id
join online_store.orders_products as op on o.id = op.order_id
where first_name = name123);

end $$
delimiter ;
select count(product_id) from online_store.customers as c
join online_store.orders as o on c.id = o.customer_id
join online_store.orders_products as op on o.id = op.order_id
where first_name = 'Shirley';
SELECT c.first_name,c.last_name, udf_customer_products_count('Shirley') as `total_products` FROM customers c
WHERE c.first_name = 'Shirley';

-- 11
delimiter $$
create procedure udp_reduce_price ( category_name varchar(50))
begin
update products as p

join categories as c on p.category_id = c.id
join reviews as r on review_id = r.id
set p.price = p.price - p.price*0.3
where c.name = category_name and rating <4 ;
end $$
delimiter ;
select p.price from products as p
join categories as c on p.category_id = c.id
join reviews as r on review_id = r.id
where c.name = 'Phones and tablets' and rating <4 ;


update products as p

join categories as c on p.category_id = c.id
join reviews as r on review_id = r.id
set p.price = p.price - p.price*0.3
where c.name = 'Phones and tablets' and rating <4 ;