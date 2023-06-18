create database mountains;
use mountains;
CREATE TABLE mountains (
    id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(100) NOT NULL,
    CONSTRAINT pk_mountains_id PRIMARY KEY (id)
);

insert into mountains(name) values("Rila"),("Pirin");

select * from mountains;

CREATE TABLE peaks (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    mountain_id INT NOT NULL,
    CONSTRAINT fk_peaks_mountain_id_mountains_id
    FOREIGN KEY (mountain_id)
        REFERENCES mountains (id)
);

insert into peaks(name,mountain_id)
values("Musala",1),("Vihren",2);
select * from peaks;

select p.id, p.name, mountains.name from peaks as p
join mountains on p.mountain_id =mountains.id;


use camp;
select * from campers;
select driver_id,vehicle_type, concat_ws(" ",first_name,last_name) as "driver_name" from vehicles
join campers on  driver_id = campers.id;

drop table peaks;
drop table mountains;

CREATE TABLE mountains (
    id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(100) NOT NULL,
    CONSTRAINT pk_mountains_id PRIMARY KEY (id)
);
CREATE TABLE peaks (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    mountain_id INT NOT NULL,
    CONSTRAINT fk_peaks_mountain_id_mountains_id
    FOREIGN KEY (mountain_id)
        REFERENCES mountains (id)
        on delete cascade
);
insert into peaks(name,mountain_id)
values("Musala",1),("Vihren",2);
insert into mountains(name) values("Rila"),("Pirin");
delete from mountains where id = 2;
select * from mountains;
select * from peaks;

create database demo;
use demo;

create table clients(
id int primary key auto_increment not null,
client_name varchar(100)
);

create table projects(
id int auto_increment not null primary key,
client_id int,
project_lead_id int,
constraint fk_projects_client_id_clients_id
foreign key (client_id)
references clients(id)
);
create table employees(
id int auto_increment not null primary key,
first_name varchar(30),
last_name varchar(30),
project_id int,
constraint fr_employees_project_id__projects_id
foreign key (project_id)
references projects(id)
);
alter table projects
add constraint fk_projects_project_lead_id__employee_id
foreign key (project_lead_id)
references employees(id);



-- 3
SELECT 
    starting_point,
    end_point,
    leader_id,
    CONCAT_WS(' ', first_name, last_name) AS 'leader_name'
FROM
    routes
        JOIN
    campers ON routes.leader_id = campers.id;

