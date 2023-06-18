create database minions; 
use minions;
-- 1
 CREATE TABLE minions (
     `id` INT PRIMARY KEY AUTO_INCREMENT,
     `name` VARCHAR(50),
     `age` INT
 );
 CREATE TABLE towns (
     `town_id` INT PRIMARY KEY AUTO_INCREMENT,
     `name` VARCHAR(50)
 );
 

-- 2 

 alter table minions 
 add column town_id int;
 
 alter table minions
 add constraint fk_minions_towns
 foreign key minions(town_id)
 references towns(town_id);
 
 -- 3
 
 insert into towns(town_id,name) values
 (1,'Sofia'),
 (2,'Plovdiv'),
 (3,'Varna');
 
 insert into minions(name,age,town_id)
 values
 ('Kevin',22,1),
 ('Bob',15,3),
 ('Steward',null,2);
 
 select * from minions;
 
 -- 4
 
truncate table minions;
 
 -- 5\
 
drop table minions;
drop table towns;


use gamebar;
drop table emplyees;
create table employees(
id int primary key not null AUTO_INCREMENT,
first_name varchar(50),
last_name varchar(50)
);
create table categories(
id int primary key not null AUTO_INCREMENT,
`name` varchar(45) not null
);
drop table products;
create table products(
id int primary key not null AUTO_INCREMENT,
`name` varchar(45) not null,
category_id int,
foreign key (category_id) REFERENCES categories(id)
);


create database gamebar1;
use gamebar1;
create table employees(
id int primary key auto_increment,
first_name varchar(50) not null,
last_name varchar(50) not null
);
create table categories(
id int primary key auto_increment,
name varchar(50) not null
);
create table products(
id int primary key auto_increment,
name varchar(50) not null,
category_id int not null
);
insert into employees (first_name,last_name) values('Joe','Mama');
insert into employees (first_name,last_name) values('Joe1','Mama1');
insert into employees (first_name,last_name) values('Joe2','Mama2');
SELECT * FROM gamebar1.employees;
alter table employees add middle_name varchar(50) not null; 

alter table products
add foreign key (category_id) references categories(id);

alter table employees
modify column middle_name varchar(50);

 
 