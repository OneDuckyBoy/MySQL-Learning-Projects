create database instagraph_db;
use instagraph_db;

create table pictures(
id int primary key auto_increment,
path varchar(255) not null,
size decimal(10,2) not null
);

create table users(
id int primary key auto_increment,
username varchar(30) not null unique,
password varchar(30) not null,
profile_picture_id int,
foreign key (profile_picture_id)
	references pictures(id)
);

create table posts(
id int primary key auto_increment,
caption varchar(255) not null,
user_id int not null,
foreign key (user_id)references users(id),
picture_id int not null,
foreign key (picture_id) references pictures(id)
);

create table comments(
id int primary key auto_increment,
content varchar(255) not null,
user_id int not null,
foreign key (user_id)references users(id),
post_id int not null,
foreign key(post_id)references posts(id)
);

create table users_followers(
user_id int,
foreign key (user_id) references users(id),
follower_id int,
foreign key (follower_id) references users(id)
);

 -- 2
 SET FOREIGN_KEY_CHECKS=0;
insert into comments (content, user_id,post_id  )
	select concat("Omg!",users.username,"!This is so cool!"), ceil(posts.id *3 /2) ,posts.id from posts
		join users on posts.user_id= users.id
		where users.id between 1 and 10;
        
 -- 3 tbd
select count(follower_id) from users_followers as f
join users as u on f.user_id = u.id
group by u.username
having u.username = "UnderSinduxrein";
 
update users
set
profile_picture_id = (select count(follower_id) from users_followers as f
join users as u on f.user_id = u.id
group by u.username
having u.username = username)
where profile_picture_id is null;

-- 4

select count(user_id) from users_followers as f
join users as u on f.follower_id = u.id
group by u.username
;
delete from users
where (select count(follower_id) from users_followers as f
join users as u on f.user_id = u.id
group by u.username) = 0 and(select count(user_id) from users_followers as f
join users as u on f.follower_id = u.id
group by u.username
)=0
;

-- 5
select id,username from users
order by id;

-- 6
select id,username from users
where id in (SELECT  user_id FROM instagraph_db.users_followers
where user_id = follower_id)
order by id;

-- 7
SELECT * FROM instagraph_db.pictures
order by size desc;

-- 8
