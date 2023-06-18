create database minions1;
use minions1;
CREATE TABLE minions (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    age INT 
);
drop table minions;
create table towns(
	town_id int primary key auto_increment not null,
    name varchar(50) not null
);
alter table minions
add town_id int not null;
alter table minions
add foreign key (town_id) references towns(id);

insert towns(name) values('Sofia');
insert towns(name) values('Plovdiv');
insert towns(name) values('Varna');

insert minions (name,age, town_id) values('Kevin',22,1);
insert minions (name,age, town_id) values('bob',15,3);
insert minions (name,age, town_id) values('Kevin',22,1);

drop TABLE towns;








CREATE TABLE people (
    id INT UNIQUE AUTO_INCREMENT,
    name VARCHAR(200) NOT NULL,
    picture BLOB,
    height float,
    weight float,
    gender CHAR(1) CHECK (Gender IN ('m' , 'f')), 
    birthdate date NOT NULL,
	biography VARCHAR(8000) 
);
drop table people;
alter table people
modify column id int AUTO_INCREMENT primary key;

insert people(name,height,weight,gender,birthdate,biography)
values('Joe Mama',169,69,'m',2000-05-01,'He was a good little boy.');
insert people(name,height,weight,gender,birthdate,biography)
values('Joe Mama1',169,69,'m',2000-05-01,'He was a good little boy.');
insert people(name,height,weight,gender,birthdate,biography)
values('Joe Mama2',169,69,'m',2000-05-01,'He was a good little boy.');
insert people(name,height,weight,gender,birthdate,biography)
values('Joe Mama3',169,69,'m',2000-05-01,'He was a good little boy.');
insert people(name,height,weight,gender,birthdate,biography)
values('Joe Mama4',169,69,'m',2000-05-01,'He was a good little boy.');
SELECT * FROM minions1.people;

create table users(
id int primary key auto_increment not null,
username varchar(30) not null,
password varchar(26) not null,
profile_picture blob,
last_login_time timestamp,
is_deleted boolean
);
insert users(username,`password`,is_deleted)values('joe','joethegreat',false);
insert users(username,`password`,is_deleted)values('joe2','joethemighty',true);
insert users(username,`password`,is_deleted)values('joe3','joethegood',true);
insert users(username,`password`,is_deleted)values('joe4','joethemid',true);
insert users(username,`password`,is_deleted)values('joe5','joethebad',true);

alter table users
drop primary key;
drop table users;


-- select curtime();

-- 22:16:33	alter table users  alter column last_login_time set default  getdate()	Error Code: 1064. You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'getdate()' at line 2	0.000 sec










