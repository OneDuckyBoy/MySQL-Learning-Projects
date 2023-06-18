create database table_relations;
use table_relations;
create table passports(
passport_id int primary key auto_increment,
passport_number varchar(8) unique
);

create table people(
person_id int not null unique auto_increment,
first_name varchar(50) not null ,
salary decimal(10,2) default 0,
passport_id int unique
);

alter table people
add constraint pk_people
primary key (person_id),
add constraint fk_people_passports
foreign key (passport_id)
references passports(passport_id);

insert into passports(passport_id,passport_number)
values(101,"N34FG21B"),
(102,"K65LO4R7"),
(103,"ZE657QP2");

insert into people(first_name,salary,passport_id)
values("Roberto",43300,102),
("Tom",56100,103),
("Yana",60200,101);






CREATE TABLE manifacturers (
    manifacturer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) UNIQUE NOT NULL,
    established_on DATE NOT NULL # DEFAULT NOW()
);
create table models(
model_id int primary key auto_increment,
name varchar(50) not null,
manifacturer_id int,
constraint fk_models_manifacturers
foreign key(manifacturer_id)
references manifacturers(manifacturer_id)
);
alter table models auto_increment = 101;

insert into manifacturers value(44,"Joe",'2023-05-27');
insert into manifacturers(name,established_on) 
values("BMW","1916-03-01"),("Tesla","2003-01-01"),("Lada","1966-05-01");
#select * from manifacturers;

insert into models(name,manifacturer_id)
values("X1",1),("i6",1),("Model S",2),("Model X",2),("Model 3",2),("Nova",3);


create table students(
student_id	int not null auto_increment primary key,
name varchar(50) not null
);
create table exams(
exam_id int not null auto_increment primary key,
name varchar(50) not null
);
alter table exams auto_increment = 101;
create table students_exams(
student_id int not null,
exam_id int not null,
constraint fk_student_id__students_student_id
foreign key(student_id)
references students(student_id),
constraint fk_exam_id__exams_exam_id
foreign key (exam_id)
references exams(exam_id),
primary key (student_id,exam_id)
);

insert into students(name)
values("Mila"),("Toni"),("Ron");
insert into exams(name)
values("Spring MVC"),("Neo4j"),("Oracle 11g");
insert into students_exams
values(1,101),(1,102),(2,101),(3,103),(2,102),(2,103);
select * from students;
select * from exams;
select * from students_exams;


 -- 4
 drop table teachers;
 create table teachers(
 teacher_id int primary key auto_increment,
 name varchar(50) not null,
 manager_id int,
 constraint sr_fk_manager_id_teacher_id
 foreign key (manager_id) references teachers(teacher_id)
 );
 alter table teachers auto_increment = 101;
 insert into teachers(name,teacher_id)
 values("John",101),("Maya", 102),("Silvia" ,103),("Ted", 104),("Mark", 105),("Greta", 106);
 
 UPDATE `table_relations`.`teachers` SET `manager_id` = '106' WHERE (`teacher_id` = '102');
UPDATE `table_relations`.`teachers` SET `manager_id` = '106' WHERE (`teacher_id` = '103');
UPDATE `table_relations`.`teachers` SET `manager_id` = '105' WHERE (`teacher_id` = '104');
UPDATE `table_relations`.`teachers` SET `manager_id` = '101' WHERE (`teacher_id` = '105');
UPDATE `table_relations`.`teachers` SET `manager_id` = '101' WHERE (`teacher_id` = '106');

 select * from teachers;
 
