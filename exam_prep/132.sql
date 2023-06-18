-- 1
drop database restaurant_db;
create database restaurant_db;
use restaurant_db;


create table products(
id int primary key auto_increment,
name varchar(30) not null unique,
type varchar(30) not null,
price decimal(10,2) not null
);

create table clients(
id int primary key auto_increment,
first_name varchar(50) not null,
last_name varchar(50) not null,
birthdate date not null,
card varchar(50),
review text
);

create table `tables`(
id int primary key auto_increment,
floor int not null,
reserved bool not null default false,
capacity int not null
);
create table waiters(
id int primary key auto_increment,
first_name varchar(50) not null,
last_name varchar(50) not null,
email varchar(50) not null,
phone varchar(50),
salary decimal(10,2)
);

create table orders(
id int primary key auto_increment,
table_id int not null,
waiter_id int not null,
order_time time not null,
payed_status bool not null default false
);

create table orders_clients(
order_id int,
client_id int,
foreign key(order_id)
	references orders(id),
foreign key(client_id)
	references clients(id)
);

create table orders_products(
order_id int,
product_id int,
foreign key(order_id)
	references orders(id),
foreign key(product_id)
	references products(id)
);


-- 2

-- insert into products(name,type,price)
-- select concat(w.last_name , " " , "specialty") as name,"Cocktail",ceil(w.salary/100)
-- from waiters as w
-- where w.id>6;

-- 3
-- update orders as o
-- set o.table_id= o.table_id-1
-- where o.id between 12 and 23;

-- 4
#delete from waiters
select * from waiters
where id not in(select waiter_id from orders);

-- 5
select id, first_name, last_name,birthdate,card,review 
from clients
order by birthdate desc,id desc;

-- 6
select first_name, last_name, birthdate, review from clients
where card is null and year(birthdate) between 1978 and 1993
order by last_name desc, id asc
limit 5;

-- 7
select concat(last_name ,first_name ,LENGTH(first_name), "Restaurant") as username,
	   concat(reverse(substr(email,2,12))) as `password`
from waiters
order by password desc;

-- 8  TBD
select id,name,round(count(*)/2,0) as `count` from products
right join orders_products 
on id = orders_products.order_id

group by order_id
having `count`>=5 
order by round(count(*)/2,0) desc,name asc;

-- 9
-- select id as table_id, capacity, count() as count_clients
-- from tables
-- where floor =1;


-- 10
delimiter $$
create function udf_client_bill(full_name VARCHAR(50)) 

returns DECIMAL(19,2)
deterministic
begin
return (select sum(price) as bill from products where id in 
(select product_id from orders_products where order_id= 
(select order_id from orders_clients where client_id = (select id FROM clients c
WHERE c.first_name = SUBSTRING_INDEX(full_name, ' ', 1) AND c.last_name= SUBSTRING_INDEX(full_name, ' ', -1)) ) ));

return 0;
end  $$
delimiter ;
drop function udf_client_bill;
SELECT c.first_name,c.last_name, udf_client_bill('Silvio Blyth') as 'bill' FROM clients c
WHERE c.first_name = 'Silvio' AND c.last_name= 'Blyth';


 SELECT 
    SUM(price) AS bill
FROM
    products
WHERE
    id IN (SELECT 
            product_id
        FROM
            orders_products
        WHERE
            order_id in 
            (SELECT 
                    order_id
                FROM
                    orders_clients
                WHERE
                    client_id = 
				(SELECT 
						id
					FROM
						clients c
					WHERE
				c.first_name = 'Silvio'
						AND c.last_name = 'Blyth')));


-- 11
delimiter $$
create procedure udp_happy_hour ( type VARCHAR(50))
begin
update products as p
set p.price= if(price>=10,price-price*0.2,price)
where p.type = "Cognac";
end $$
delimiter ;
select p.type,p.price from products as p
where p.type = "Cognac";
update products as p
set p.price= if(price>=10,price-price*0.2,price)
where p.type = "Cognac";

CALL udp_happy_hour ('Cognac');
